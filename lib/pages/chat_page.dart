import 'package:ai_app/widgets/side_bar.dart';
import 'package:ai_app/widgets/sources_section.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/widgets/answer_section.dart';

class ChatPage extends StatelessWidget {
  final String question;

  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          const SizedBox(width: 100),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align content to the left
                  children: [
                    // Question section with proper padding
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        question,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
              
                    // Sources section with matching padding
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SourcesSection(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AnswerSection(),
                      
                )],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
