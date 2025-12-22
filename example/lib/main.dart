import 'dart:convert';
import 'package:tiktok_scraper/tiktok_scraper.dart';

void main() async {
  try {
    var username = 'mubashardev';
    var author = await TiktokScraper.getUserInfo(username);

    print(jsonEncode(author.toMap()));

    var videoUrl =
        'https://www.tiktok.com/@mubashardev/video/7393468652906925317';
    var video = await TiktokScraper.getVideoInfo(videoUrl);

    print(jsonEncode(video.toMap()));
  } catch (e) {
    print(e);
  }
}
