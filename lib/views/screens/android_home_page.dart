import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:platform_controller/utils/route_utils.dart';
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
          leading: IconButton(onPressed: (){
            Navigator.of(context).pushNamed(Myroutes.andro_add,);
          }, icon: Icon(Icons.person_add_alt_1,color: Colors.white,)),
          actions:[
            Consumer<PlatformController>(
            builder: (context,provider, child) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Switch(
                value: provider.isAndroid,
                onChanged: (val){
                  provider.platform(val: val);
                },
              ),
            ),
          ),
            IconButton(onPressed: (){
              Provider.of<PlatformController>(context,listen: false).ChangeMyTheme();
            }, icon: (provider.IsDark)?Icon(Icons.dark_mode):Icon(Icons.light_mode_sharp,color: Colors.white,)),
          ],
          centerTitle: true,
          title: (provider.IsDark)?Text("Android OS",style: TextStyle(fontSize: 32,color: Colors.white)):Text("Android OS",style: TextStyle(fontSize: 32,color: Colors.white),
        ),
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
