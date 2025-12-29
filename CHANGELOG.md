## [0.1.0]
### Fixed
- Fixed "No records found" error by adding a default Desktop `User-Agent` to all requests.
- Added `TiktokScraper.userAgent` to allow configuring the User-Agent if needed.

### Note
- **Important:** It is highly recommended to use the default Desktop User-Agent. Using a mobile User-Agent may trigger TikTok's mobile site, which is not supported by this scraper.

## [0.0.9]
### Enhanced
- Added `fromJson` factories to `TiktokVideo` and `Author` models for better serialization support.
- Introduced `TikTokException` for cleaner and more specific error handling.
- Updated minimum Flutter SDK version to `3.3.0`.

### Fixed
- Fixed typo in `TiktokVideo.copyWith` parameters (`downloadUrl` -> `downloadUrls`).
- Fixed runtime type errors in `getUserInfo` and `getVideoInfo` by properly casting map data.

## [0.0.8]
### Improved
- Refactor TikTok video handling to support multiple download URLs and add scraping source options

## [0.0.7]
### Fixed
- Video download url was not working.

## [0.0.6]
### Enhanced
- Improved package documentation.
- Fix casing in TikTokScraper references

## [0.0.3]
### Added
- Initial release of the TikTok Scraper package.
- Feature to fetch user information by username.
- Feature to fetch video information by video URL.

## [0.0.4]
### Fixed
- Fixed null description in video data.