import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../controllers/date_controller.dart';


GlobalKey<FormState>Formkey=GlobalKey<FormState>();

String? name;
String? number;
String? chat;

class Ios_Add extends StatelessWidget {
   Ios_Add({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Add Page",style: TextStyle(fontSize: 30),),
        trailing: GestureDetector(
          onTap: (){
            showCupertinoModalPopup(context: context, builder: (context) =>  Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
                color: CupertinoColors.white,
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (value) {
                  Provider.of<MyDate>(context,listen: false).changemytime(time: value);
                },initialDateTime: Provider.of<MyDate>(context,listen:false).mytime,),
            ));
          },
          child: Icon(CupertinoIcons.time_solid),
        ),
        leading:  GestureDetector(onTap: (){
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
        },child: Icon(CupertinoIcons.calendar_today)),
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: CupertinoListSection(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children:[ GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
          ],
              ),
              Form(
                key: Formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CupertinoFormSection(children: [
                  Transform.scale(
                    scale: 1,
                    child: CupertinoTextFormFieldRow(
                      placeholder: "Enter the name",
                      keyboardType: TextInputType.name,
                      initialValue:name,
                      onSaved: (val){
                        name!=val;
                      },
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
                      prefix: Icon(CupertinoIcons.person),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: CupertinoColors.black,width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Transform.scale(
                    scale: 1,
                    child: CupertinoTextFormFieldRow(
                      keyboardType: TextInputType.phone,
                      initialValue: number,
                      onSaved: (val){
                        number!=val;
                      },
                      validator: (val){
                        if(val!.isEmpty)
                        {
                          return "Please enter the number";
                        }
                        else
                        {
                          return null;
                        }
                      },
                      prefix: Icon(CupertinoIcons.phone),
                      placeholder: "Enter the number",
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: CupertinoColors.black,width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Transform.scale(
                    scale: 1,
                    child: CupertinoTextFormFieldRow(
                      keyboardType: TextInputType.text,
                      initialValue: chat,
                      onSaved: (val){
                        chat!=val;
                      },
                      validator: (val){
                        if(val!.isEmpty)
                        {
                          return "Please enter the chats";
                        }
                        else
                        {
                          return null;
                        }
                      },
                      prefix: Icon(CupertinoIcons.chat_bubble),
                      placeholder: "Enter the Chats",
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: CupertinoColors.black,width: 2),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(child: Text("Save"), onPressed: (){
                      if(Formkey.currentState!.validate())
                        {
                          showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
                            content: Text("Added"),
                            actions: [
                              CupertinoButton(child: Text("Done"), onPressed: (){
                                Navigator.of(context).pop();
                              }),
                            ],
                          ),);
                        }
                      else
                        {
                          showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
                            content: Text("not Added"),
                            actions: [
                              CupertinoButton(child: Text("Done"), onPressed: (){
                                Navigator.of(context).pop();
                              }),
                            ],
                          ),);
                        }
                  },color: CupertinoColors.activeBlue,),
                  CupertinoButton(child: Text("Reset"), onPressed: (){
                    Formkey.currentState!.reset();
                    number=name=chat=null;
                  },color: CupertinoColors.activeBlue,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
