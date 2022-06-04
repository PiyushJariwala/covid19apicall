import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViweScreen extends StatefulWidget {
  const WebViweScreen({Key? key}) : super(key: key);

  @override
  State<WebViweScreen> createState() => _WebViweScreenState();
}

class _WebViweScreenState extends State<WebViweScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CoWin'),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: '${data}',
              onProgress: (value){
                if(value==100)
                  {
                    setState(() {
                      visible=false;
                    });
                  }
              },
            ),
            Visibility(
              visible: visible,
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
