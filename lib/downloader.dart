import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

//class that download YT videos using YT package
class Downloader {
  Future<void> downloadVideo(String youTube_link, [String? title]) async {
    final result = await FlutterYoutubeDownloader.downloadVideo(
        youTube_link, "$title", 18);
    print(result);
  }
}
 