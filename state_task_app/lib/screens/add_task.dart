import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_task_app/models/task.dart';
import 'package:state_task_app/services/task_management_service.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController discreptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task Page')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Task Title'),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This cant be empty";
                }
                return null;
              },
            ),
            TextFormField(
              controller: discreptionController,
              decoration: const InputDecoration(labelText: 'Task Description'),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This cant be empty";
                }
                return null;
              },
            ),

            Consumer<TaskManagementService>(
              builder: (context, taskService, _) {
                return ElevatedButton(
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      final task = Task(
                        id: taskService.tasks.length + 1,
                        title: titleController.text,
                        description: discreptionController.text,
                      );

                      taskService.addTask(task: task);

                      titleController.clear();
                      discreptionController.clear();

                      // Message

                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Task Is Added'),)
                      );

                      Navigator.of(context).pop();

                    }
                  },

                  child: const Text('Add Task'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
