import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collage_app/models/task_model.dart';

class TaskController {
  final String path;
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  TaskController(this.path);

  Future<DocumentReference> addTask(Task task) async {
    // Call the task's CollectionReference to add a new task
    return tasks.add(task.toJson());
  }
}
