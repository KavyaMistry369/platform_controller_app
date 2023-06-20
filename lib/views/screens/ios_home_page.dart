import 'package:flutter/cupertino.dart';
import 'package:platform_controller/views/screens/Ios_add_page.dart';
import 'package:platform_controller/views/screens/ios_call_page.dart';
import 'package:platform_controller/views/screens/ios_settings_page.dart';

List MyPages=[
  Homeios(),
  Callios(),
  Ios_Add(),
  Settings(),
];

class Homeios extends StatelessWidget {
  Homeios({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2),label: "Chats"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone),label: "Calls"),
        BottomNavigationBarItem(icon:Icon(CupertinoIcons.person_add),label: "Add"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: "Settings"),
      ]), tabBuilder: (BuildContext context, int index) {
     return Builder(builder: (context) => MyPages[index],);
    },
    );
  }
}

// CupertinoPageScaffold(
//   navigationBar: CupertinoNavigationBar(
//     leading: GestureDetector(
//         onTap: (){
//
//         },
//         child: Icon(CupertinoIcons.person_add)),
//     // leading: GestureDetector(onTap: (){
//     //  showCupertinoModalPopup(context: context, builder: (context) =>  Container(
//     //    height: 300,
//     //    width: 400,
//     //    decoration: BoxDecoration(
//     //      borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
//     //      color: CupertinoColors.white,
//     //    ),
//     //    child: CupertinoDatePicker(
//     //      mode: CupertinoDatePickerMode.date,
//     //      onDateTimeChanged: (value) {
//     //        Provider.of<MyDate>(context,listen: false).changemydate(Date: value);
//     //        Provider.of<MyDate>(context,listen: false).mydate=value;
//     //    },initialDateTime: Provider.of<MyDate>(context,listen:false).mydate,),
//     //  ));
//     // },child: Icon(CupertinoIcons.calendar)),
//     trailing: Consumer<PlatformController>(builder: (context,provider, child) =>CupertinoSwitch(value:provider.isAndroid, onChanged: (val){
//       provider.platform(val: val);
//     })),
//     middle: const Text("Ios OS",style: TextStyle(fontSize: 30),),
//   ),
//   child: Center(
//     child: CupertinoListSection(
//       children: [
//         Text("Ios"),
//         CupertinoTabView(
//           builder: (context) {
//             return Container(
//               height: 400,
//               width: 300,
//               color: CupertinoColors.activeGreen,
//             );
//           },
//         ),
//       ],
//     ),),
// ),
