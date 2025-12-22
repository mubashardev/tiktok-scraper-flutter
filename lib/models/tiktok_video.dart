/// A TikTok video.
///
/// This class contains the information about a TikTok video.
///
/// The information includes the video ID, description, thumbnail URL, download URL,
/// audio URL, creation time, duration, height, width, default resolution, and the
/// video author.
class TiktokVideo {
  final String id;
  final String description;
  final String thumbnail;
  final List<String> downloadUrls;
  final String audioUrl;
  final String createTime;
  final int duration;
  final int height;
  final int width;
  final String defaultResolution;
  final Author author;

  TiktokVideo({
    required this.id,
    required this.description,
    required this.thumbnail,
    required this.downloadUrls,
    required this.audioUrl,
    required this.createTime,
    required this.duration,
    required this.height,
    required this.width,
    required this.defaultResolution,
    required this.author,
  });

  factory TiktokVideo.fromJson(Map<String, dynamic> json) {
    return TiktokVideo(
      id: json['id'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      downloadUrls: List<String>.from(json['downloadUrls']),
      audioUrl: json['audioUrl'],
      createTime: json['createTime'],
      duration: json['duration'],
      height: json['height'],
      width: json['width'],
      defaultResolution: json['defaultResolution'],
      author: Author.fromJson(json['author']),
    );
  }

  TiktokVideo copyWith({
    String? id,
    String? title,
    String? description,
    String? thumbnail,
    List<String>? downloadUrls,
    String? audioUrl,
    String? createTime,
    int? duration,
    int? height,
    int? width,
    String? defaultResolution,
    Author? author,
  }) {
    return TiktokVideo(
      id: id ?? this.id,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      downloadUrls: downloadUrls ?? this.downloadUrls,
      audioUrl: audioUrl ?? this.audioUrl,
      createTime: createTime ?? this.createTime,
      duration: duration ?? this.duration,
      height: height ?? this.height,
      width: width ?? this.width,
      defaultResolution: defaultResolution ?? this.defaultResolution,
      author: author ?? this.author,
    );
  }

  /// Returns a JSON-encodable map representation of this [TiktokVideo].
  ///
  /// The map will contain the following key-value pairs:
  ///
  /// - `id`: The TikTok video ID.
  /// - `description`: The video description.
  /// - `thumbnail`: The video thumbnail URL.
  /// - `downloadUrl`: The video download URL.
  /// - `audioUrl`: The video audio URL.
  /// - `createTime`: The video creation time in seconds since the Unix epoch.
  /// - `duration`: The video duration in milliseconds.
  /// - `height`: The video height in pixels.
  /// - `width`: The video width in pixels.
  /// - `defaultResolution`: The video default resolution.
  /// - `author`: The video author as a JSON-encodable map.
  ///
  /// This is useful for serializing this object to JSON for e.g. storing in a
  /// database or sending over the network.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'thumbnail': thumbnail,
      'downloadUrls': downloadUrls,
      'audioUrl': audioUrl,
      'createTime': createTime,
      'duration': duration,
      'height': height,
      'width': width,
      'defaultResolution': defaultResolution,
      'author': author.toMap(),
    };
  }

  @override
  bool operator ==(covariant TiktokVideo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.thumbnail == thumbnail &&
        other.downloadUrls == downloadUrls &&
        other.audioUrl == audioUrl &&
        other.createTime == createTime &&
        other.duration == duration &&
        other.height == height &&
        other.width == width &&
        other.defaultResolution == defaultResolution &&
        other.author == author;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        thumbnail.hashCode ^
        downloadUrls.hashCode ^
        audioUrl.hashCode ^
        createTime.hashCode ^
        duration.hashCode ^
        height.hashCode ^
        width.hashCode ^
        defaultResolution.hashCode ^
        author.hashCode;
  }
}

/// A TikTok user.
///
/// This class contains the information about a TikTok user.
///
/// The information includes the user ID, username, name, avatar URL, follower
/// count, following count, video count, heart count, and digg count.
class Author {
  final String id;
  final String username;
  final String name;
  final String avatar;
  final num? followerCount;
  final num? followingCount;
  final num? videoCount;
  final num? heartCount;
  final num? diggCount;

  Author({
    required this.id,
    required this.username,
    required this.name,
    required this.avatar,
    this.followerCount,
    this.followingCount,
    this.videoCount,
    this.heartCount,
    this.diggCount,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      avatar: json['avatar'],
      followerCount: json['followerCount'],
      followingCount: json['followingCount'],
      videoCount: json['videoCount'],
      heartCount: json['heartCount'],
      diggCount: json['diggCount'],
    );
  }

  Author copyWith({
    String? id,
    String? username,
    String? name,
    String? avatar,
    num? followerCount,
    num? followingCount,
    num? videoCount,
    num? heartCount,
    num? diggCount,
  }) {
    return Author(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      followerCount: followerCount ?? this.followerCount,
      followingCount: followingCount ?? this.followingCount,
      videoCount: videoCount ?? this.videoCount,
      heartCount: heartCount ?? this.heartCount,
      diggCount: diggCount ?? this.diggCount,
    );
  }

  /// Returns a JSON-encodable map representation of this [Author].
  ///
  /// The map will contain the following key-value pairs:
  ///
  /// - `id`: The TikTok user ID.
  /// - `username`: The user username.
  /// - `name`: The user name.
  /// - `avatar`: The user avatar URL.
  /// - `followerCount`: The user follower count.
  /// - `followingCount`: The user following count.
  /// - `videoCount`: The user video count.
  /// - `heartCount`: The user heart count.
  /// - `diggCount`: The user digg count.
  ///
  /// This is useful for serializing this object to JSON for e.g. storing in a
  /// database or sending over the network.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'name': name,
      'avatar': avatar,
      'followerCount': followerCount,
      'followingCount': followingCount,
      'videoCount': videoCount,
      'heartCount': heartCount,
      'diggCount': diggCount,
    };
  }
}
