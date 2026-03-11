import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubCHomeUI extends StatelessWidget {
  const SubCHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "ธนาคาร",
      hotlineList: HotlineData.bankHotlines, // ดึงข้อมูลจากหมวดธนาคาร
      themeColor: const Color(0xFF1FA37A), // ตัวอย่างสีเขียวเข้มแบบธนาคาร
      bannerImage: "assets/images/subC_pic.png",
      // ฟังก์ชันสำหรับกดปุ่ม Info มุมขวาบน
      onInfoPressed: () {
        Navigator.pushNamed(context, '/about');
      },
    );
  }
}
