//Access MainActivity.kt to see platform channel code the folder path here - apps->main->kotlin->mainActivity.kt

//Function that would comminucate eith the platform channel code above

import 'package:flutter/services.dart';

class DataClass {
  static String channel =
      "com.example.youtube_downloader"; //channel takes data from platform channel code

  Future<String> sharedData() async {
    final String data = await MethodChannel(channel).invokeMethod(
      "getData",
    ); //invoke method takes its method name from platform channel code
    return data;
  }
}
