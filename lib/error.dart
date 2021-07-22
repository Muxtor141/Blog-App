import 'package:flutter/material.dart';


class ErrorPage extends StatefulWidget {
  const ErrorPage({ Key? key }) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
             Text('Iltimos internet bilan aloqani tekshiring') ,
            CircularProgressIndicator(color: Colors.red,),
          ],
        ),
      ),
    );
  }
}