import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{

  final String? id;
  final String? taskname;

   TaskModel({this.id, this.taskname});

   factory TaskModel.fromSnapshot(DocumentSnapshot snap){
     var snapshot = snap.data() as Map<String, dynamic>;

     return TaskModel(
       taskname: snapshot['taskname'],
     );
   }
   Map<String, dynamic>toJsom() =>{
     "id": id,
     "taskname": taskname
   };
}