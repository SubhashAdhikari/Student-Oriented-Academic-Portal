import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'notes_screen.dart';
import 'pyqs_screen.dart';
import 'skill_development_screen.dart';
import 'college_events_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget buildCard(BuildContext context, String label, IconData icon,
      Widget screen, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: screen,
            type: PageTransitionType.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400),
          ),
        );
      },
      child: Card(
        color: color.withOpacity(0.1),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Row(
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(width: 20),
              Text(
                label,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 18)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIPS Hub'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Welcome to VIPS Hub 👋",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            buildCard(context, ' Notes', Icons.note_alt, const NotesScreen(),
                Colors.blue),
            buildCard(context, ' PYQs', Icons.history_edu, const PyqsScreen(),
                Colors.purple),
            buildCard(context, ' Skill Development', Icons.lightbulb,
                const SkillDevelopmentScreen(), Colors.green),
            buildCard(context, ' College Events', Icons.event,
                const CollegeEventsScreen(), Colors.orange),
          ],
        ),
      ),
    );
  }
}
