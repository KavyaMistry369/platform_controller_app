import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/platform_provider.dart';
import '../../utils/route_utils.dart';

class Andro_Profile extends StatelessWidget {
  const Andro_Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformController>(
      builder:(context,provider, child) => Scaffold(
        body:  Column(
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
      ),
    );
  }
}
