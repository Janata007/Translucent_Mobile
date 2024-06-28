class Arrangement {
  String name;
  String code;
  String startTime;
  String endTime;
  String priority;

  Arrangement(
      this.name, this.code, this.startTime, this.endTime, this.priority);

  // named constructor
  Arrangement.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        priority = json['priority'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'startTime': startTime,
      'endTime': endTime,
      'priority': priority
    };
  }
}
