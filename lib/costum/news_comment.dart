import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.commenter,
    required this.time,
    required this.comment,
  });

  final String commenter;
  final String time;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x2F1D2429),
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(commenter,
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color: Color.fromARGB(117, 75, 57, 239),
                              )),
                        ],
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                            fontFamily: "Readex",
                            fontSize: 8,
                            color: Color.fromARGB(255, 87, 99, 108)),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 24,
                    thickness: 2,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      comment,
                      style: const TextStyle(
                          fontFamily: "Readex",
                          fontSize: 11,
                          color: Color.fromARGB(255, 87, 99, 108)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
