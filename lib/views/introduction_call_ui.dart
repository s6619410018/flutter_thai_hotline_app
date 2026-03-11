import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_ui.dart';

class IntroductionCallUI extends StatefulWidget {
  const IntroductionCallUI({super.key});

  @override
  State<IntroductionCallUI> createState() => _IntroductionCallUIState();
}

class _IntroductionCallUIState extends State<IntroductionCallUI> {
  // --- โทนสีที่สอดคล้องกับ SplashScreen และ About ---
  final Color myBackgroundColor = const Color(0xFF4A3A32); // สีพื้นหลังเดี่ยว
  final Color myMainTextColor = const Color(0xFFA09187); // สีข้อความหลัก
  final Color mySubTextColor = const Color(0xFFD8D1CC); // สีข้อความรอง และ ปุ่ม
  final Color myShadowColor = Colors.black.withOpacity(0.3); // สีเงาจางๆ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          myBackgroundColor, // ใช้สีพื้นหลังเดี่ยวเพื่อความเรียบง่าย
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.transparent,
          pages: [
            _buildPage(
              title: "Easy travel for everyone",
              body: "รวมเบอร์โทรหน่วยงานคมนาคม หรือเหตุด่วนบนทางหลวงได้ทันที",
              imagePath: 'assets/images/subA_pic.png',
            ),
            _buildPage(
              title: "Peace of mind during emergencies",
              body:
                  "แจ้งเหตุด่วนเหตุร้าย ไฟไหม้ หรือกู้ชีพฉุกเฉิน 24 ชั่วโมง เพื่อความปลอดภัย",
              imagePath: 'assets/images/subB_pic.png',
            ),
            _buildPage(
              title: "Manage your finances quickly",
              body:
                  "เบอร์ติดต่อธนาคารชั้นนำ และบริการทางการเงินที่คุณต้องการในที่เดียว",
              imagePath: 'assets/images/subC_pic.png',
            ),
            _buildPage(
              title: "Complete government services",
              body:
                  "สาธารณูปโภคครบครัน ต่อสายตรงถึงเจ้าหน้าที่ได้ทันที ไม่ต้องเสียเวลาโทรหาหลายหน่วยงาน",
              imagePath: 'assets/images/subD_pic.png',
            ),
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroEnd(context),
          showSkipButton: true,
          // --- ปรับสไตล์ปุ่มให้เรียบง่าย (เพิ่มเงาจางๆ) ---
          skip: Text(
            'ข้าม',
            style: GoogleFonts.kanit(
              color: mySubTextColor,
              fontSize: 16,
              shadows: [
                Shadow(
                  color: myShadowColor,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),

          next: Text(
            'ถัดไป',
            style: GoogleFonts.kanit(
              color: mySubTextColor,
              fontSize: 16,
              shadows: [
                Shadow(
                  color: myShadowColor,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),

          done: Text(
            'เริ่มใช้งาน',
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.w600,
              color: mySubTextColor,
              fontSize: 18,
              shadows: [
                Shadow(
                  color: myShadowColor,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),

          // --- ปรับ DotsDecorator ให้สมดุล ---
          dotsDecorator: DotsDecorator(
            size: const Size(8.0, 8.0),
            color: mySubTextColor.withOpacity(0.4), // ใช้สี SubText ที่จางลง
            activeSize: const Size(22.0, 8.0),
            activeColor: myMainTextColor, // ใช้สี MainText เป็นสี Active
            activeShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }

  // --- ฟังก์ชันสร้างหน้า (เพิ่มลูกเล่นเงาเข้มรอบรูปภาพและข้อความ) ---
  PageViewModel _buildPage({
    required String title,
    required String body,
    required String imagePath,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          // --- เพิ่มลูกเล่นเงาเข้มรอบรูปภาพ (Card Shadow) ---
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4), // เงาเข้มขึ้นเล็กน้อย
                blurRadius: 20, // ฟุ้งกว้างขึ้น
                spreadRadius: 2, // กระจายเงา
                offset: const Offset(0, 8), // เลื่อนเงาลงด้านล่าง
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => Container(
                width: double.infinity,
                height: 260,
                color: Colors.white.withOpacity(0.05),
                child: Icon(
                  Icons.contact_phone,
                  size: 120,
                  color: mySubTextColor.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
      ),
      decoration: PageDecoration(
        pageColor: Colors.transparent,
        // --- ปรับสไตล์ข้อความ Title (เพิ่มเงาจางๆ) ---
        titleTextStyle: GoogleFonts.kanit(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          shadows: [
            Shadow(
              color: myShadowColor,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        // --- ปรับสไตล์ข้อความ Body (เพิ่มเงาจางๆ) ---
        bodyTextStyle: GoogleFonts.kanit(
          fontSize: 16,
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.w300,
          shadows: [
            Shadow(
              color: myShadowColor,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        imagePadding: const EdgeInsets.only(top: 40, bottom: 20),
        titlePadding: const EdgeInsets.only(top: 10, bottom: 16),
        bodyPadding: const EdgeInsets.symmetric(horizontal: 24),
      ),
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeUI()));
  }
}
