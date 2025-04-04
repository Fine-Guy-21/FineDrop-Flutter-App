// ignore_for_file: deprecated_member_use

import 'package:finedrop/model/color.dart';
import 'package:finedrop/model/tasks.dart';
import 'package:finedrop/model/user.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  final UserProfile user;
  const TasksPage({super.key, required this.user});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    super.initState();
  }

  void _updateUserPoints(int pointsChange) {
    setState(() {
      widget.user.userPoints += pointsChange; // Update userPoints
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            // Amount of points
            Container(
              margin: const EdgeInsets.fromLTRB(6, 5, 6, 5),
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.attach_money,
                      size: 30, color: Colors.yellow),
                  Text(
                    '${widget.user.userPoints.toInt()}',
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Main action area
            Container(
              margin: const EdgeInsets.fromLTRB(6, 10, 6, 15),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: screenWidth,
              height: screenHeight * (81 / 100),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 5,
                children: [
                  const Text(
                    'Tasks',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: fineDropTasks.length,
                      itemBuilder: (context, index) {
                        final task = fineDropTasks[index];
                        return TaskItem(
                          task: task,
                          updatePoints: _updateUserPoints, // Pass callback
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  final Task task;
  final Function(int) updatePoints; // Callback to update user points

  const TaskItem({super.key, required this.task, required this.updatePoints});

  @override
  TaskItemState createState() => TaskItemState();
}

class TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green[200],
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image & Task Detail
          Expanded(
            child: Row(
              children: [
                // Image
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: Image.network(
                    widget.task.taskImage,
                    fit: BoxFit.contain,
                  ),
                ),

                // Task Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.taskName,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: _checkStatus(widget.task)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.attach_money,
                              size: 12, color: AppColors.textPrimary),
                          Text(
                            '${widget.task.taskReward}',
                            style: const TextStyle(
                                fontSize: 13, color: AppColors.textPrimary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Task Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: _checkStatus(widget.task)
                  ? AppColors.primaryColor
                  : AppColors.backgroundColor, // Custom green
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
            onPressed: () {
              _changeStatus(widget.task);
            },
            child: _checkStatus(widget.task)
                ? const Icon(Icons.check, color: AppColors.surfaceColor)
                : const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppColors.surfaceColor,
                  ),
          ),
        ],
      ),
    );
  }

  void _changeStatus(Task task) {
    setState(() {
      if (task.taskStatus == TaskStatus.completed) {
        task.changeTaskStatus(TaskStatus.incompleted);
        widget.updatePoints(-task.taskReward); // Deduct points
      } else {
        task.changeTaskStatus(TaskStatus.completed);
        widget.updatePoints(task.taskReward); // Add points
      }
    });
  }

  bool _checkStatus(Task task) {
    return task.taskStatus == TaskStatus.completed;
  }
}
