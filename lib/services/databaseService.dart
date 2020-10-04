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
}
