import 'package:firebase_auth/firebase_auth.dart';
import 'package:wildnature/services/databaseService.dart';
import 'package:wildnature/models/userModel.dart';

class AuthenticationService {
  final DateTime userCreatedDate = DateTime.now();
  final FirebaseAuth _firebaseAuth;

  UserModel userFirebaseToModel(User user){
    return user != null ? UserModel(uid: user.uid) : null; 
  }

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future signUp(
      {String fullName, String email, String password}) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUser(fullName, userCreatedDate, 'Here Your Bio!');
      return userFirebaseToModel(user);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signIn({String email, String password}) async {
    try {
     UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = credential.user;
        return userFirebaseToModel(user);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
