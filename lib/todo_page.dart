import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  bool _isError = false;
  bool _isDateError = false;

  List<Map<String, dynamic>> tasks = [
    {
      'title': 'Tugas PAM Lanjut',
      'deadline': DateTime(2025, 3, 15, 14, 3),
      'done': false,
    },
    {
      'title': 'Balik Kampung',
      'deadline': DateTime(2025, 3, 14, 12, 3),
      'done': true,
    },
  ];