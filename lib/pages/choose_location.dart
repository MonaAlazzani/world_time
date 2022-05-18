import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  @override
  Widget build(BuildContext context) {

    //simply this fun will go you to the home page without change the time, now go to home class and change some things
    void updateTime(index) async{//index here will represent each item in the locations
      // make instance of WorldTime
      WorldTime instance = locations[index];// the parameter that will represent each item in the list
      await instance.getTime();
      //navigate to the home, you know that in the home class we used navigator to push
      // the location widget, so now we do not need to write the route name or arguments parameter in this
      //class, the whole thing you need to write in this class is the map items with pop fun
      Navigator.pop(context, {//The pop() method removes the current Route from the stack of routes managed by the Navigator.
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime':instance.isDayTime,
      });

    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Location',),centerTitle: true, backgroundColor: Colors.blue,),
      body:ListView.builder(
    itemCount: locations.length ,
    itemBuilder: (context, index) {//function will return a widget
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 6),
        child: Card(
          child: ListTile(
            onTap: (){
              updateTime(index);
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ),
        ),
      );
    }
    ),
    );

  }
}