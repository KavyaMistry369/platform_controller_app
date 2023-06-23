import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../controllers/contact_controller.dart';
import '../../controllers/platform_provider.dart';
import 'Ios_add_page.dart';




class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {


    return Consumer<PlatformController>(
      builder: (context,provider, child) => CupertinoPageScaffold(
          backgroundColor: CupertinoColors.darkBackgroundGray,
        navigationBar: CupertinoNavigationBar(
          trailing:Consumer<PlatformController>(builder: (context,provider, child) =>CupertinoSwitch(value:provider.isAndroid, onChanged: (val){
            provider.platform(val: val);
          })),
          middle: Text("Platform Controller",style: TextStyle(fontSize: 25),),
        ),
          child: Center(
            child: CupertinoListSection(
              topMargin: 150,
              children: [
                SingleChildScrollView(
                  child: CupertinoListSection(
                    children: [
                      (provider.IsOpen)?Container(
                        height: (provider.IsOpen)?350:100,
                        width: 400,
                        child:  SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(height: 70,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 30,),
                                  Icon(CupertinoIcons.person,size: 40,),
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
                                    child: CupertinoSwitch(value: provider.IsOpen, onChanged: (val){
                                      Provider.of<PlatformController>(context,listen: false).ChangemyProfile();
                                    },),
                                  ),
                                ],
                              ),
                              SizedBox(height: 50,),
                              Stack(
                                alignment: Alignment.bottomRight,
                                children:[ GestureDetector(
                                  onTap:(){
                                  },
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.activeBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    width: 150,
                                  ),
                                ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Transform.scale(
                                scale: 0.7,
                                child: CupertinoTextField(
                                  autofillHints: ["Enter the name"],
                                  decoration: BoxDecoration(
                                    border:Border.all(color:(provider.IsDark)?CupertinoColors.white:Colors.black),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: CupertinoTextField(
                                  decoration: BoxDecoration(
                                    border:Border.all(color:(provider.IsDark)?CupertinoColors.white:Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CupertinoButton(onPressed: (){}, child: Text("Save")),
                                  CupertinoButton(onPressed: (){}, child: Text("Clear"))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ):Container(
                        height: (provider.IsOpen)?350:100,
                        width: 400,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 30,),
                            Icon(CupertinoIcons.person,size: 40,),
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
                            SizedBox(width: 100,),
                            Transform.scale(
                              scale: 0.9,
                              child: CupertinoSwitch(value: provider.IsOpen, onChanged: (val){
                                Provider.of<PlatformController>(context,listen: false).ChangemyProfile();
                              },),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 40,),
                          Icon(CupertinoIcons.sun_max_fill,size: 30,),
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
                          SizedBox(width: 128),
                          Transform.scale(
                            scale: 0.9,
                            child: CupertinoSwitch(value: provider.IsDark, onChanged: (val){
                              Provider.of<PlatformController>(context,listen: false).ChangeMyTheme();
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
