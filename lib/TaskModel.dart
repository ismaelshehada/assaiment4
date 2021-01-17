class Task {
  int id;
  String taskName;
  int isComplate = 0;

  Task(this.taskName, this.isComplate);

  Task.withId(this.id, this.taskName, this.isComplate);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id'] = id;
    map['taskName'] = taskName;
    map['isComplate'] = isComplate;

    return map;
  }

  Task.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.taskName = map['taskName'];
    this.isComplate = map['isComplate'];
  }
}
