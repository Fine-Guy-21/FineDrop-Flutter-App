// ignore_for_file: deprecated_member_use

import 'package:airdrop_demo/model/color.dart';
import 'package:airdrop_demo/model/tasks.dart';
import 'package:airdrop_demo/model/user.dart';
import 'package:airdrop_demo/services/local_data.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late UserProfile _user;
  final DatabaseFileRoutines db = DatabaseFileRoutines();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    UserProfile user = await db.readUserProfile();
    setState(() {
      _user = user;
    });
  }

  void _saveUserData() async {
    await db.writeUserProfile(_user);
  }

  void _updateUserPoints(int pointsChange) {
    setState(() {
      _user.userPoints += pointsChange; // Update userPoints
    });
    _saveUserData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            // Your app bar and other UI elements...

            //  Container(
            //   height: screenHeight * (9 / 100),
            //   width: screenWidth,
            //   padding: const EdgeInsets.only(right: 10, left: 5),
            //   margin: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: AppColors.surfaceColor,
            //       border: Border.all(color: AppColors.primaryColor, width: 1)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //        AnimatedTextKit(
            //               onTap: () => {},
            //               animatedTexts: [
            //                 TyperAnimatedText(
            //                   'Hello, ${_user.userName}',
            //                   textStyle: const TextStyle(
            //                     fontSize: 20,
            //                     color: AppColors.textSecondary,
            //                   ),
            //                   textAlign: TextAlign.start,
            //                   speed: const Duration(milliseconds: 100),
            //                 )
            //               ],
            //               totalRepeatCount: 2,
            //             ),
            //             IconButton(
            //                 onPressed: () {}, icon: const Icon(Icons.person))
            //     ],
            //   )),

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
                    '${_user.userPoints.toInt()}',
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
              debugPrint('Opening link: ${widget.task.taskLink}');
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
