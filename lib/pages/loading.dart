import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setupWorldTime() async{
  WorldTime instance = WorldTime(location: "Riyadh", flag: "germany.png", url: "Asia/Riyadh");
 await instance.getTime();

   //pass arguments to a named route
  //Define the arguments you need to pass.
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime':instance.isDayTime,
  });

}


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(

          child: SpinKitChasingDots(
            color: Colors.white,
            size: 50.0,
          )
      ),
    );
  }
}
