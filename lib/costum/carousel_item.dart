import 'dart:io';

import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String judulBerita;
  final String isiBerita;
  final String imagePath;
  const CarouselItem(
      {super.key,
      required this.judulBerita,
      required this.isiBerita,
      required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: Image.file(File(imagePath)).image),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x250F1113),
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 70, 0),
                child: Text(
                  judulBerita,
                  style: TextStyle(
                    fontFamily: "Readex",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 0.8
                      ..color = Colors.black45,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 70, 0),
                child: Text(
                  judulBerita,
                  style: const TextStyle(
                    fontFamily: "Readex",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Text(
                  isiBerita,
                  style: TextStyle(
                    fontFamily: "Readex",
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 0.8
                      ..color = Colors.black45,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Text(
                  isiBerita,
                  style: const TextStyle(
                      fontFamily: "Readex",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: Image.network(
//         'https://picsum.photos/seed/179/600',
//         width: 300,
//         height: 200,
//         fit: BoxFit.cover,
//       ),
//     );

