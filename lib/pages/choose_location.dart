import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "Egypt", flag: "egypt.png", url: "Africa/Cairo"),
    WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin"),
    WorldTime(location: "UK", flag: "uk.png", url: "Europe/London"),
    WorldTime(location: "USA", flag: "usa.png", url: "America/New_York")
  ];

  void updateTime(index) async{

    WorldTime wt = locations[index];
    await wt.getTime();
    Navigator.pop(context,{
      "location": wt.location, 
      "flag": wt.flag, 
      "time": wt.time, 
      "isDayTime": wt.isDayTime
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {updateTime(index);},
                title: Text(locations[index].location),
                leading: CircleAvatar(backgroundImage: AssetImage("assets/${locations[index].flag}"),),
              ),
            ),
          );
        },
      ),
    );
  }
}
