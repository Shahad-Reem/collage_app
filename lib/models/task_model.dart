import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final DateTime date;
  final DateTimeRange startTime;
  final DateTimeRange endTime;
  final String description;

  Task(
      {this.title,
      this.date,
      this.startTime,
      this.endTime,
      this.description,
      this.id});
  Map toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'description': description
    };
  }

  Task.fromFirestore(Map firestore)
      : id = firestore['id'],
        title = firestore['title'],
        date = firestore['date'],
        startTime = firestore['startTime'],
        endTime = firestore['endTime'],
        description = firestore['description'];
}
