import 'package:diplome/models/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeacherList extends StatefulWidget {
  List<Document> documents;
  TeacherList({super.key, required this.documents});

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  @override
  Widget build(BuildContext context) {
    return   widget.documents.isNotEmpty
        ? ListView.builder(
        itemCount: widget.documents.length,
        itemBuilder: (context, index) {
          Document doc = widget.documents[index];
          return ListTile(
              title: Text(doc.name!),
              onTap: () async {
                String? downloadUrl =
                    doc.downloadUrl; // URL-адрес файла
                context
                    .push("/pdf", extra: {"pdfUrl": downloadUrl});
              });
        })
        : const Center(
      child: Text("Добавьте файл"),
    );
  }
}
