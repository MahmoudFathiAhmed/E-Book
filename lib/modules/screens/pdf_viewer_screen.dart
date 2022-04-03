import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({Key? key, required this.url, required this.title}) : super(key: key);
  final String url;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        child: SfPdfViewer.network(url)
        ,
      ),
    );
  }
}
