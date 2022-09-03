import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/typeadapter.dart';
import 'package:flutter_application_3/widwid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rnd = Random();

  dynamic liste = [
    TypeAdapter(
        itemType: 1,
        item: const Text(
          "Sinan",
          style: TextStyle(
              fontSize: 40, fontStyle: FontStyle.italic, color: Colors.blue),
        )),
    TypeAdapter(
        itemType: 2,
        item: Container(
          width: 100,
          height: 50,
          color: Colors.amber,
        )),
    TypeAdapter(itemType: 3, item: const CircularProgressIndicator()),
    //  TypeAdapter(itemType: 4, item:  Image.asset("lib/bayrak.jpg")),
  ];

  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //  _counter++;
      print("er");

      //rnd.nextInt(2);
      switch (rnd.nextInt(6)) {
        case 0:
          liste.add(TypeAdapter(itemType: 1, item: const Text("selam")));
          break;

        case 1:
          liste.add(TypeAdapter(
              itemType: 2,
              item: Container(width: 70, height: 30, color: Colors.green)));
          break;

        case 2:
          liste.add(TypeAdapter(
              itemType: 2,
              item: SizedBox(
                  width: 50, child: Image.asset("images/bayrak.jpg"))));
          break;

        case 3:
          liste.add(TypeAdapter(
              itemType: 2, item: const CircularProgressIndicator()));
          break;

        case 4:
          liste.add(TypeAdapter(
              itemType: 2,
              item: const CircleAvatar(
                backgroundColor: Colors.orange,
              )));
          break;

        case 5:
          liste.add(TypeAdapter(
            itemType: 2,
            item: const Icon(Icons.access_alarm, color: Colors.red),
          ));
          break;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      // _counter--;

      // liste.add(TypeAdapter(itemType: 1, item: const Text("selam")));
      // liste.add(TypeAdapter(
      //     itemType: 2,
      //     item: Container(width: 50, height: 100, color: Colors.green)));

      liste.removeAt(0);

      // liste.removeLast();

      print("decrement: ${liste.length}");
    });
  }

  void _decrementLast() {
    setState(() {
      // _counter--;

      // liste.add(TypeAdapter(itemType: 1, item: const Text("selam")));
      // liste.add(TypeAdapter(
      //     itemType: 2,
      //     item: Container(width: 50, height: 100, color: Colors.green)));

      liste.removeLast();

      // liste.removeLast();

      //  print("decrement: ${liste.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.digit1)) {
          _incrementCounter();
          // print("F5 key has been pressed.");
        }

        if (event.isKeyPressed(LogicalKeyboardKey.digit2)) {
          _decrementCounter();
          // print("F5 key has been pressed.");
        }


          if (event.isKeyPressed(LogicalKeyboardKey.digit3)) {
          _decrementLast();
          // print("F5 key has been pressed.");
        }

        //print(LogicalKeyboardKey.keyL);

        // print("a key has been pressed.");
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: liste.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: WidWid(typeAdapter: liste[index]),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
