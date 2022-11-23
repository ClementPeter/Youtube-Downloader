import 'package:flutter/material.dart';
import 'package:youtube_downloader/downloader.dart';
import 'package:youtube_downloader/getSharedData.dart';

//Paste link page - contains UI to paste url link and download button
class PasteLinkPage extends StatefulWidget {
  const PasteLinkPage({Key? key}) : super(key: key);

  @override
  State<PasteLinkPage> createState() => _PasteLinkPageState();
}

class _PasteLinkPageState extends State<PasteLinkPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //.then helps to resolve the value (data) returned from sharedData

    Future.delayed(const Duration(seconds: 2), () {
      DataClass().sharedData().then((value) {
        print(value);
        setState(() {
          _controller.text = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 239, 222, 221),
            ),
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "paste youtube link",
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: InkWell(
                onTap: () {
                  if (_controller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No link pasted'),
                      ),
                    );
                  } else {
                    AlertDialog(
                      title: const Text("Dowloading..."),
                      content:
                          const Text("Kindly wait while the video downloads"),
                      scrollable: true,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Okay"),
                        )
                      ],
                    );
                    Downloader().downloadVideo(
                        _controller.text.trim(), 'Youtube Downloader');
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Download Video",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
