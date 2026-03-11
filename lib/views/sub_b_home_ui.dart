import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubBHomeUI extends StatelessWidget {
  // แก้ตรงนี้ให้เป็น SubB
  const SubBHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "อุบัติเหตุ",
      hotlineList: HotlineData.emergencyHotlines,
      themeColor: Color(0xFF3A2E2A), // หรือสีที่คุณต้องการ
      bannerImage: "assets/images/subB_pic.png",
      onInfoPressed: () => Navigator.pushNamed(context, '/about'),
    );
  }
}
