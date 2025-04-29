import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void displayMessageToUser(String massage,BuildContext context){
showDialog(context: context, builder: (context) => AlertDialog(title: Text(massage),),);
}