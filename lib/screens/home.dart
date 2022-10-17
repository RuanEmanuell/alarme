import 'package:flutter/material.dart';
import 'package:alarme/controller/controller.dart';
import 'package:provider/provider.dart';

import "create.dart";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Your alarms",
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        body: ListView(children: [
          Center(
              child: Column(children: [
            Consumer<Controller>(builder: (context, value, child) {
              return SizedBox(
                height: screenHeight,
                child: ListView.builder(
                    itemCount: value.hour.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20), color: Colors.black),
                            width: screenWidth / 1.05,
                            height: screenHeight / 8,
                            child: Row(children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(children: [
                                  Text(value.alarmName[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                  Row(children: [
                                    Text("${value.hour[index]}:",
                                        style: const TextStyle(color: Colors.white, fontSize: 27)),
                                    Text("${value.minute[index]}",
                                        style: const TextStyle(color: Colors.white, fontSize: 27)),
                                  ])
                                ]),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: screenWidth / 1.9),
                                  child: IconButton(
                                      icon: const Icon(Icons.notifications_active,
                                          color: Colors.white),
                                      onPressed: () {}))
                            ]))
                      ]);
                    }),
              );
            })
          ])),
        ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 104, 104, 104),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CreateScreen();
                },
              ));
            },
            child: const Icon(Icons.add, color: Colors.white)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
