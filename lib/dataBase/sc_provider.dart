import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../TaskModel.dart';
import 'DpHelper.dart';

class ScreenProvider extends ChangeNotifier {
  DatabaseHelper helperDB = new DatabaseHelper();
  List<Task> taskListAll;
  List<Task> taskListComplete;
  List<Task> taskListInComplete;
  int countAll = 0;
  int countComplete = 0;
  int countInComplete = 0;

  void saveTaskProv(String taskNamee, int doneVale) async {
    await helperDB.insertTask(Task(taskNamee, doneVale));
    notifyListeners();
  }

  void updateListVAll() {
    final Future<Database> dbF = helperDB.initialDatabase();
    dbF.then((valueDB) {
      Future<List<Task>> taskk = helperDB.getAllTasksList();
      taskk.then((valueList) {
        this.taskListAll = valueList;
        this.countAll = valueList.length;
        notifyListeners();
      });
    });
  }

  void updateListVComplete() {
    final Future<Database> dbF = helperDB.initialDatabase();
    dbF.then((valueDB) {
      Future<List<Task>> taskk = helperDB.getTaskListComplete();
      taskk.then((valueList) {
        this.taskListComplete = valueList;
        this.countComplete = valueList.length;
        notifyListeners();
      });
    });
  }

  void updateListVInCompete() {
    final Future<Database> dbF = helperDB.initialDatabase();
    dbF.then((valueDB) {
      Future<List<Task>> taskk = helperDB.getTaskListInComplete();
      taskk.then((valueList) {
        this.taskListInComplete = valueList;
        this.countInComplete = valueList.length;
      });
    });
    notifyListeners();
  }

  bool isDoneValue(int value) {
    switch (value) {
      case 1:
        return true;
        break;
      case 0:
        return false;
        break;
    }
    notifyListeners();
  }

  bool isDoneValueComplete(int value) {
    switch (value) {
      case 1:
        return true;
        break;
      case 0:
        return false;
        break;
    }
    notifyListeners();
  }

  bool isDoneValueInComplete(int value) {
    switch (value) {
      case 1:
        return true;
        break;
      case 0:
        return false;
        break;
    }
    notifyListeners();
  }

  void deleteTaskAll(BuildContext con, Task tasks) async {
    int resault = await helperDB.deleteTask(tasks.id);
    if (resault != 0) {
      updateListVAll();
      notifyListeners();
    }
  }

  void deleteTaskComplete(BuildContext con, Task tasks) async {
    int resault = await helperDB.deleteTask(tasks.id);
    if (resault != 0) {
      updateListVComplete();
      notifyListeners();
    }
  }

  void deleteTaskInComlete(BuildContext con, Task tasks) async {
    int resault = await helperDB.deleteTask(tasks.id);
    if (resault != 0) {
      updateListVInCompete();
      notifyListeners();
    }
  }

  void updateT(Task task) async {
    int resault;
    resault = await helperDB.updateTask(task);

    if (resault == 0) {
      print("not saved");
    } else {
      print('has been saved success');
    }
    notifyListeners();
  }

  void updateTComplete(Task task) async {
    int resault;
    resault = await helperDB.updateTask(task);

    if (resault == 0) {
      print("not saved");
    } else {
      print('saved success');
    }
    notifyListeners();
  }

  void updateTInComplete(Task task) async {
    int resault;
    resault = await helperDB.updateTask(task);

    if (resault == 0) {
      print("not saved");
    } else {
      print('saved success');
    }
    notifyListeners();
  }
}
