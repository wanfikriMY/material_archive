// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenshotApp extends StatefulWidget {
  const ScreenshotApp({Key? key}) : super(key: key);

  @override
  State<ScreenshotApp> createState() => _ScreenshotAppState();
}

class _ScreenshotAppState extends State<ScreenshotApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screenshot Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Screenshot Demo'),
        ),
        body: Center(
          child: ConfirmationScreen(),
        ),
      ),
    );
  }
}

Widget ConfirmationScreen() {
  Image? screenCapture;
  bool isVisibility = false;

  Future<bool> savePng(List<int> imgBytes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String base64Image = base64Encode(imgBytes);
    return prefs.setString('image', base64Image);
  }

  Future<Image> getPng() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uint8List bytes = base64Decode(prefs.getString('image') ?? '');

    return Image.memory(bytes);
  }

  Future<void> showImg() async {
    screenCapture = await getPng();
  }

  Future<void> widgetToImageFile(Uint8List capturedImage) async {
    savePng(capturedImage);
  }

  ScreenshotController screenshotController = ScreenshotController();

  return MediaQuery(
    data: MediaQueryData(devicePixelRatio: 3.5),
    child: SingleChildScrollView(
      padding: const EdgeInsets.only(
        bottom: 80.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80.0,
              bottom: 80.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Text 1'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Text 1'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Text 1'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Text 1'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Text 1'),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Divider()),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Text 2'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Text 2'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Text 2'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Text 2'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Text('Text 3'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "AppR().string.pop_up_message_account_closure_form",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ])),
                        ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 1.0),
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "I agree",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Saya setuju",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ])),
                                  ],
                                ))
                          ],
                        ),
                        Spacer(),
                        ElevatedButton(child: Text("Show Image"), onPressed: () async {}),
                        Spacer(),
                        ElevatedButton(
                            child: Text("Convert To Image"),
                            onPressed: () async {
                              screenshotController.captureFromWidget(ConfirmationScreen()).then((capturedImage) async {
                                await widgetToImageFile(capturedImage);
                              });
                            }),
                        Spacer(),
                        ElevatedButton(child: Text("Cancel"), onPressed: () async {}),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(child: Text("Submit"), onPressed: () async {}),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
