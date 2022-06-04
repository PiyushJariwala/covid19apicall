import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigtor();
  }

  void _navigtor() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, '/firstscreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          color: Colors.white,
          ),

          Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/covid05.jpeg"),
          )),
        ],
      ),
    );
  }
}
