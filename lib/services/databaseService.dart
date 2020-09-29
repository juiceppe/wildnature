import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUser(String fullName, DateTime userCreatedDate) async {
    return await usersCollection
        .doc(uid)
        .set({'fullName': fullName, 'createdDate': userCreatedDate});
  }

  Future getUserName() async {
    User user = FirebaseAuth.instance.currentUser;
    var doc = usersCollection.doc(user.uid);
    String fullName;
    doc.get().then((value) => {
          if (value.data().length > 0) {fullName = value.data()['fullName']},
        });
    //TODO: Find a way to return fullName
  }
}
