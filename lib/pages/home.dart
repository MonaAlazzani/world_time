import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map? data = {};

  @override
  Widget build(BuildContext context) {

    // Read the arguments or Extract the arguments using ModalRoute.of()
  data = data!.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
  print(data);

    String bgImage = data!['isDayTime'] ? 'day.png' :  'night1.png';
    Color bgColor = data!['isDayTime'] ? Colors.lightBlueAccent : Colors.deepOrange;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(onPressed: () async{
                  //Navigator.pushNamed() method. This tells Flutter to build the widget defined in the routes table and launch the screen.
                dynamic result = await Navigator.pushNamed(context, '/location');
                    setState((){
                      data = {
                        'location':result['location'],
                        'flag': result['flag'],
                        'time':result['time'],
                        'isDayTime':result['isDayTime']

                      };
                    });

                }, icon: Icon(Icons.location_on,color: Colors.white), label: Text("Choose Location",
                style: TextStyle(color: Colors.white),)) ,
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children :  [
                      Text(
                      data!['location'],
                        style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.white),
                    )   ,

                    ],
                  ),
                SizedBox(height: 20.0,),
                Text(
                  data!['time'],
                  style: TextStyle(fontSize: 55.0,fontWeight: FontWeight.bold,color: Colors.white),
                )
              ],
            ),
          ),
        )

    ));
  }
}
