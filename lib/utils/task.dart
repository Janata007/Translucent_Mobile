import 'dart:ffi';

class Task {
  int id;
  String name;
  String description;
  bool finished;
  String dateDue;
  String priority;

  Task(
      this.id, this.name, this.description, this.finished,  this.dateDue, this.priority);

  // named constructor
  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        finished = json['finished'],
        dateDue = json['dateDue'],
        priority = json['priority'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'inished': finished,
      'dateDue': dateDue,
      'priority': priority
    };
  }
}
