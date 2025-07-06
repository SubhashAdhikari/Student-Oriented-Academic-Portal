import 'package:flutter/material.dart';

class SkillDevelopmentScreen extends StatelessWidget {
  const SkillDevelopmentScreen({Key? key}) : super(key: key);

  final List<String> topics = const [
    "Data Structures & Algorithms",
    "Flutter App Development",
    "Machine Learning",
    "Web Development",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Development')),
      body: ListView.builder(
        itemCount: topics.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.lightbulb_outline, color: Colors.green),
              title: Text(topics[index], style: const TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Coming soon: ${topics[index]}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
