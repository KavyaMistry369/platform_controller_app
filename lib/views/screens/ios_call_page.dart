import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:platform_controller/utils/route_utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/contact_controller.dart';
import 'andro_add_page.dart';

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
            trailing: Consumer<PlatformController>(builder: (context,provider, child) =>CupertinoSwitch(value:provider.isAndroid, onChanged: (val){
              provider.platform(val: val);
            })),
            middle: const Text("Platform Converter",style: TextStyle(fontSize: 25),),
          ),
          child:  SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100,),
                Consumer<MyAllListController>(
                  builder:(context,provider, child) => Center(
                    child:CupertinoListSection(
                      children: List.generate(provider.getmyallcontacts.length, (index) => CupertinoListTile(
                        title:Text("${provider.getmyallcontacts[index].name}"),
                        subtitle: Text("${provider.getmyallcontacts[index].contact}"),
                        leading: Transform.scale(scale:1.5,child: CircleAvatar(
                          child: CupertinoContextMenu(
                            actions: <Widget>[
                              CupertinoContextMenuAction(
                                onPressed: () {
                                },
                                isDefaultAction: true,
                                child:  Text("${provider.getmyallcontacts[index].name}",style: TextStyle(color: (Provider.of<PlatformController>(context).IsDark)?CupertinoColors.white:CupertinoColors.black),),
                              ),
                              CupertinoContextMenuAction(
                                onPressed: () {
                                },
                                isDefaultAction: true,
                                child:  Text("${provider.getmyallcontacts[index].contact}",style: TextStyle(color: (Provider.of<PlatformController>(context).IsDark)?CupertinoColors.white:CupertinoColors.black),),
                              ),
                              CupertinoContextMenuAction(
                                onPressed: () {
                                  provider.RemoveListContact(index: index);
                                },
                                isDefaultAction: true,
                                trailingIcon: CupertinoIcons.delete,
                                child:  Text("Delete",style: TextStyle(color: CupertinoColors.destructiveRed),),
                              ),
                            ],
                            child:  SizedBox(
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: FileImage(File(Provider.of<MyAllListController>(context,listen: false).getmyallcontacts[index].Image)),
                              ),
                            ),
                          ),
                          radius: 100,backgroundImage: FileImage(File(Provider.of<MyAllListController>(context,listen: false).getmyallcontacts[index].Image)),)),
                        trailing:  CupertinoButton(onPressed: ()async{
                          void Caller(){
                            Phone_Number=Provider.of<MyAllListController>(context,listen: false).getmyallcontacts[index].contact;
                          }
                          bool? result= await FlutterPhoneDirectCaller.callNumber(Phone_Number!);
                          Caller();
                        }, child: Icon(CupertinoIcons.phone_fill,color: CupertinoColors.activeGreen,)),
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
      ),
    );
  }
}

