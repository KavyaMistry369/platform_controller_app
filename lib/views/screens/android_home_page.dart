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
          }, icon: Icon(Icons.person_add_alt_1,color: (provider.IsDark)?Colors.black:Colors.white,)),
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
          title: (provider.IsDark)?Text("Android OS",style: TextStyle(fontSize: 32,color: Colors.black)):Text("Android OS",style: TextStyle(fontSize: 32,color: Colors.white),
        ),
        ),
        body:<Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/views/assets/conversation.png",width: 150,),
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
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/views/assets/telephone.png",width: 150,),
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
                      FloatingActionButton(onPressed: (){
                        Navigator.of(context).pushNamed(Myroutes.andro_add);
                      },child: Icon(Icons.add),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Icon(Icons.person,size: 40,),
                  SizedBox(width: 50,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Profile\n",style: TextStyle(fontSize: 20),
                        ),
                        TextSpan(
                          text: "Update Profile Data",style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 70,),
                  Transform.scale(
                    scale: 0.9,
                    child: Switch(value: provider.IsOpen, onChanged: (val){
                      Provider.of<PlatformController>(context,listen: false).ChangemyProfile();
                      if(val==true)
                      {
                        Navigator.of(context).pushNamed(Myroutes.andro_pro);
                      }
                    },),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                height: 1,
                width: 380,
                color: Colors.black,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Icon(Icons.light_mode,size: 30,),
                  SizedBox(width: 50,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Theme\n",style: TextStyle(fontSize: 20),
                        ),
                        TextSpan(
                          text: "Change Theme",style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 100,),
                  Transform.scale(
                    scale: 0.9,
                    child: Switch(value: provider.IsTheme, onChanged: (val){
                      Provider.of<PlatformController>(context,listen: false).ChangeTheme();
                    }),
                  ),
                ],
              ),
            ],
          ),
        ][provider.navindex],
      ),
      );
  }
}
