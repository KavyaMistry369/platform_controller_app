import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/contact_controller.dart';
import 'package:provider/provider.dart';

import '../../utils/route_utils.dart';

class Andro_Contacts extends StatelessWidget {
  const Andro_Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyAllListController>(builder: (context,provider, child) => Scaffold(
      appBar: AppBar(
      leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text("CONTACTS",style: TextStyle(fontSize: 32),),
      ),
      body:
      ListView.builder(itemCount:provider.getmyallcontacts.length,itemBuilder: (context, index) => GestureDetector(
        onTap:()async{
          // await Navigator.of(context).pushNamed(Myroutes.contact_details_page,arguments: index);
        },
        child: ListTile(
          trailing:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){
              }, icon: Icon(Icons.call,color: Colors.green,)),
              SizedBox(width: 20,),
              IconButton(onPressed: (){
                Provider.of<MyAllListController>(context,listen: false).RemoveListContact(index: index);
              }, icon: Icon(Icons.delete,color: Colors.red,)),

            ],
          ),
          leading: CircleAvatar(radius: 50,backgroundImage: FileImage(File(Provider.of<MyAllListController>(context).getmyallcontacts[index].Image)),),
          title: Text(provider.getmyallcontacts[index].name),
          subtitle: Text(provider.getmyallcontacts[index].contact,style: TextStyle(fontSize: 18),),
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        await Navigator.of(context).pushNamed(Myroutes.andro_add);
      },child: Icon(Icons.add),),
    ),);
  }
}
