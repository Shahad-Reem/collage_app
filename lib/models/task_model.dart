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

  Task.fromMap(Map snapshot, String id)
      : id = id ?? '',
        title = snapshot['title'] ?? '',
        date = snapshot['date'] ?? '',
        startTime = snapshot['startTime'] ?? '',
        endTime = snapshot['endTime'] ?? '',
        description = snapshot['description'] ?? '';

  toJson() {
    return {
      "title": title,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "description": description
    };
  }
}
