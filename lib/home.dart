import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    WebView.platform = SurfaceAndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
final appBar =AppBar(
        toolbarHeight: 0,
      );

    final sizeQuery = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).viewInsets.top;
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: sizeQuery.width,
        height: sizeQuery.height-height-appBar.preferredSize.height,
      child:
            WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://vodiyblog.uz/",
              ),
            
         
      ),
    );
  }
}
