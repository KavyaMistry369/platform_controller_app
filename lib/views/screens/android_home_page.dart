import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/page_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:platform_controller/utils/route_utils.dart';
import 'package:platform_controller/views/screens/Ios_add_page.dart';
import 'package:platform_controller/views/screens/andro_add_page.dart';
import 'package:provider/provider.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../../controllers/contact_controller.dart';

class Homeandro extends StatelessWidget {
  const Homeandro({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    //
    // int index=ModalRoute.of(context)!.settings.arguments as int;
    // String? _name;
    // String? _email;
    // String? _contact;
    // String? _image;

    return Consumer<PlatformController>(
      builder:(context,provider, child) =>Scaffold(
        bottomNavigationBar: Consumer<PageChange>(
          builder: (context,provider, child) =>AnimatedNotchBottomBar(
            notchColor: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.black:Colors.white,
            color: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.cyan:Colors.redAccent,
            bottomBarItems:[
           BottomBarItem(inActiveItem: Icon(Icons.chat,color: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.black:Colors.white,), activeItem: Icon(Icons.chat_bubble_outline,color: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.white:Colors.black,)),
              BottomBarItem(inActiveItem: Icon(Icons.call,color: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.black:Colors.white,), activeItem: Icon(Icons.call_end_outlined,color: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.white:Colors.black,)),
              BottomBarItem(inActiveItem: Icon(Icons.settings,color: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.black:Colors.white,), activeItem: Icon(Icons.settings_accessibility,color: (Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.white:Colors.black,)),

          ],
            onTap: (index){
            provider.ChangeMyPage(index: index);
            }, notchBottomBarController: provider.MyNotchController,
          ),
        ),
        appBar: AppBar(
          leading: IconButton(onPressed: ()async{
            await Navigator.of(context).pushNamed(Myroutes.andro_add);
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
        body:PageView(
          onPageChanged: (int index){
            Provider.of<PageChange>(context,listen: false).MyPageController;
          },
          controller: Provider.of<PageChange>(context,listen: false).MyPageController,
          children: [
// chats page
            Consumer<MyAllListController>(
              builder:(context,provider, child) => ListView.builder(itemCount:provider.getmyallcontacts.length,itemBuilder: (context, index) => GestureDetector(
                onTap:()async{
                  // await Navigator.of(context).pushNamed(Myroutes.contact_details_page,arguments: index);
                },
                child: ListTile(
                  trailing:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: ()async{
                        Uri sms=Uri(
                          scheme: 'sms',
                          path: Provider.of<MyAllListController>(context,listen: false).getmyallcontacts[index].contact,
                        );
                        await launchUrl(sms);
                      }, icon: Icon(Icons.message,color: Colors.blue,)),
                      SizedBox(width: 20,),
                    ],
                  ),
                  leading: CircleAvatar(radius: 50,backgroundImage: FileImage(File(Provider.of<MyAllListController>(context,listen: false).getmyallcontacts[index].Image)),),
                  title: Text(provider.getmyallcontacts[index].name),
                  subtitle: Text(provider.getmyallcontacts[index].chats,style: TextStyle(fontSize: 18),),
                ),
              ),
              ),
            ),
// call page
            Consumer<MyAllListController>(
              builder:(context,provider, child) => ListView.builder(itemCount:provider.getmyallcontacts.length,itemBuilder: (context, index) => GestureDetector(
                onTap:()async{
                  // await Navigator.of(context).pushNamed(Myroutes.contact_details_page,arguments: index);
                },
                child: ListTile(
                  trailing:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: ()async{
                        void Caller(){
                          Phone_Number=Provider.of<MyAllListController>(context,listen: false).getmyallcontacts[index].contact;
                        }
                        bool? result= await FlutterPhoneDirectCaller.callNumber(Phone_Number!);
                        Caller();
                      }, icon: Icon(Icons.call,color: Colors.green,)),
                      SizedBox(width: 20,),
                      IconButton(onPressed: (){
                        Provider.of<MyAllListController>(context,listen: false).RemoveListContact(index: index);
                      }, icon: Icon(Icons.delete,color: Colors.red,)),
                    ],
                  ),
                  leading: CircleAvatar(radius: 50,backgroundImage: FileImage(File(Provider.of<MyAllListController>(context,listen: false).getmyallcontacts[index].Image)),),
                  title: Text(provider.getmyallcontacts[index].name),
                  subtitle: Text(provider.getmyallcontacts[index].contact,style: TextStyle(fontSize: 18),),
                ),
              ),
              ),
            ),
// settings pages
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: Formkey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
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
                                 },),
                               ),
                             ],
                           ),
                           SizedBox(height: 50,),
                           Stack(
                             alignment: Alignment.bottomRight,
                             children:[  Stack(
                                 alignment: Alignment.bottomRight,
                                 children:[ CircleAvatar(radius: 80,
                                   foregroundImage:  provider.Image!=null?FileImage(provider.Image! as File):null,
                                 ),
                                   FloatingActionButton.small(onPressed: (){
                                     showDialog(context: context, builder:(context) => AlertDialog(
                                       title: Text("Choose Your Way"),
                                       actions: [
                                         ElevatedButton(onPressed: ()async{
                                           ImagePicker picker=ImagePicker();
                                           XFile? image = await picker.pickImage(source: ImageSource.camera);
                                           Navigator.of(context).pop();
                                           if (image != null) {
                                             provider.SetImage(MyImage: File(image.path));
                                           }

                                         }, child: Text("Camera"),),
                                         ElevatedButton(onPressed: ()async{
                                           ImagePicker picker=ImagePicker();
                                           XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                           Navigator.of(context).pop();
                                           if (image != null) {
                                             provider.SetImage(MyImage: File(image.path));
                                           }
                                         }, child: Text("Gallery"),),
                                       ],
                                     ),);
                                   },child: Icon(Icons.add),)
                                 ]),
                               FloatingActionButton.small(onPressed: (){},child: Icon(Icons.camera),)
                       ],
                           ),
                           SizedBox(height: 30,),
                           Transform.scale(
                             scale: 0.7,
                             child: TextFormField(
                               validator: (val){
                                 if(val!.isEmpty)
                                 {
                                   return "Please enter the name";
                                 }
                                 else
                                 {
                                   return null;
                                 }
                               },

                             ),
                           ),
                           Transform.scale(
                             scale: 0.7,
                             child: TextFormField(
                               validator: (val){
                                 if(val!.isEmpty)
                                 {
                                   return "Please enter the contact";
                                 }
                                 else
                                 {
                                   return null;
                                 }
                               },
                             ),
                           ),
                           SizedBox(height: 20,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               TextButton(onPressed: (){
                                 if(Formkey.currentState!.validate())
                                 {
                                    Formkey.currentState!.save();
                                     ScaffoldMessenger.of(context).showSnackBar(
                                       const SnackBar(duration: Duration(seconds: 2),behavior:SnackBarBehavior.floating,content: Text("Successfully Contact Added !!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green),
                                     );
                                     Navigator.of(context).pop();

                                 }
                               }, child: Text("Save")),
                               TextButton(onPressed: (){}, child: Text("Clear"))
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
                            },),
                          ),
                        ],
                      ),
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
                          child: Switch(value: provider.IsDark, onChanged: (val){
                            Provider.of<PlatformController>(context,listen: false).ChangeMyTheme();
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        extendBody: true,
        ),
      );
  }
}
// BottomNavigationBar(
// currentIndex: provider.MyIndex,
// onTap: (index){
// provider.ChangeMyPage(index: index);
// },
// selectedItemColor:(Provider.of<PlatformController>(context,listen: false).IsDark)?Colors.amber:Colors.blue,
// items: <BottomNavigationBarItem>[
// BottomNavigationBarItem(icon: Icon(Icons.chat_sharp),label: "Chats"),
// BottomNavigationBarItem(icon: Icon(Icons.call),label: "Calls"),
// BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
// ]),