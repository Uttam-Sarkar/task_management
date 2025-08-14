import 'package:flutter/material.dart';
import 'package:task_management/task_model.dart';

class AddTaskPage extends StatefulWidget {
  final Function(TaskModel) onAdd;

  const AddTaskPage({super.key, required this.onAdd});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();

  void _saveTask() {
    if (titleController.text.trim().isNotEmpty) {
      widget.onAdd(
        TaskModel(id: "1", date: DateTime.now(), title: titleController.text),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Task Title"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}
