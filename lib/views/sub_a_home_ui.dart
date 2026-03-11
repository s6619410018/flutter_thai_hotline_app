import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubAHomeUI extends StatelessWidget {
  const SubAHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "การเดินทาง",
      hotlineList: HotlineData.travelHotlines,
      themeColor: const Color(0xFF2F6F5E), // ตัวอย่างสีเขียวเข้มแบบการเดินทาง
      bannerImage: "assets/images/subA_pic.png",
      onInfoPressed: () => Navigator.pushNamed(context, '/about'),
    );
  }
}
