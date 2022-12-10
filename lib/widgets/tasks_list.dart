import 'package:flutter/material.dart';
import 'package:tutorialblocflutter/blocs/bloc/tasks_bloc.dart';
import 'package:tutorialblocflutter/blocs/bloc_exports.dart';
import 'package:tutorialblocflutter/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return TaskTile(task: task);
          }),
    );
  }
}
