import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  User? auth = FirebaseAuth.instance.currentUser;
  final storageRef = FirebaseStorage.instance.ref();

  Future<void> userSetup(String displayName) async {
     FirebaseFirestore.instance
        .collection('users')
        .doc(auth?.uid)
        .set({'displayName': displayName, 'uid': auth?.uid});
    return;
  }
}
