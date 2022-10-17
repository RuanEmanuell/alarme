import 'package:flutter/material.dart';
import 'package:alarme/controller/controller.dart';
import 'package:provider/provider.dart';

import "settings.dart";
import "create.dart";

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.white,
        elevation:0,
        title:Text("AlarME", style:TextStyle(
          color:Colors.black
         )
        ),
        actions:[
          IconButton(
            icon:Icon(Icons.settings, color:Colors.black),
            onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context){
                    return SettingsScreen();
                  }
                )
              );
            }
          )
        ]
      ),
      body:ListView(
        children: [
          Center(
          child:Column(
            children:[
              Container(
                margin:EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text("Your Alarms", style:TextStyle(
                      color:Colors.black,
                      fontSize:30
                    )),
                  ],
                ),
              ),
              Consumer<Controller> (
              builder: (context, value, child) {
              return Column(
                  children:[
                  for(var i in value.alarm)
                  Container(
                    margin:EdgeInsets.all(10),
                    color:Colors.black,
                    width:screenWidth/2,
                    height:screenHeight/8
                  )
                  ]
              );
               }
              )
            ]
          )
        ),
       ]
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color.fromARGB(255, 104, 104, 104),
        onPressed:(){
          Provider.of<Controller>(context, listen:false).incNumber();
        },
        child:Icon(Icons.add, color:Colors.white)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}

