import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  // โทนสีที่กำหนด
  final Color _primaryColor = const Color(0xFF4A3A32); // สีพื้นหลังหลัก
  final Color _accentColor = const Color(0xFF2F6F5E); // สีหลักเมื่อถูกเลือก

  // หน้าจอ
  final List<Widget> _pages = [
    const SubAHomeUI(),
    const SubBHomeUI(),
    const SubCHomeUI(),
    const SubDHomeUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // แสดงหน้าปัจจุบันที่เลือก
      body: _pages[_selectedIndex],

      // เน้นเรียบง่าย ตัด Container และ BoxShadow ออก
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: _primaryColor, // ใช้สีพื้นหลังหลักโดยตรง
        selectedItemColor: _accentColor, // สีไอคอนและข้อความเมื่อถูกเลือก
        unselectedItemColor: const Color(
          0xFFD1D5DB,
        ), // สีไอคอนและข้อความเมื่อไม่ได้เลือก (เทาอ่อนเพื่อความบาลานซ์)
        showSelectedLabels: true,
        showUnselectedLabels: true,

        // ปรับสไตล์ตัวอักษรให้เด่นนำสายตาแต่ไม่เวอร์
        selectedLabelStyle: GoogleFonts.kanit(
          fontWeight: FontWeight.bold, // หนาขึ้นเพื่อความชัดเจน
          fontSize: 14, // ขนาดใหญ่ขึ้นเล็กน้อย
        ),
        unselectedLabelStyle: GoogleFonts.kanit(
          fontSize: 12, // ขนาดปกติ
          fontWeight: FontWeight.normal,
        ),

        items: [
          _buildAwesomeItem(FontAwesomeIcons.car, 'การเดินทาง'),
          _buildAwesomeItem(FontAwesomeIcons.kitMedical, 'อุบัติเหตุ'),
          _buildAwesomeItem(FontAwesomeIcons.piggyBank, 'ธนาคาร'),
          _buildAwesomeItem(FontAwesomeIcons.lightbulb, 'สาธารณูปโภค'),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้าง BottomNavigationBarItem โดยใช้ FontAwesomeIcons
  BottomNavigationBarItem _buildAwesomeItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: const EdgeInsets.only(
          bottom: 4.0,
        ), // ปรับระยะห่างไอคอนกับข้อความเล็กน้อย
        child: FaIcon(
          icon,
          size: 24, // ขนาดไอคอนมาตรฐาน เรียบง่าย
        ),
      ),
    );
  }
}
