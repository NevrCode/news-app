import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarouselItem extends StatelessWidget {
  final String judulBerita;
  final String isiBerita;
  final String imagePath;
  final String newsID;
  final String tanggal;
  final String sub;
  const CarouselItem({
    super.key,
    required this.judulBerita,
    required this.isiBerita,
    required this.imagePath,
    required this.newsID,
    required this.tanggal,
    required this.sub,
  });

  String makeDate() {
    List<String> components = tanggal.split("-");

    int day = int.parse(components[0]);
    int month = int.parse(components[1]);
    int year = 2000 + int.parse(components[2]);

    final dateFormat = DateFormat("dd MMMM yyyy");

    return dateFormat.format(DateTime(year, month, day));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.file(File(imagePath)).image,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x250F1113),
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(95, 0, 0, 0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 70, 0),
                  child: Text(
                    judulBerita,
                    style: TextStyle(
                      fontFamily: "Readex",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = Colors.black45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 70, 0),
                  child: Text(
                    judulBerita,
                    style: const TextStyle(
                      fontFamily: "Readex",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 239, 239, 239),
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(206, 0, 0, 0),
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 10),
                  child: Text(
                    makeDate(),
                    style: TextStyle(
                      fontFamily: "Readex",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 0.8
                        ..color = Colors.black45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 10),
                  child: Text(
                    makeDate(),
                    style: const TextStyle(
                      fontFamily: "Readex",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 241, 241, 241),
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(192, 0, 0, 0),
                          offset: Offset(1, 1),
                          blurRadius: 0.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
