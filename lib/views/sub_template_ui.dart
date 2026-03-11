import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/hotline_model.dart';

class SubHomeUI extends StatelessWidget {
  final String categoryTitle;
  final List<Hotline> hotlineList;
  final Color themeColor;
  final String bannerImage;
  final VoidCallback? onInfoPressed;

  const SubHomeUI({
    super.key,
    required this.categoryTitle,
    required this.hotlineList,
    required this.themeColor, // จะใช้สีนี้เป็นสีเน้นหลัก
    required this.bannerImage,
    this.onInfoPressed,
  });

  // --- โทนสีเรียบง่าย (สอดคล้องกับคอนเซปต์มินิมอล) ---
  final Color _backgroundColor = const Color(
    0xFFD8D1CC,
  ); // สีพื้นหลังอ่อน (อาร์ตติส)
  final Color _textColorMain = const Color(
    0xFF4A3A32,
  ); // สีข้อความหลัก/ไอคอน (น้ำตาลเข้ม)
  final Color _cardColor = const Color(
    0xFFF1EEEB,
  ); // สีพื้นหลังการ์ด (อ่อนกว่าพื้นหลังเล็กน้อย)

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor, // ใช้สีพื้นหลังที่เลือกใหม่
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent, // โปร่งใสเพื่อความต่อเนื่อง
        elevation: 0,
        centerTitle: true,
        title: Text(
          'สายด่วน THAILAND',
          style: GoogleFonts.kanit(
            color: _textColorMain.withAlpha(
              120,
            ), // ปรับสีตัวอักษรให้เข้ากับโทนสีใหม่
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: onInfoPressed,
            icon: Icon(
              Icons.info_outline,
              color: _textColorMain.withAlpha(160),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              /// หัวข้อหมวดหมู่ (ลบ Shadows)
              Text(
                categoryTitle,
                style: GoogleFonts.kanit(
                  color: _textColorMain,
                  fontSize: 28, // ปรับขนาดเล็กน้อยให้ดูสมดุล
                  fontWeight: FontWeight.w600, // ลดความหนาเล็กน้อย
                ),
              ),
              const SizedBox(height: 24),

              /// Banner ด้านบน (ลบ Shadows)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 160, // ปรับความสูงเล็กน้อย
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // ลดความโค้งเล็กน้อย
                  // ลบ BoxShadow ออกทั้งหมด
                  image: DecorationImage(
                    image: AssetImage(bannerImage),
                    fit: BoxFit.cover,
                  ),
                  // เพิ่มกรอบบางๆ เพื่อความชัดเจน
                  border: Border.all(color: _textColorMain.withAlpha(20)),
                ),
              ),
              const SizedBox(height: 32),

              /// รายการสายด่วน
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotlineList.length,
                itemBuilder: (context, index) {
                  final item = hotlineList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ), // ปรับระยะห่าง
                    decoration: BoxDecoration(
                      color: _cardColor, // ใช้สีพื้นหลังการ์ดใหม่
                      borderRadius: BorderRadius.circular(20),
                      // ใช้กรอบบางๆ แทนเงาเพื่อให้ดูเรียบง่าย
                      border: Border.all(
                        color: _textColorMain.withAlpha(15),
                        width: 1.0,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: _buildLogo(item, themeColor),
                      title: Text(
                        item.name,
                        style: GoogleFonts.kanit(
                          color: _textColorMain,
                          fontSize: 16,
                          fontWeight: FontWeight.w500, // ปรับความหนาเล็กน้อย
                        ),
                      ),
                      subtitle: Text(
                        item.number,
                        style: GoogleFonts.kanit(
                          color:
                              themeColor, // ใช้สีเน้น (themeColor) เป็นสีตัวเลข
                          fontSize: 24, // ปรับขนาดเล็กน้อย
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: _buildCallButton(
                        item,
                        themeColor,
                      ), // เรียกใช้ฟังก์ชันสร้างปุ่มโทรใหม่
                    ),
                  );
                },
              ),
              const SizedBox(height: 80), // เพิ่มระยะห่างด้านล่าง
            ],
          ),
        ),
      ),
    );
  }

  /// Widget สร้างโลโก้ (เรียบง่าย ลบแสง Shadow และ Glow)
  Widget _buildLogo(Hotline item, Color themeColor) {
    return Container(
      width: 50, // ปรับขนาดเล็กน้อยให้สมดุล
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        // ใช้กรอบบางๆ แทนเงา
        border: Border.all(color: _textColorMain.withAlpha(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0), // ปรับ Padding
        child: Image.asset(
          item.imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.image_not_supported,
            size: 20,
            color: _textColorMain.withAlpha(50),
          ),
        ),
      ),
    );
  }

  /// Widget สร้างปุ่มโทรใหม่ (เรียบง่ายและดูอาร์ตติส)
  Widget _buildCallButton(Hotline item, Color themeColor) {
    return Container(
      // ลบ Container ที่ทำหน้าที่เงาออก
      child: Material(
        color: Colors.transparent, // โปร่งใสเพื่อรับสีจากพื้นหลัง
        child: InkWell(
          onTap: () => _makePhoneCall(item.number),
          borderRadius: BorderRadius.circular(20), // เพิ่มความโค้งให้ปุ่ม
          child: Container(
            width: 48, // ปรับขนาดเล็กน้อย
            height: 48,
            decoration: BoxDecoration(
              color: themeColor.withAlpha(
                20,
              ), // ใช้สีเน้นแบบจางๆ เป็นพื้นหลังปุ่ม
              shape: BoxShape.circle, // ปรับเป็นวงกลม
              // ใช้กรอบเส้นแทนเงาเพื่อให้ดูคลาสสิกและเรียบง่าย
              border: Border.all(color: themeColor, width: 1.5),
            ),
            child: Icon(
              Icons.call,
              color: themeColor, // ใช้สีเน้นเป็นสีไอคอน
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
