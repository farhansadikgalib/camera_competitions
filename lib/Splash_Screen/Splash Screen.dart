import 'dart:async';
import 'package:camera_competitions/Check_Connection/No%20Internet.dart';
import 'package:camera_competitions/Check_Connection/check_internet.dart';
import 'package:camera_competitions/Home_Page/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {


  int checkInt = 0;

  @override
  void initState() {
    super.initState();
    Future<int> a = CheckInternet().checkInternetConnection();
    a.then((value) {
      if (value == 0) {
        setState(() {
          checkInt = 0;
        });
        print('No internet connect');
        Timer(
            Duration(seconds: 2),
                () =>
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => No_Internet_Connection()),
                        (route) => false));
      } else {
        setState(() {
          checkInt = 1;
        });
        print('Internet connected');
        Timer(
            Duration(seconds: 2),
                () =>
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(
                        url: 'https://cameracompetitions.co.uk')),
                        (route) => false));
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Connected to the internet'),
        // )
     //   );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
                height: 200,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                )),
          ),
          Text("Camera Competitions",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, fontFamily: "Poppins",color: Colors.black)),
          SizedBox(
            height: 75,
          ),

          SpinKitSquareCircle(
            color: Colors.black,
            size: 25.0,
            controller: AnimationController(
                duration: const Duration(milliseconds: 1300), vsync: this),
          ),


          SizedBox(
            height: 10,
          ),
          // _AnimatedLiquidLinearProgressIndicator(),
        ],
      ),
    );
  }
}
