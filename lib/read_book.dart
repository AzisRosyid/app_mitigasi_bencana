import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ReadBook extends StatelessWidget {
  final String pdfAssetPath;

  ReadBook({required this.pdfAssetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: PDFView(
          filePath: pdfAssetPath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageSnap: true,
          pageFling: true,
          onRender: (pages) {
            print("Rendered $pages pages");
          },
        ),
      ),
    );
  }
}

class ReadBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadBook(
                  pdfAssetPath: 'assets/pdf/book1.pdf', // Replace with your asset PDF path
                ),
              ),
            );
          },
          child: Text('Open PDF'),
        ),
      ),
    );
  }
}
