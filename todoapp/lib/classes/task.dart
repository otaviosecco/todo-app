import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String id;
  final String name;
  final DateTime date;
  final String category;
  final bool completed;

  Task(this.id, this.name, this.date, this.category, this.completed);

  String toString() {
    return 'Task{id: $id, name: $name, date: $date, category: $category, completed: $completed}';
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        category = json['category'],
        name = json['name'],
        date = DateTime.parse(json['date']),
        completed = json['completed'];
}
