import 'package:flutter/material.dart';

class CollegeEventsScreen extends StatelessWidget {
  const CollegeEventsScreen({Key? key}) : super(key: key);

  final List<String> events = const [
    "Tech Fest 2024",
    "AI Seminar Series",
    "Cultural Night 2025",
    "Smart India Hackathon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('College Events')),
      body: ListView.builder(
        itemCount: events.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.event, color: Colors.orange),
              title: Text(events[index], style: const TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.info_outline),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(events[index]),
                    content: const Text("Event details will be added soon."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      )
                    ],
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
