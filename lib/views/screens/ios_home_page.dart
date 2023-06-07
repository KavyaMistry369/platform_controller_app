import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class Homeios extends StatelessWidget {
  const Homeios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyDate>(
      builder:(context,provider, child) =>  CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(onTap: (){
           showCupertinoModalPopup(context: context, builder: (context) =>  Container(
             height: 300,
             width: 400,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
               color: CupertinoColors.white,
             ),
             child: CupertinoDatePicker(
               mode: CupertinoDatePickerMode.date,
               onDateTimeChanged: (value) {
                 Provider.of<MyDate>(context,listen: false).changemydate(Date: value);
                 Provider.of<MyDate>(context,listen: false).mydate=value;
             },initialDateTime: Provider.of<MyDate>(context,listen:false).mydate,),
           ));
          },child: Icon(CupertinoIcons.calendar)),
          trailing: Consumer<PlatformController>(builder: (context,provider, child) =>CupertinoSwitch(value:provider.isAndroid, onChanged: (val){
            provider.platform(val: val);
          })),
          middle: const Text("Ios OS",style: TextStyle(fontSize: 30),),
        ),
          child: Center(
        child: CupertinoListSection(
          children: [
                  Text("Ios")
                ],
              ),),
            ),
      );
  }
}
