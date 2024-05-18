import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();

  Future<String?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
     );

    if (result != null && result.files.single.path != null) {
      return result.files.single.path;
    } else {
      // User canceled the picker
      return null;
    }
  }

  Future<String?> uploadFileToStorage(String filePath) async {
    File file = File(filePath);
    try {
      String fileName = file.uri.pathSegments.last;
      Reference storageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = storageRef.putFile(file);

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      // Handle errors
      print(e);
      return null;
    }
  }

  Future<void> saveFileMetadata(String downloadURL) async {
    try {
      await FirebaseFirestore.instance.collection('files').add({
        'url': downloadURL,
        'uploaded_at': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Handle errors
      print(e);
    }

}
