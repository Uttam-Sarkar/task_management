import 'package:flutter/material.dart';
import 'package:task_management/task_model.dart';

import 'add_task_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TaskModel> tasks = [
    TaskModel(id: '1', title: 'Buy groceries', date: DateTime(2025, 8, 5)),
    TaskModel(
      id: '2',
      title: 'Finish Flutter project',
      date: DateTime(2025, 8, 6),
    ),
    TaskModel(id: '3', title: 'Go to the gym', date: DateTime(2025, 8, 7)),
  ];
  List<bool> isTappedList = [];

  @override
  void initState() {
    super.initState();
    isTappedList = List.filled(tasks.length+5, false); // all false initially
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task List")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = tasks[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: isTappedList[index] ? Colors.red : Colors.green,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isTappedList[index] = true;
                  });
                },
                child: const Icon(Icons.task_alt, color: Colors.green),
              ),

              title: Text(task.title),
              subtitle: Text(task.date.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // isTappedList.add(false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskPage(
                onAdd: (task) {
                  setState(() {
                    tasks.add(task);
                    // isTappedList.add(false);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
