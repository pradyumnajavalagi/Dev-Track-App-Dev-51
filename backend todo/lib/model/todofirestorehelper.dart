import 'package:flutter_todo_app/model/tasksdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoFirestoreHelper {

  static Stream<List<TaskModel>> read() {

    final taskscollection = FirebaseFirestore.instance.collection('Task');

    return taskscollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => TaskModel.fromSnapshot(e)).toList());
  }

  static Future createtask(TaskModel task) async {
    final tasksCollection = FirebaseFirestore.instance.collection('Task');

    final taskid = tasksCollection.doc().id;
    final docRef = tasksCollection.doc(taskid);

    final newTask = TaskModel(
        id: taskid,
        taskname: task.taskname
    ).toJsom();

    try {
      await docRef.set(newTask);
    }
    catch (e) {
      print("Error occured $e");
    }
  }

  static Future delete(TaskModel task) async {
    final tasksCollection = FirebaseFirestore.instance.collection('tasks');
    final docRef = tasksCollection.doc(task.id).delete();
  }
}

