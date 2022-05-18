import 'package:http/http.dart';
import 'dart:convert';//this will convert json strings from the request into the data can we work with.
import 'package:intl/intl.dart';

class WorldTime{

  late String location; //location name for the ui
  late String time;//the time in that location
  late String flag;//url to an asset flag icon
  late String url;//location url for api endpoint
  late bool isDayTime;//true of false if dayTime or not

  WorldTime({required this.location,required this.flag,required this.url});

 Future<void> getTime() async{
  
   try{

     //make the request
     Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
     //response body(decoded into map)
     Map data= jsonDecode(response.body);

     //get properties from data
     String datetime = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);

     //create Datetime object(convert strings into object)
     DateTime now= DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));
     //set the time property
     //make 'time' more readable (format for the time)
     isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
     time = DateFormat.jm().format(now);
   }
   catch(e){
     print('caught an error here $e');
     time = 'You got the error from data';
   }
  }
}