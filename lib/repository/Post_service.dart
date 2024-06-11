import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Auth_service.dart';

abstract class PostRepository {

  void initializeInstances();

  Stream<List<dynamic>> getAllData();


}

class PostService extends PostRepository {

  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  late AuthService authService;


  /// firebase getting all data from collection document and saving it to streams
  @override
  Stream<List<dynamic>> getAllData() {
    return firestore.collection("portal")
        .snapshots().map((event) {
      List<dynamic> postsList = [];
      for(var document in event.docs){
        postsList.add(document.data());
      }
      print("In get all posts function() :: $postsList" );
      return postsList.reversed.toList();
    });
  }

  /// firebase initialization
  @override
  void initializeInstances() {
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
  }
}
