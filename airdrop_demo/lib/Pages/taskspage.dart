import 'package:airdrop_demo/designs/color.dart';
import 'package:airdrop_demo/model/tasks.dart';
import 'package:airdrop_demo/model/user.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late final UserProfile _user = UserProfile()..userName = 'FineGuy';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    final screenWidth = MediaQuery.of(context).size.width - 30;

    return SafeArea(
      child: Center(
        child: Column(
        children: [
          // App Bar
          Container(
            height: screenHeight * (9 / 100),
            width: screenWidth,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.surfaceColor,
              border: Border.all(color: AppColors.primaryColor, width: 1),
            ),
            child: AnimatedTextKit(
              onTap: () => {},
              animatedTexts: [
                TyperAnimatedText(
                  'Hello, ${_user.userName}',
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.start,
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
          
          // Amount of points
          Container(
            margin: const EdgeInsets.fromLTRB(6, 5, 6, 5),
            padding: const EdgeInsets.fromLTRB(0, 2, 0, 2 ),
            width: screenWidth,

            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryColor, 
                width: 1),
            ),
            child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.attach_money,
                            size: 30, color:Colors.yellow),
                        Text(
                          '${_user.userPoints}',
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        )
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
                const Text('Tasks',
                    textAlign: TextAlign.start,
                    style:  TextStyle(
                      fontSize: 25,
                      color: AppColors.textPrimary,
                    )),

                Expanded(
              child: ListView.builder(
                itemCount: fineDropTasks.length,
                itemBuilder: (context, index) {
                  final task = fineDropTasks[index];
                  return TaskItem(task: task);
                },
              ),
            ),
              ],
            )
          )
        ],
      ),
  
      ));
  }
}

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

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
                    "${task.taskImage}",
                    fit: BoxFit.contain,
                  ),
                ),

                // Task Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${task.taskName}",
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('${task.taskReward}\$'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Task Button
          ElevatedButton(
            onPressed: () {
              print('Opening link: ${task.taskLink}');
            },
            child: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        ],
      ),
    );
  }
}
