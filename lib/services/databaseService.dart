import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
   User user = FirebaseAuth.instance.currentUser;
  //Collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUser(String fullName, DateTime userCreatedDate, String userBio) async {
    return await usersCollection
        .doc(uid)
        .set({'fullName': fullName, 'createdDate': userCreatedDate, 'userBio': userBio});
  }


  Future<String> getUserName() async {
    User user = FirebaseAuth.instance.currentUser;
    var doc = usersCollection.doc(user.uid);
    String fullName;
    await doc.get().then((value) => {
          fullName = value.data()["fullName"],
          print(fullName)
        });
      return fullName;
  }

  Future<String> getUserBio() async{
    User user = FirebaseAuth.instance.currentUser;
    var doc = usersCollection.doc(user.uid);
    String userBio;
    await doc.get().then((value) => {
      userBio = value.data()["userBio"],
      print(userBio)
    });
    return userBio;
  }

  Future updateBio(bioText) async{
    var doc = usersCollection.doc(user.uid);
    await doc.update({
      'userBio': bioText
    });
 }
}