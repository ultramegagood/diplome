import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class PDFViewerScreen extends StatefulWidget {
  final Map<String, dynamic> pdfUrl;

  PDFViewerScreen({required this.pdfUrl});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  String? _localFilePath;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _downloadPDFFile();
  }

  Future<void> _downloadPDFFile() async {
    setState(() {
      loading = true;
    });
    final url = widget.pdfUrl['pdfUrl'];
    log("url is ${url}");
    final filename = url.substring(url.lastIndexOf("/") + 1);
    final directory = await getApplicationCacheDirectory();
    final path = '${directory.path}/$filename';

    setState(() {
      _localFilePath = path;
    });

    if (await File(path).exists()) {
      return;
    }

    final response = await http.get(Uri.parse(url));
    final pdfFile = File(path);
    await pdfFile.writeAsBytes(response.bodyBytes);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: loading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _localFilePath != null
              ? PDFView(
                  filePath: _localFilePath!,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: false,
                  pageSnap: true,
                  pageFling: false,
                  onError: (e) {
                    print(e);
                  },
                )
              : Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await launch(widget.pdfUrl['pdfUrl']);
                    },
                    child: Text('Open PDF in Browser'),
                  ),
                ),
    );
  }
}
