import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_downloader/downloader.dart';

//Browser Page contains WebView and Download feature

class BrowserPage extends StatefulWidget {
  const BrowserPage({Key? key}) : super(key: key);

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  WebViewController? _controller;
  final link = "https://www.youtube.com";   //default link of webview

  bool _showDownloadButton = false; //boolean that toggles FAB


  //check if url is from youtube or a video to toggle download button FAB
  void checkUrl() async {
    if (await _controller!.currentUrl() == "https://m.youtube.com/") {
      setState(() {
        _showDownloadButton = false;
      });
    } else {
      setState(() {
        _showDownloadButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUrl();
    return WillPopScope(
      onWillPop: () async {
        if (await _controller!.canGoBack()) {
          _controller!.goBack();
        }
        return false;
      },
      child: Scaffold(
        body: WebView(
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (String start) {
            setState(() {
              const CircularProgressIndicator();
            });
          },
          onWebViewCreated: (controller) {
            setState(() {
              const CircularProgressIndicator(
                color: Colors.red,
              );
              _controller = controller;
            },);
          },
        ),
        floatingActionButton: _showDownloadButton == false
            ? Container()
            : FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () async {
                  final url = await _controller!.currentUrl();
                  final title = await _controller!.getTitle();
                  Downloader().downloadVideo(url!, "$title");
                  print(url);
                },
                child: const Icon(Icons.download),
              ),
      ),
    );
  }
}
