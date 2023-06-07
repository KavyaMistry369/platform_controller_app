import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class Homeandro extends StatelessWidget {
  const Homeandro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Consumer<PlatformController>(
      builder:(context,provider, child) =>Scaffold(
        bottomNavigationBar: NavigationBar(selectedIndex:provider.navindex,destinations: [
          NavigationDestination(
            icon: Icon(Icons.chat_sharp),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Saved',
          ),
        ],onDestinationSelected:(int index) => {
          Provider.of<PlatformController>(context,listen: false).nav(index: index),
        },),
        appBar: AppBar(
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(onPressed: (){
          //      // DateTime? d= await showDatePicker(context: context, initialDate:provider.mydate, firstDate:DateTime(1947), lastDate: DateTime.now().add(Duration(days: 1),),
          //      //   initialEntryMode: DatePickerEntryMode.calendarOnly,
          //      //   initialDatePickerMode: DatePickerMode.day,
          //      //   onDatePickerModeChange: (Date) => Provider.of<MyDate>(context,listen:true).changemydate(Date:provider.mydate),
          //     }, icon: Icon(Icons.date_range,size: 30,),),
          //   ),
          // ],
          actions:[ Consumer<PlatformController>(
            builder: (context,provider, child) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Switch(
                value: provider.isAndroid,
                onChanged: (val){
                  provider.platform(val: val);
                },
              ),
            ),
          ),],
          title: Text("Android OS",style: TextStyle(fontSize: 32,color: Colors.black),),
          centerTitle: true,
        ),
        body:<Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/views/assets/chat.png",width: 150,),
                ],
              ),
              SizedBox(height: 30,),
              Text("not any chats yet done",style: TextStyle(fontSize: 30),),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/views/assets/call.png",width: 150,),
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
          Column(
            children: [
              Text("Page3"),
            ],
          ),
        ][provider.navindex],
      ),
      );
  }
}
