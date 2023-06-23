import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:platform_controller/controllers/contact_controller.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/modals/modal%20_class.dart';
import 'package:platform_controller/utils/route_utils.dart';
import 'package:provider/provider.dart';

import '../../controllers/platform_provider.dart';

GlobalKey<FormState>FomrKey=GlobalKey<FormState>();
String? FullName;
String? Phone_Number;
String? Chats;
File? my_image;

class Andro_Add extends StatelessWidget {
  const Andro_Add({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<MyDate>(
            builder:(context,provider, child) => IconButton(onPressed: ()async{
              DateTime? d= await showDatePicker(context: context, initialDate:provider.mydate, firstDate:DateTime(1947), lastDate: DateTime.now().add(Duration(days: 1),),
                     initialEntryMode: DatePickerEntryMode.calendarOnly,
                     initialDatePickerMode: DatePickerMode.day,
                     onDatePickerModeChange: (Date) => Provider.of<MyDate>(context,listen:true).changemydate(Date:provider.mydate));
            }, icon: Icon(Icons.calendar_month,color: Colors.white,)),
          ),
          Consumer<PlatformController>(
            builder:(context,provider, child) => IconButton(onPressed: ()async{
              TimeOfDay? t=await showTimePicker(context: context, initialTime: Provider.of<MyDate>(context,listen: false).Mytime);
              DateTime d=DateTime(0,0,0,t!.hour,t!.minute);
              Provider.of<MyDate>(context,listen: false).changemytime(time: d);
            }, icon: Icon(Icons.access_time,color: Colors.white,)),
          ),
        ],
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: Padding(padding: EdgeInsets.all(16),child: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: FomrKey,
          child: Consumer<PlatformController>(
            builder:(context,provider, child) => SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
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
                  SizedBox(height: 40,),
                  TextFormField(
                    initialValue:FullName,
                    validator: (val){
                      if(val!.isEmpty)
                        {
                          return "Please enter the full name";
                        }
                      else{
                          return null;
                      }
                    },
                    onSaved: (val){
                     FullName=val;
                    },
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),),
                  SizedBox(height: 30,),
                  TextFormField(
                    initialValue: Phone_Number,
                    validator: (val){
                      if(val!.isEmpty)
                      {
                        return "Please enter the phone number";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      Phone_Number=val;
                    },
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                  ),),
                  SizedBox(height: 30,),
                  TextFormField(
                    initialValue: Chats,
                    validator: (val){
                      if(val!.isEmpty)
                      {
                        return "Please enter the Chats";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      Chats=val;
                    },
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Chats",
                    prefixIcon: Icon(Icons.chat),
                  ),),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: ()async{
                        Directory? directory = await getExternalStorageDirectory();

                        File NewImage=await Provider.of<PlatformController>(context,listen: false).Image!.copy("${directory!.path}/${FullName}.jpg");
                        if(FomrKey.currentState!.validate())
                          {
                          FomrKey.currentState!.save();
                          Provider.of<MyAllListController>(context,listen: false).AddListContact(name: FullName!, contact: Phone_Number!, email:Chats!, image: NewImage.path);
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(duration: Duration(seconds: 2),behavior:SnackBarBehavior.floating,content: Text("Successfully Added !!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green),
                          );
                          Navigator.of(context).pop();
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(duration: Duration(seconds: 2),behavior:SnackBarBehavior.floating,content: Text("Successfully Not Added !!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.redAccent));
                          }
                      }, child: Text("Save")),
                      ElevatedButton(onPressed: (){
                        FomrKey.currentState!.reset();
                        FullName=Phone_Number=Chats=null;

                      }, child: Text("Cancel")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),),
    );
  }
}
