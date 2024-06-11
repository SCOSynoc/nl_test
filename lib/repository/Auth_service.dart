import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {

  void initializeInstances();



  Future<void> loginInUserWithEmailAndPassword({
    required String email ,
    required String password,
  });

}

class AuthService extends AuthRepository {

  late FirebaseAuth auth;
  late FirebaseFirestore firestore;

  @override
  void initializeInstances() {
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
  }


  /// Firebase authentication function for firebase login
  @override
  Future<void> loginInUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw Exception(e.message);
    } on Exception catch(e) {
      throw Exception(e);
    }
  }


}

