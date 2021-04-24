import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String description;

  Task(
      {this.title,
      this.date,
      this.startTime,
      this.endTime,
      this.description,
      this.id});
  // changed the Map type from dynamic => String, dynamic
  Map<String, dynamic> toMap() {
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
