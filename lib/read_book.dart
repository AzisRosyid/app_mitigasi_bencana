import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadBook extends StatelessWidget {
  final String title;
  final String pdfPath;

  ReadBook({required this.title, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SfPdfViewer.asset(pdfPath),
      ),
    );
  }
}
