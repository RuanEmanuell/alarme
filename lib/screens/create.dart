import 'package:flutter/material.dart';
import 'package:alarme/controller/controller.dart';
import 'package:provider/provider.dart';

import "home.dart";

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreen createState() => _CreateScreen();
}

class _CreateScreen extends State<CreateScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Create an alarm", style: TextStyle(color: Colors.black)),
        ),
        body: Center(
          child: Container(
            width: screenWidth / 1.1,
            height: screenHeight / 1.3,
            margin: const EdgeInsets.only(bottom: 70),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: ListView(children: [
              Consumer<Controller>(builder: (context, value, child) {
                return Container(
                    child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: screenWidth / 2,
                    child: InkWell(
                        child: Row(children: [
                          Text("${Provider.of<Controller>(context).time.hour.toString()}:",
                              style: const TextStyle(color: Colors.white, fontSize: 70)),
                          Text(Provider.of<Controller>(context).time.minute.toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 70)),
                        ]),
                        onTap: () async {
                          var newTime = await showTimePicker(
                              context: context,
                              initialTime: Provider.of<Controller>(context, listen: false).time);
                          if (newTime == null) return;
                          setState(() {
                            Provider.of<Controller>(context, listen: false).time = newTime;
                          });
                        }),
                  ),
                  SizedBox(height: screenWidth / 1.2),
                  const Text("Alarm name:", style: TextStyle(color: Colors.white, fontSize: 40)),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2))),
                      onChanged: (value) {
                        Provider.of<Controller>(context, listen: false).name = value;
                      },
                    ),
                  )
                ]));
              })
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 104, 104, 104),
            onPressed: () {
              Provider.of<Controller>(context, listen: false).incNumber();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ));
            },
            child: const Icon(Icons.check, color: Colors.white)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
