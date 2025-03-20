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

  void _addTask() {
    setState(() {
      _isError = _nameController.text.isEmpty;
      _isDateError = _selectedDate == null;
    });

    if (!_isError && !_isDateError) {
      tasks.add({
        'title': _nameController.text,
        'deadline': _selectedDate!,
        'done': false,
      });
      _nameController.clear();
      _selectedDate = null;
    }
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
                ),
                IconButton(
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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Task Name',
                      border: const OutlineInputBorder(),
                      errorText: _isError ? 'Please enter some text' : null,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'List Tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        task['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deadline: ${DateFormat('dd-MM-yyyy hh:mm a').format(task['deadline'])}',
                          ),
                          Text(
                            task['done'] ? 'Done' : 'Not Done',
                            style: TextStyle(
                              color: task['done'] ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      trailing: Checkbox(
                        value: task['done'],
                        onChanged: (bool? value) {
                          setState(() {
                            tasks[index]['done'] = value ?? task['done'];
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
