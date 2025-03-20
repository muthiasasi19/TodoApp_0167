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
