import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller.dart';

class Facebook extends StatefulWidget {
  final Controller controller;
  Facebook(this.controller);
  @override
  _FacebookState createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  bool done = true;
  WebViewController wepcontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<Duration>(
          valueListenable: widget.controller.useTime,
          builder: (context, value, _) {
            String time = value.toString();
            time = time.replaceFirst("-", '');
            time = time.substring(2, 7);
            return Text(time);
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<double>(
        valueListenable: widget.controller.progress,
        builder: (context, value, _) {
          if(value ==0){
            return null;
          }
          else if(value ==100){
            return null;
          }
          else {
            return LinearProgressIndicator(
              value: value / 100,
            );
          }
        },
      ),
      body: WebView(
        initialUrl: "https://m.facebook.com/",
        onPageFinished: (String url) {
          done = true;
          print("finished");
        },
        onPageStarted: (String url) {
          done = false;
          print("started");
        },
        onProgress: (int loading) {
          widget.controller.progress.value = loading.toDouble();
          print(loading.toString());
        },
        onWebViewCreated: (_controller) {
          wepcontroller = _controller;
        },
        //  navigationDelegate: (NavigationRequest request) {
        //     if (request.url.startsWith('https://m.facebook.com/')) {
        //       print('blocking navigation to $request}');
        //       return NavigationDecision.prevent;
        //     }
        //     print('allowing navigation to $request');
        //     return NavigationDecision.navigate;
        //   },
      ),
    );
  }
}
/**
 *           onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },

           final Completer<WebViewController> _controller =
      Completer<WebViewController>();
 */
