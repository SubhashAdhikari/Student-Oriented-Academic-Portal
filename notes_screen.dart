import 'package:flutter/material.dart';
import 'pdf_viewer.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> sampleNotes = const [
    {"title": "DSA Notes", "path": "assets/pdfs/sample.pdf"},
    {"title": "AI Notes", "path": "assets/pdfs/sample.pdf"},
    {"title": "ML Notes", "path": "assets/pdfs/sample.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        itemCount: sampleNotes.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final note = sampleNotes[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
              title: Text(note["title"]!, style: const TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PdfViewerScreen(assetPath: note["path"]!),
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
