// package com.example.youtube_downloader

// import android.content.Intent
// import android.os.Bundle
// import android.os.PersistableBundle
// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.MethodChannel

// //Platform channel code to share text file into our App
// class MainActivity: FlutterActivity() {

//     private var data: String ="";

//     //Oncreate just helps to preload the function before it is used --// Not really needed so it's commented
//     // override fun onCreate(savedInstanceState: Bundle?,persistentState: PersistableBundle?){
//     //     super.onCreate(savedInstanceState,persistentState)

//     //     getIntentData();

//     // }

//     //Method channel that is going to sent the shared youtube link to our Flutter UI
//     override fun configureFlutterEngine(flutterEngine: FlutterEngine){
//         super.configureFlutterEngine(flutterEngine)
//         MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"app.youtube").setMethodCallHandler {call, result ->
//             if(call.method =="getData"){
//                 getIntentData();
//                 result.success(data);
//                 data = "";
//             }
            
//         }
//     }

//     //Function that communicates with andriod OS and set the intentData to the String above...
//     private fun getIntentData(){
//         //Get Shared Data
//         //---Only get intent if the intent is a "TEXT"
//         if(intent?.action ==Intent.ACTION_SEND){
//             if(intent.type =="text/plain"){
//                 intent.getStringExtra(Intent.EXTRA_TEXT)?.let{ intentData ->
//                     data = intentData
                
//                 }
//             }

//         }
//     }
  
// }


 package com.example.youtube_downloader

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private var data: String = "";


//    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
//        super.onCreate(savedInstanceState, persistentState)
//
//        getIntentData();
//    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.youtube_downloader").setMethodCallHandler {call, result ->
            if(call.method == "getData"){
                getIntentData();
                result.success(data);
                data = "";
            }
        }
    }

    private fun getIntentData() {
        //Get the shared data
        //Only get the intent if the send intent is a "text"
        if (intent?.action == Intent.ACTION_SEND){
            if(intent.type == "text/plain"){
                intent.getStringExtra(Intent.EXTRA_TEXT)?.let { intentData ->
                    data = intentData
                }
            }
        }
    }

}

