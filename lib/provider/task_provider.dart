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
  DateTimeRange _startTime;
  DateTimeRange _endTime;
  String _description;

  //Getters
  String get title => _title;
  DateTime get date => _date;
  DateTimeRange get startTime => _startTime;
  DateTimeRange get endTime => _endTime;
  String get description => _description;

  //Setters
  _changeTitle(String value) {
    _title = value;
    notifyListeners();
  }

  //Setters
  _changeDate(DateTime value) {
    _date = value;
    notifyListeners();
  }

  //Setters
  _changeStartTime(DateTimeRange value) {
    _startTime = value;
    notifyListeners();
  }

  //Setters
  _changeEndTime(DateTimeRange value) {
    _endTime = value;
    notifyListeners();
  }

  //Setters
  _changeDescription(String value) {
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
