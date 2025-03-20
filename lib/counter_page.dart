import 'package:flutter/material.dart';

// Digunakan untuk public
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// Digunakan untuk private/local
class _CounterPageState extends State<CounterPage> {
  List<String> listCounter = [];
  int _counter = 1;

  void addData() {
    setState(() {
      _counter += 1;
      listCounter.add(_counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Page')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 5,
        ),
        itemCount: listCounter.length,
        itemBuilder: (context, index) {
          return CircleAvatar(
            backgroundColor: (index % 2 == 0) ? Colors.red : Colors.blue,
            child: Text('Data : ${listCounter[index]}'),
          );
        },
      ),
     