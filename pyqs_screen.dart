import 'package:flutter/material.dart';
import 'pdf_viewer.dart';

class PyqsScreen extends StatelessWidget {
  const PyqsScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> pyqs = const [
    {"title": "PYQ 2021", "path": "assets/pdfs/sample.pdf"},
    {"title": "PYQ 2022", "path": "assets/pdfs/sample.pdf"},
    {"title": "PYQ 2023", "path": "assets/pdfs/sample.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PYQs')),
      body: ListView.builder(
        itemCount: pyqs.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final pyq = pyqs[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.library_books, color: Colors.indigo),
              title: Text(pyq["title"]!, style: const TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PdfViewerScreen(assetPath: pyq["path"]!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
