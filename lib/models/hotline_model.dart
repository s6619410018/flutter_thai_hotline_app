import 'package:flutter/material.dart';

class Hotline {
  final String name;
  final String number;
  final String imagePath;
  final Color themeColor; // <--- โค้ดข้อมูลข้างบนเอาสีมาใส่ตรงนี้

  Hotline({
    required this.name,
    required this.number,
    required this.imagePath,
    required this.themeColor,
  });
}
