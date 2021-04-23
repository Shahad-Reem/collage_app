import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collage_app/models/task_model.dart';

class FireastoreController {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // create tasks to firestore using our Task model
  Future addTask(Task task) {
    return _db.collection('tasks').doc(task.id).set(task.toMap());
  }

  Future saveTask(Task task) {
    return _db.collection('tasks').doc(task.id).set(task.toMap());
  }

  Stream getTask() {
    return _db.collection('task').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Task.fromFirestore(document.data()))
        .toList());
  }

  Future removeTask(String id) {
    return _db.collection('Task').doc(id).delete();
  }
}
