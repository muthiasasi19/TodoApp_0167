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
  void _showDateTimePicker() {
    picker.DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2030, 12, 31),
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
          _isDateError = false;
        });
      },
      currentTime: _selectedDate ?? DateTime.now(),
      locale: picker.LocaleType.en,
    );
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Page'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Task Date & Time:', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Select a date & time'
                        : DateFormat(
                          'dd-MM-yyyy hh:mm a',
                        ).format(_selectedDate!),
                  ),
                ), IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _showDateTimePicker,
                ),
              ],
            ),
            if (_isDateError)
              const Text(
                'Please select a date & time',
                style: TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 10),