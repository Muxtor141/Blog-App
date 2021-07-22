import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vodiy_blog/error.dart';
import 'package:vodiy_blog/home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool status1 = false;
  Widget content2 = MainPage();
  Widget content = Scaffold(
    backgroundColor: Colors.black,
  );
  Widget content1 = Scaffold(
    backgroundColor: Colors.black,
  );

  dialog() {
    final size = MediaQuery.of(context).size;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => Card(
              child: AlertDialog(
                title: Center(child: Text('Internet uzildi')),
                content: Container(
                  child: Image.asset(
                    'assets/images/error.jpg',
                    height: size.height * 0.24,
                    width: size.width * 0.2,
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Text('Chiqish')),
                      ),
                      Container(
                        width: size.width * 0.3,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: Colors.lightGreen),
                            onPressed: () {
                              checkConnection();
                              Navigator.pop(context);
                            },
                            child: Text('Qayta urinish')),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  checkConnection() async {
//     final size1 = MediaQuery.of(context).size;
//     try {
//       final result = await InternetAddress.lookup('www.google.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
// setState(() {
//     status1 = true;
// });
//         dialog();
//         print('connected');
//       }
//     } on SocketException catch (_) {
//       setState(() {
//          status1 = false;
//       });

//       dialog();
//       print('not connected');
//     }
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        content = content2;
    
      });
      // I am connected to a mobile network.

    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        content = content2;
  
      });
      // I am connected to a wifi network.
    } else {
      setState(() {
        content = content1;
      });

      dialog();
    }
  }

  @override
  void initState() {
    checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
