import 'package:collage_app/controllers/task_controllers.dart';
import 'package:collage_app/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskProvider with ChangeNotifier {
  final firestoreService = FireastoreController();

  var uuid = Uuid();
  String _id;
  String _title;
  DateTime _date;
  DateTime _startTime;
  DateTime _endTime;
  String _description;

  //Getters
  String get title => _title;
  DateTime get date => _date;
  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;
  String get description => _description;

  //Setters
  // apparently, we miss spelled ever setter here
  changeTitle(String value) {
    _title = value;
    notifyListeners();
  }

  //Setters
  changeDate(DateTime value) {
    _date = value;
    notifyListeners();
  }

  //Setters
  changeStartTime(DateTime value) {
    _startTime = value;
    notifyListeners();
  }

  //Setters
  changeEndTime(DateTime value) {
    _endTime = value;
    notifyListeners();
  }

  //Setters
  changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  loadValues(Task task) {
    _id = task.id;
    _title = task.title;
    _date = task.date;
    _startTime = task.startTime;
    _endTime = task.endTime;
    _description = task.description;
  }

  saveTask() {
    print(_id);
    if (_id == null) {
      var newTask = Task(
          title: title,
          date: date,
          startTime: startTime,
          endTime: endTime,
          description: description,
          id: uuid.v4());
      print('Good');
      firestoreService.saveTask(newTask);
    } else {
      //Update
      var updatedTask = Task(
          title: title,
          date: date,
          startTime: startTime,
          endTime: endTime,
          description: description,
          id: _id);
      firestoreService.saveTask(updatedTask);
    }

    Future removeTask(String id) {
      firestoreService.removeTask(id);
    }
  }
}
