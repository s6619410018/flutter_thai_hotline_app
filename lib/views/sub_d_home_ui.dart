import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubDHomeUI extends StatelessWidget {
  const SubDHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "สาธารณูปโภค",
      hotlineList: HotlineData.utilityHotlines, // ดึงข้อมูลจากหมวดสาธารณูปโภค
      themeColor: const Color(0xFFC44545), // ตัวอย่างสีส้มแบบงานบริการ
      bannerImage: "assets/images/subD_pic.png",
      // ฟังก์ชันสำหรับกดปุ่ม Info มุมขวาบน
      onInfoPressed: () {
        Navigator.pushNamed(context, '/about');
      },
    );
  }
}
