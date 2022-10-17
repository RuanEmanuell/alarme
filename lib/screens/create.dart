import 'package:flutter/material.dart';
import 'package:alarme/controller/controller.dart';
import 'package:provider/provider.dart';

import "home.dart";

class CreateScreen extends StatefulWidget{
  @override
  _CreateScreen createState()=> _CreateScreen();
}

class _CreateScreen extends State<CreateScreen>{
  TimeOfDay time=TimeOfDay.now();
  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor:Colors.white,
        elevation:0,
        title:const Text("Create an alarm", style:TextStyle(
          color:Colors.black
         )
        ),
      ),
      body:Center(
        child: Container(
          width:screenWidth/1.1,
          height:screenHeight/1.3,
          margin:EdgeInsets.only(bottom: 70),
          decoration:BoxDecoration(
           color:Colors.black,
           borderRadius:BorderRadius.circular(20)
          ),
          child: Column(
            children:[
              Consumer<Controller> (
              builder: (context, value, child) {
              return InkWell(
                child:Container(
                  child:Column(
                    children:[
                      Container(
                        margin:EdgeInsets.only(top: 20),
                        width:screenWidth/2,
                        child: Row(
                          children:[
                          Text("${time.hour.toString()}:", style:TextStyle(
                            color:Colors.white,
                            fontSize:70
                          )),
                          Text(time.minute.toString(), style:TextStyle(
                            color:Colors.white,
                            fontSize:70
                          )),
                          ]
                        ),
                      )
                    ]
                  )
                ),
                onTap:() async{
                  var newTime=await showTimePicker(
                    context:context, 
                    initialTime: time,
                  );
                  if(newTime==null) return;
                  setState((){
                   time=newTime;
                  });
                  
                }
             );
              }
            )
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:const Color.fromARGB(255, 104, 104, 104),
        onPressed:(){
          Provider.of<Controller>(context, listen:false).incNumber();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:(context) {
                return HomeScreen();
              },
            )
          );
        },
        child:const Icon(Icons.check, color:Colors.white)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}

