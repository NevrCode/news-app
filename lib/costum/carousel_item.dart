import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String judulBerita;
  final String isiBerita;
  // final String image;
  const CarouselItem({
    super.key,
    required this.judulBerita,
    required this.isiBerita,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.network(
            'https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhY2hlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
          ).image,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 16, 0, 0),
                  child: Text(
                    isiBerita,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 16, 0, 0),
                  child: Text(
                    isiBerita,
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
// ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: Image.network(
//         'https://picsum.photos/seed/179/600',
//         width: 300,
//         height: 200,
//         fit: BoxFit.cover,
//       ),
//     );

