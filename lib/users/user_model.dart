class UserModel{
  final String taskName;
  final String taskDesc;
  final String tagTask;

   UserModel({
    required this.taskName,
    required this.taskDesc,
    required this.tagTask,
});
  toJson(){
    return {
      'TaskName': taskName,
      'TaskDesc': taskDesc,
      'tagTask': tagTask,
    };
  }
}
