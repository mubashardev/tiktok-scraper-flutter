import 'dart:convert';

import 'package:tiktok_scraper/enums.dart';
import 'package:tiktok_scraper/exceptions.dart';
import 'package:tiktok_scraper/models/tiktok_video.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html_parser;

export 'models/tiktok_video.dart';
export 'exceptions.dart';

/// A class to scrape data from TikTok.
///
/// This class provides methods to fetch and parse user and video information
/// from TikTok using specified URLs and paths.
class TiktokScraper {
  /// Fetches and parses the JSON data from the provided URL at the specified
  /// nested path.
  ///
  /// The nested path is a list of keys to traverse the JSON object. The first
  /// key is used to access the root level of the JSON object, and each subsequent
  /// key is used to access the child object.
  ///
  /// If any of the keys are not found in the JSON object, an [Exception] is thrown.
  ///
  /// If the final result is not a [Map], an [Exception] is thrown.
  ///
  /// Returns the final result as a [Map].
  ///
  static Future<Map<String, dynamic>> _data(
      String url, List<String> nestedPath) async {
    // Fetch the response from the provided URL
    var response = await Dio().get(url);

    // Parse the HTML document
    var document = html_parser.parse(response.data);
    var element = document.getElementById('__UNIVERSAL_DATA_FOR_REHYDRATION__');
    String? jsonString = element?.text;

    if (jsonString == null) {
      throw TikTokException('No records found!!');
    }

    // Parse the JSON data
    var data = jsonDecode(jsonString);

    // Traverse the JSON object using the nested path
    dynamic result = data;
    for (var key in nestedPath) {
      if (result is Map<String, dynamic> && result.containsKey(key)) {
        result = result[key];
      } else {
        throw TikTokException(
            'Invalid nested path or data not found for key: $key');
      }
    }

    // Return the final result as a Map
    if (result is Map<String, dynamic>) {
      return result;
    } else {
      throw TikTokException(
          'Expected a Map at the final path but found ${result.runtimeType}');
    }
  }

  /// Fetch user information by username.
  ///
  /// Throws an [Exception] if the username is invalid or the user data is not found.
  ///
  /// Returns a [Author] object containing the user information.
  static Future<Author> getUserInfo(String username) async {
    var url =
        "https://tiktok.com/${username.startsWith('@') ? username : "@$username"}";

    var mainData = await _data(
        url, ['__DEFAULT_SCOPE__', 'webapp.user-detail', 'userInfo']);
    var user = mainData['user'];
    var stats = mainData['stats'];

    if (user == null || stats == null) {
      throw TikTokException(
          "Something went wrong with this user data or username \"$username\" doesn't exist");
    }

    return Author.fromJson({
      'id': user['id'].toString(),
      'username': username,
      'name': user['nickname'].toString(),
      'avatar': user['avatarLarger'].toString(),
      ...stats,
    });
  }

  /// Fetch video information by video URL.
  ///
  /// Throws an [Exception] if the video URL is invalid or the video data is not found.
  ///
  /// Returns a [TiktokVideo] object containing the video information.
  static Future<TiktokVideo> getVideoInfo(String url,
      {ScrapeVideoSource source = ScrapeVideoSource.OfficialSite}) async {
    var mainData = await _data(url,
        ['__DEFAULT_SCOPE__', 'webapp.video-detail', 'itemInfo', 'itemStruct']);
    var videoData = mainData['video'];
    var authorData = mainData['author'];
    var authorStats = mainData['authorStats'];
    List<String> downloadUrls = [];
    if (source == ScrapeVideoSource.OfficialSite) {
      downloadUrls = [
        if (videoData['playAddr'].toString() != "null")
          videoData['playAddr'].toString(),
        if (videoData['downloadAddr'].toString() != "null")
          videoData['downloadAddr'].toString()
      ];
    } else if (source == ScrapeVideoSource.TikDownloader) {
      downloadUrls = await _tikDownloadData(url);
    }

    return TiktokVideo.fromJson({
      'id': mainData['id'].toString(),
      'description': mainData['desc'].toString(),
      'createTime': mainData['createTime'].toString(),
      'height': videoData['height'],
      'width': videoData['width'],
      'duration': videoData['duration'],
      'defaultResolution': videoData['ratio'],
      'thumbnail': videoData['cover'].toString(),
      'downloadUrls': downloadUrls,
      'audioUrl': (mainData['music']?['playUrl']).toString(),
      'author': <String, dynamic>{
        'id': authorData['id'].toString(),
        'username': authorData['uniqueId'].toString(),
        'name': authorData['nickname'].toString(),
        'avatar': authorData['avatarLarger'].toString(),
        ...authorStats
      },
    });
  }

  static Future<List<String>> _tikDownloadData(String url) async {
    var html = (await Dio(
      BaseOptions(
        queryParameters: {
          "q": url,
        },
      ),
    ).post(ScrapeVideoSource.TikDownloader.url))
        .data['data'];
    final document = html_parser.parse(html);
    final elements =
        document.querySelectorAll('a.tik-button-dl.button.dl-success');
    final urls = elements
        .where((element) =>
            element.text.toString().toLowerCase().contains('download mp4'))
        .map((element) => element.attributes['href'] ?? '')
        .where((href) => href.isNotEmpty) // Remove null or empty hrefs
        .toList();
    return urls;
  }
}
