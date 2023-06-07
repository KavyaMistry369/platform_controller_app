import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:platform_controller/utils/route_utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class Callios extends StatelessWidget {
  const Callios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyDate>(
      builder:(context,provider, child) =>  CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[ BottomNavigationBarItem(icon: GestureDetector(onTap: (){
        },child: Icon(CupertinoIcons.chat_bubble_2_fill)),label: "Chats"),
          BottomNavigationBarItem(icon: GestureDetector(onTap: (){

          },child: Icon(CupertinoIcons.phone_fill)),label: "Calls"),
          BottomNavigationBarItem(icon: GestureDetector(onTap: (){},child: Icon(CupertinoIcons.settings)),label: "Settings"),]),
        tabBuilder:(context, index) => CupertinoPageScaffold(
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
            middle: const Text("Calls",style: TextStyle(fontSize: 30),),
          ),
          child: Center(
            child: CupertinoListSection(
              children: [
                SizedBox(height: 200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/views/assets/telephone-call.png",width: 150,),
                  ],
                ),
                SizedBox(height: 30,),
                Text("not any calls yet added",style: TextStyle(fontSize: 30),),
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
                    ],
                  ),
                ),
              ],
            ),
          ),),
      ),
    );
  }
}

