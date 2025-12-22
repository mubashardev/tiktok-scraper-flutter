# TikTok Scraper

<p align="center">
  <img src="https://img.shields.io/pub/v/tiktok_scraper?style=flat-square&color=blue" alt="Pub Version">
  <img src="https://img.shields.io/github/license/mubashardev/tiktok-scraper-flutter?style=flat-square&color=purple" alt="License">
  <img src="https://img.shields.io/github/stars/mubashardev/tiktok-scraper-flutter?style=flat-square&color=orange" alt="Stars">
  <img src="https://img.shields.io/github/issues/mubashardev/tiktok-scraper-flutter?style=flat-square&color=red" alt="Issues">
</p>

<p align="center">
  <strong>Effortlessly extract TikTok videos and user metadata with a robust and easy-to-use Flutter package.</strong>
</p>

---

## Overview

**TikTok Scraper** is a high-performance Flutter package designed for developers who need reliable access to TikTok content. Whether you're building an analytics tool, a content aggregator, or just need to download videos, this library provides a simple yet powerful interface to get the job done.

## ✨ Features

We prioritize speed, reliability, and ease of use.

| Feature | Status | Description |
| :--- | :---: | :--- |
| **User Profile Scraping** | ✅ | Retrieve full user details including stats and avatars. |
| **Video Metadata** | ✅ | Get video descriptions, stats, music info, and more. |
| **Watermark-free Downloads** | ✅ | direct access to video files without watermarks (where available). |
| **Multi-Source Support** | ✅ | Fallback to alternative sources like `TikDownloader` if the official source fails. |
| **Lightweight** | ✅ | Minimal dependencies to keep your app size low. |

## 🛠️ Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  tiktok_scraper: ^0.0.9
```

Or install it via command line:

```bash
flutter pub add tiktok_scraper
```

## 🔧 Usage

### 1. Import the package

```dart
import 'package:tiktok_scraper/tiktok_scraper.dart';
```

### 2. Fetch User Profile

```dart
void getUser() async {
  var profile = await TikTokScraper.getUserProfile('mubashardev');
  print('User: ${profile.username}');
  print('Followers: ${profile.stats.followerCount}');
}
```

### 3. Fetch Video Details

```dart
void getVideo() async {
  var videoUrl = 'https://www.tiktok.com/@mubashardev/video/7393468652906925317';
  var video = await TikTokScraper.getVideo(videoUrl);
  
  print('Description: ${video.description}');
  print('Download URL: ${video.downloadUrls.first}');
}
```

## ⚡ Advanced Usage: Switching Sources

Sometimes the official scraping method might be restricted or fail. You can easily switch to an alternative source like `TikDownloader`.

```dart
var video = await TikTokScraper.getVideo(
  'https://www.tiktok.com/@user/video/1234567890',
  source: ScrapeVideoSource.TikDownloader, // Use alternative source
);
```

## 🤝 Contributing

We welcome contributions! If you have an idea for a new feature or have found a bug, please check out our [contribution guidelines](CONTRIBUTING.md) or open an issue.

1. **Fork** the repository
2. **Create** your feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Connect

Maintainer: **Mubashar Dev**

<a href="https://mubashar.dev">
  <img src="https://img.shields.io/badge/Website-mubashar.dev-blue?style=for-the-badge&logo=google-chrome" alt="Website">
</a>
<a href="https://github.com/mubashardev">
  <img src="https://img.shields.io/badge/GitHub-@mubashardev-black?style=for-the-badge&logo=github" alt="GitHub">
</a>

---

*Disclaimer: This project is for educational purposes only and is not affiliated with TikTok.*