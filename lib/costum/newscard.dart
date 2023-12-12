import 'dart:io';

import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String judulBerita;
  final String isiBerita;
  final String imagePath;
  const NewsCard(
      {super.key,
      required this.judulBerita,
      required this.isiBerita,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(6, 10, 6, 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
            child: Container(
              width: MediaQuery.sizeOf(context).width - 44,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Color(0x2F1D2429),
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(imagePath),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 6, 8, 6),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 2, 0, 0),
                            child: Text(
                              judulBerita,
                              style: const TextStyle(
                                  fontFamily: "Readex",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 63, 72, 78)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 2, 0, 0),
                            child: Text(
                              isiBerita,
                              style: const TextStyle(
                                  fontFamily: "Readex",
                                  fontSize: 8,
                                  color: Color.fromARGB(255, 185, 211, 231)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
