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
          title: const Text("Your To Do list",
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
                    itemCount: value.todos.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20), color: Colors.black),
                            width: screenWidth / 1.05,
                            height: screenHeight / 8,
                            child: Stack(children: [
                              Container(
                                margin: const EdgeInsets.all(30),
                                child: Column(children: [
                                  Text("${value.todos[index]}",
                                      style: const TextStyle(color: Colors.white, fontSize: 20)),
                                ]),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: screenWidth / 1.3, top: 20),
                                  child: IconButton(
                                      icon: const Icon(Icons.check, color: Colors.white, size: 30),
                                      onPressed: () {
                                        Provider.of<Controller>(context, listen: false).removeTodo(
                                            value.removeIndex = value.todos[index]
                                        );
                                      }))
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
