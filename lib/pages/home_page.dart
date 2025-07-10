import 'package:ai_app/services/chat_web_services.dart';
import 'package:ai_app/widgets/search_section.dart';
import 'package:ai_app/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:ai_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: Column(
              children: [
                const Expanded(child: SearchSection()),
                
                // Footer moved inside the Column
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  color: AppColors.background,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16, // Add spacing between items
                    children: const [
                      Text(
                        'Enterprise',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                      Text(
                        'Privacy',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                      Text(
                        'Terms',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                      Text(
                        'Pro',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
