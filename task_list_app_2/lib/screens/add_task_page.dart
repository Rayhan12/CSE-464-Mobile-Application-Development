import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_app_2/models/task_model.dart';
import 'package:task_list_app_2/screens/home_page.dart';
import 'package:task_list_app_2/services/task_management_service.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Task Page')),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  
                  final tms = Provider.of<TaskManagementService>(
                    context,
                    listen: false,
                  );

                  final TaskModel newtask = TaskModel(
                    index: DateTime.now().microsecondsSinceEpoch,
                    title: titleController.text,
                    description: descriptionController.text,
                  );

                  tms.addTask(newtask);

                  titleController.clear();
                  descriptionController.clear();

                  ScaffoldMessenger.of( context).showSnackBar(
                    SnackBar(content: Text('Task Added Successfully')),
                  );

                  Navigator.of(context).pop();



                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
