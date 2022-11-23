import 'package:flutter/material.dart';
import 'package:youtube_downloader/screens/browser_page.dart';
import 'package:youtube_downloader/screens/paste_link_page.dart';

//Homepage wraps both UI pages in an AppBar and Bottom NavBar
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; //Bottom Nav-bar Index

  //Bottom Nav-bar items/ icon
  List<BottomNavigationBarItem> bottomNavigationItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.paste), label: "Paste link"),
    BottomNavigationBarItem(icon: Icon(Icons.network_cell), label: "Browser")
  ];

  //UI screens to be called in HomePage body
  List<Widget> pages = const [
    PasteLinkPage(),
    BrowserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationItems,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
