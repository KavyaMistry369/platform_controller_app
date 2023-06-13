import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:platform_controller/utils/route_utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class Homeios extends StatelessWidget {
  const Homeios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyDate>(
      builder:(context,provider, child) =>  CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2),label: "Chats"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone),label: "Calls"),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.person_add),label: "Add"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: "Settings"),
        ]), tabBuilder: (BuildContext context, int index) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 200,),
                (index==0)? Image.asset("lib/views/assets/chats.png",width: 250,):Image.asset("lib/views/assets/telephone-call.png",width: 250,),
                SizedBox(height: 30,),
                (index==0)? Text("Not any chats are there",style: TextStyle(fontSize: 30),): Text("Not any contacts are there",style: TextStyle(fontSize: 30),),
                SizedBox(height: 150,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (index==0)? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(onPressed: (){},child: Icon(CupertinoIcons.add),),
                    ):Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(onPressed: (){},child: Icon(CupertinoIcons.add),),
                    ),
                  ],
                ),
                
            (index==2)?CupertinoListSection(
                      children: [
                      SizedBox(height: 80,),
                      Stack(
                      alignment: Alignment.bottomRight,
                      children:[ CircleAvatar(
                      radius: 100,
                      ),
                      FloatingActionButton(onPressed: (){},child: Icon(CupertinoIcons.add),)
                      ],
                      ),
                      SizedBox(height: 30,),
                      Padding(
                      padding: const EdgeInsets.all(16),
                      child: CupertinoTextField(
                      prefix: Icon(CupertinoIcons.person),
                      ),
                      ),
                      SizedBox(height: 30,),
                      ],
                      ):CupertinoListTile(title: Text(""))
              ],
            ),
          );
      },
      ),
      child:  CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
              onTap: (){

              },
              child: Icon(CupertinoIcons.person_add)),
          // leading: GestureDetector(onTap: (){
          //  showCupertinoModalPopup(context: context, builder: (context) =>  Container(
          //    height: 300,
          //    width: 400,
          //    decoration: BoxDecoration(
          //      borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
          //      color: CupertinoColors.white,
          //    ),
          //    child: CupertinoDatePicker(
          //      mode: CupertinoDatePickerMode.date,
          //      onDateTimeChanged: (value) {
          //        Provider.of<MyDate>(context,listen: false).changemydate(Date: value);
          //        Provider.of<MyDate>(context,listen: false).mydate=value;
          //    },initialDateTime: Provider.of<MyDate>(context,listen:false).mydate,),
          //  ));
          // },child: Icon(CupertinoIcons.calendar)),
          trailing: Consumer<PlatformController>(builder: (context,provider, child) =>CupertinoSwitch(value:provider.isAndroid, onChanged: (val){
            provider.platform(val: val);
          })),
          middle: const Text("Ios OS",style: TextStyle(fontSize: 30),),
        ),
        child: Center(
          child: CupertinoListSection(
            children: [
              Text("Ios"),
              CupertinoTabView(
                builder: (context) {
                  return Container(
                    height: 400,
                    width: 300,
                    color: CupertinoColors.activeGreen,
                  );
                },
              ),
            ],
          ),),
      ),
      );
  }
}
