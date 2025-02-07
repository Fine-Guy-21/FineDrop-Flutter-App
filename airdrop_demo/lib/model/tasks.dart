class Task {
  String taskImage;
  String taskName;
  String taskLink;
  int taskReward;
  TaskStatus taskStatus; // Make this non-nullable

  Task({
    required this.taskImage,
    required this.taskName,
    required this.taskLink,
    required this.taskReward,
    this.taskStatus = TaskStatus.incompleted, // Default value
  });

  // Method to change the task status
  void changeTaskStatus(TaskStatus newStatus) {
    taskStatus = newStatus;
  }
}

enum TaskStatus {
  completed,
  incompleted,
}

List<Task> fineDropTasks = [
    Task(
      taskImage: 'https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png&color=000000', // Placeholder image
      taskName: 'Follow FineDrop on X',
      taskLink: 'https://x.com/FineDrop',
      taskReward: 3000,
      taskStatus: TaskStatus.incompleted,
    ),
    Task(
      taskImage: 'https://img.icons8.com/?size=100&id=13912&format=png&color=000000', // Placeholder image
      taskName: 'Like FineDrop on Facebook',
      taskLink: 'https://facebook.com/FineDrop',
      taskReward: 1500,
      taskStatus: TaskStatus.incompleted,
    ),
    Task(
      taskImage: 'https://img.icons8.com/?size=100&id=119026&format=png&color=000000', // Placeholder image
      taskName: 'Share FineDrop on Instagram',
      taskLink: 'https://instagram.com/FineDrop',
      taskReward: 2000,
      taskStatus: TaskStatus.incompleted,
    ),
    Task(
      taskImage: 'https://img.icons8.com/?size=100&id=2mIgusGquJFz&format=png&color=000000', // Placeholder image
      taskName: 'Join FineDrop on Discord',
      taskLink: 'https://discord.com/invite/FineDrop',
      taskReward: 2500,
      taskStatus: TaskStatus.incompleted,
    ),
    Task(
      taskImage: 'https://img.icons8.com/?size=100&id=19318&format=png&color=000000', // Placeholder image
      taskName: 'Subscribe to FineDrop on YouTube',
      taskLink: 'https://youtube.com/c/FineDrop',
      taskReward: 3000,
      taskStatus: TaskStatus.incompleted,
    ),
    Task(
      taskImage: 'https://img.icons8.com/?size=100&id=63306&format=png&color=000000', // Placeholder image
      taskName: 'Subscribe to FineDrop on Telegram',
      taskLink: 'https://t.me/FineDrop',
      taskReward: 3000,
      taskStatus: TaskStatus.incompleted,)
    ];
    
   
