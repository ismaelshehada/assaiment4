import 'package:assaiment4/TaskModel.dart';
import 'package:assaiment4/dataBase/sc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InCompleteTasks extends StatefulWidget {
  @override
  _InCompleteTasksState createState() => _InCompleteTasksState();
}

class _InCompleteTasksState extends State<InCompleteTasks> {
  Task updateTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ScreenProvider>(builder: (context, value, child) {
        value.updateListVInCompete();

        return ListView.builder(
          itemCount: value.countInComplete,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: GestureDetector(
                  child: Icon(Icons.delete, color: Colors.black54),
                  onTap: () {
                    value.deleteTaskInComlete(
                        context, value.taskListInComplete[position]);
                  },
                ),
                trailing: Checkbox(
                  // activeColor: Colors.purple,
                  value: value.isDoneValueInComplete(
                    value.taskListInComplete[position].isComplate,
                  ),
                  onChanged: (newvalue) {
                    updateTask = value.taskListInComplete[position];
                    int changeValue = newvalue == true ? 1 : 0;

                    setState(() {
                      updateTask.isComplate = changeValue;
                      value.updateTInComplete(updateTask);
                    });
                  },
                ),
                title: Text(value.taskListInComplete[position].taskName),
              ),
            );
          },
        );
      }),
    );
  }
}
