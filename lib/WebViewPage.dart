import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:custom_splash/custom_splash.dart';
// import 'package:connectivity/connectivity.dart';
//import 'package:selfcare/nointernet.dart';
// class splash extends StatefulWidget {
//   @override
//   _splashState createState() => _splashState();
// }

// class _splashState extends State<splash> {
//   String result = '';
//   var Colorsval = Colors.white;

//   @override
//   void initState() {
//     CheckStatus();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (result != null && result == "Connected") {
//       return CustomSplash(
//         //backGroundColor: Color(0xFFFF9800),
//         imagePath: "assets/images/logo.png",

//         home: WebViewClass(),
//         duration: 10,
//         animationEffect: "zoom-in",
//       );
//     } else if (result != null && result == "NoInternet") {
//       return CustomSplash(
//         //backGroundColor: Color(0xFFFF9800),
//         imagePath: "assets/images/logo.png",

//         home: NoInternetPage(),
//         duration: 10,
//         animationEffect: "zoom-in",
//       );
//     } else if (result == null) {
//       return CustomSplash(
//         //backGroundColor: Color(0xFFFF9800),
//         imagePath: "assets/images/logo.png",

//         home: NoInternetPage(),
//         duration: 10,
//         animationEffect: "zoom-in",
//       );
//     } else {
//       return CustomSplash(
//         //backGroundColor: Color(0xFFFF9800),
//         imagePath: "assets/images/logo.png",

//         home: NoInternetPage(),
//         duration: 10,
//         animationEffect: "zoom-in",
//       );
//     }
//   }

//   void CheckStatus() {
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.mobile ||
//           result == ConnectivityResult.wifi) {
//         ChangeValues("Connected", Colors.green[900]!);
//       } else {
//         ChangeValues("NoInternet", Colors.red[900]!);
//       }
//     });
//   }

//   void ChangeValues(String resultval, Color colorval) {
//     setState(() {
//       result = resultval;
//       Colorsval = colorval;
//     });
//   }
// }

class WebViewPage extends StatefulWidget {
   WebViewPageState createState() =>  WebViewPageState();
}

class  WebViewPageState extends State< WebViewPage> {
  num position = 1;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Permission.mediaLibrary.request();
    Permission.phone.request();
    Permission.photos.request();
    Permission.storage.request();
    Permission.camera.request();
  }
  //Check Internet Code Starts

  //Check Internet Code Ended here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Show ProgressBar While Loading Webview')),
        body: IndexedStack(children: <Widget>[
          WebView(
            initialUrl: 'https://www.remove.bg/upload',
            javascriptMode: JavascriptMode.unrestricted,
            key: key,
            onPageFinished: doneLoading,
            onPageStarted: startLoading,
            //onWebResourceError: ,
          ),
          Container(
            color: Colors.white,
            child: Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
            )),
          ),
        ]));
  }
}
