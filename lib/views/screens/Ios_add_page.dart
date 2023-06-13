import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ios_Add extends StatelessWidget {
  const Ios_Add({super.key});

  @override
  Widget build(BuildContext context) {
    late TextEditingController _textController;
    _textController = TextEditingController();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(CupertinoIcons.back)),
        middle: Text("Add Page",style: TextStyle(fontSize: 30),),

      ),
      child: Center(
        child: CupertinoListSection(
          children: [
            SizedBox(height: 80,),
            Stack(
              alignment: Alignment.bottomRight,
              children:[ CircleAvatar(
                radius: 100,
              ),
               FloatingActionButton(onPressed: (){},child: Icon(CupertinoIcons.add),)
        ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CupertinoTextField(
                prefix: Icon(CupertinoIcons.person),
                controller: _textController,
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
