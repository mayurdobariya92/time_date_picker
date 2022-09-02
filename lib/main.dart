import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: first(),));
}
class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  String curDate ="";
  String curTime ="";


  @override
  void initState() {
    super.initState();

    curDate = DateTime.now().toString();
    curTime = TimeOfDay.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Date Time Picker"),),
    body: Column(children: [
      ElevatedButton(onPressed: () {
        showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1992), lastDate: DateTime(2050)).then((value) {
          if(value!=null)
            {
              setState(() {
                curDate=value.toString();
              });
            }
        });

      }, child: Text("${curDate}")),
      ElevatedButton(onPressed: () {
        showTimePicker(initialEntryMode: TimePickerEntryMode.input,context: context, initialTime: TimeOfDay.now()).then((value) {
          if(value!=null)
            {
              curTime =value.toString();
            }
        });

      }, child: Text("${curTime}")),
      ElevatedButton(onPressed: () {
        showModalBottomSheet(builder: (context) {
          return Container(
            height: 150,
            child: CupertinoDatePicker(mode: CupertinoDatePickerMode.dateAndTime,onDateTimeChanged: (value) {
              SystemSound.play(SystemSoundType.click);
              print(value);

            },),

          );

        },context: context);

      }, child: Text("Time")),
    ],),
    );
  }
}


