import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; // อย่าลืม import package นี้เพื่อใช้ ImageFilter

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  // --- โทนสีเรียบง่ายแต่มีมิติ (สอดคล้องกับคอนเซปต์ใหม่) ---
  final Color myBackgroundColorCenter = const Color(
    0xFF211A16,
  ); // สีพื้นหลังเข้มตรงกลาง
  final Color myBackgroundColorEdge = const Color(
    0xFF4A3A32,
  ); // สีพื้นหลังโทนเดิมที่ขอบ
  final Color myTextColorMain = const Color(
    0xFFA09187,
  ); // สีข้อความหลัก (เช่น หัวข้อ)
  final Color myTextColorSub = const Color(
    0xFFD8D1CC,
  ); // สีข้อความรอง (เช่น ข้อมูล)
  final Color myAccentColor = const Color(
    0xFF2F6F5E,
  ); // สีเน้น (เช่น ขอบรูปโปรไฟล์, ข้อมูลบางส่วน)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // --- 1. พื้นหลังเล่นเงาเข้มด้วย Gradient ---
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  myBackgroundColorCenter, // เข้มตรงกลาง
                  myBackgroundColorEdge, // โทนเดิมที่ขอบ
                ],
                stops: const [0.3, 1.0],
              ),
            ),
          ),

          // --- 2. เนื้อหาหลัก ---
          Scaffold(
            backgroundColor: Colors
                .transparent, // ทำให้ Scaffold โปร่งใสเพื่อเห็นพื้นหลัง Stack
            appBar: AppBar(
              backgroundColor: Colors.transparent, // AppBar โปร่งใส
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: myTextColorSub),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'สายด่วน THAILAND',
                style: GoogleFonts.kanit(
                  color: myTextColorMain, // ปรับสีตัวอักษรให้เข้ากับโทนสีใหม่
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 48),

                      /// หัวข้อ (ปรับสีข้อความหลัก)
                      Text(
                        'ผู้จัดทำ',
                        style: GoogleFonts.kanit(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          color: Colors
                              .white, // ปรับเป็นสีขาวเพื่อให้เด่นบนพื้นหลังเข้ม
                        ),
                      ),
                      const SizedBox(height: 32),

                      /// โลโก้มหาวิทยาลัย (เรียบง่ายและกลมกลืน)
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.05,
                          ), // สีขาวโปร่งแสงจางๆ
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: myTextColorSub.withOpacity(0.1),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/Logosau.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.business_rounded,
                              size: 50,
                              color: myTextColorSub.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Text(
                        'มหาวิทยาลัยเอเชียอาคเนย์',
                        style: GoogleFonts.kanit(
                          fontSize: 16,
                          color: myTextColorSub.withOpacity(
                            0.7,
                          ), // ใช้สีเทาอ่อนจางๆ
                        ),
                      ),
                      const SizedBox(height: 48),

                      /// --- รูปโปรไฟล์ กระจกใส (Frosted Glass Effect) ---
                      Container(
                        width: 160, // ปรับขนาดเล็กน้อย
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1.0,
                          ),
                        ),
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5.0,
                              sigmaY: 5.0,
                            ), // สร้างเอฟเฟกต์กระจกฝ้า
                            child: Container(
                              color: Colors.white.withOpacity(
                                0.05,
                              ), // สีขาวโปร่งแสงจางๆ
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  6.0,
                                ), // Padding เพื่อให้รูปภาพมีระยะห่างจากขอบ
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: myAccentColor,
                                      width: 2.5,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 71, // ปรับรัศมี
                                    backgroundColor: Colors.white10,
                                    backgroundImage: AssetImage(
                                      'assets/images/media.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 48),

                      /// --- ข้อมูลนักศึกษา พร้อมเล่นสี ---
                      _buildSimpleInfo(
                        'รหัสนักศึกษา',
                        '6619410018',
                        myAccentColor,
                      ), // ใช้สีเน้น
                      _buildSimpleInfo(
                        'ชื่อ-สกุลนักศึกษา',
                        'นาย ภาณุพงศ์ เรียงแหลม',
                        Colors.white,
                      ),
                      _buildSimpleInfo(
                        'อีเมล์นักศึกษา',
                        's6619410018@sau.ac.th',
                        myTextColorSub,
                      ),
                      _buildSimpleInfo(
                        'ชื่อสาขาวิชา',
                        'วิศวกรรมคอมพิวเตอร์',
                        myAccentColor,
                      ), // ใช้สีเน้น
                      _buildSimpleInfo(
                        'ชื่อคณะ',
                        'คณะวิศวกรรมศาสตร์',
                        myAccentColor,
                      ), // ใช้สีเน้น

                      const SizedBox(height: 72),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างข้อมูล (ปรับสไตล์ข้อความ)
  Widget _buildSimpleInfo(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.kanit(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.6), // ใช้สีขาวจางๆ
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: GoogleFonts.kanit(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: valueColor, // ใช้สีตามที่กำหนดใน parameter
            ),
          ),
        ],
      ),
    );
  }
}
