import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:platform_controller/controllers/contacts.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAllListController extends ChangeNotifier
{
  SharedPreferences prefs;

  final String _sfname="all_name";
  final String _sfcontact="all_contact";
  final String _sfchats="all_chats";
  final String _sfimage="all_image";


  List<String> _allNames=[];
  List<String> _allContact=[];
  List<String> _allChats=[];
  List<String> _allImages=[];


  List<MyContacts>AllMyContacts=[];
  List<MyContacts>AllMyUpdateContacts=[];

  MyAllListController({required this.prefs});

  List<String> get getallname{
    _allNames=prefs.getStringList(_sfname)??[];
    return _allNames;
  }

  List<String> get getallcontact{
    _allContact=prefs.getStringList(_sfcontact)??[];
    return _allContact;
  }

  List<String> get getallchats{
    _allChats=prefs.getStringList(_sfchats)??[];
    return _allChats;
  }


  List<MyContacts> get getmyallcontacts{

    _allNames=prefs.getStringList(_sfname)??[];
    _allContact=prefs.getStringList(_sfcontact)??[];
    _allChats=prefs.getStringList(_sfchats)??[];
    _allImages=prefs.getStringList(_sfimage)??[];

    AllMyContacts=List.generate(_allNames.length, (index) =>MyContacts(name: _allNames[index], contact: _allContact[index], chats:_allChats[index], Image: _allImages[index]),);

    return AllMyContacts;
  }



  void AddListContact({required String name,required String contact,required String email,required String image}){
    _allNames=prefs.getStringList(_sfname)??[];
    _allContact=prefs.getStringList(_sfcontact)??[];
    _allChats=prefs.getStringList(_sfchats)??[];
    _allImages=prefs.getStringList(_sfimage)??[];

    _allNames.add(name);
    _allContact.add(contact);
    _allChats.add(email);
    _allImages.add(image);

    prefs.setStringList(_sfname, _allNames);
    prefs.setStringList(_sfcontact, _allContact);
    prefs.setStringList(_sfchats, _allChats);
    prefs.setStringList(_sfimage, _allImages);

    notifyListeners();
  }

  void UpdateListContact({required String name,required String contact,required String email,required index,required String image}){
    _allNames=prefs.getStringList(_sfname)??[];
    _allContact=prefs.getStringList(_sfcontact)??[];
    _allChats=prefs.getStringList(_sfchats)??[];
    _allImages=prefs.getStringList(_sfimage)??[];

    _allNames[index]=getmyallcontacts[index].name;
    _allContact[index]=getmyallcontacts[index].contact;
    _allChats[index]=getmyallcontacts[index].chats;
    _allImages[index]=getmyallcontacts[index].Image as String;

    prefs.setStringList(_sfname, _allNames);
    prefs.setStringList(_sfcontact, _allContact);
    prefs.setStringList(_sfchats, _allChats);
    prefs.setStringList(_sfimage, _allImages);

    notifyListeners();
  }

  void RemoveListContact({required index}){
    _allNames=prefs.getStringList(_sfname)??[];
    _allContact=prefs.getStringList(_sfcontact)??[];
    _allChats=prefs.getStringList(_sfchats)??[];
    _allImages=prefs.getStringList(_sfimage)??[];

    _allNames.removeAt(index);
    _allContact.removeAt(index);
    _allChats.removeAt(index);
    _allImages.removeAt(index);


    prefs.setStringList(_sfname, _allNames);
    prefs.setStringList(_sfcontact, _allContact);
    prefs.setStringList(_sfchats, _allChats);
    prefs.setStringList(_sfimage, _allImages);

    notifyListeners();
  }


}
