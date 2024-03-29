import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  
 
  Future<void> signInWithEmailAndPassword({
    required String email_,
    required String password_,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email_,
      password: password_,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email_,
    required String password_,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email_, password: password_);
  }
  //set the user name as the name of the collection
  Future<void> createCollection(String name) async {
    await _firebaseAuth.currentUser!.updateDisplayName(name);
  }
  
  
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
