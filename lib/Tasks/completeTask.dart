import 'package:assaiment4/TaskModel.dart';
import 'package:assaiment4/dataBase/sc_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompleteTasks extends StatefulWidget {
  Task task;
  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  Task updateTask;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<ScreenProvider>(builder: (context, value, child) {
      value.updateListVComplete();
      return ListView.builder(
        itemCount: value.countComplete,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: GestureDetector(
                child: Icon(Icons.delete, color: Colors.black54),
                onTap: () {
                  value.deleteTaskComplete(
                      context, value.taskListComplete[position]);
                },
              ),
              trailing: Checkbox(
                value: value.isDoneValueComplete(
                  value.taskListComplete[position].isComplate,
                ),
                onChanged: (newvalue) {
                  updateTask = value.taskListComplete[position];
                  int changeValue = newvalue == true ? 1 : 0;
                  updateTask.isComplate = changeValue;
                  setState(() {
                    value.updateTComplete(updateTask);
                  });
                },
              ),
              title: Text(value.taskListComplete[position].taskName),
            ),
          );
        },
      );
    }));
  }
}
