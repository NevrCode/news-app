import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  String humanReadableTimeDiff(DateTime now) {
    final format = DateFormat("dd MMMM yyyy"); // Specify your date format
    final dateTime = format.parse(time);
    final diff = now.difference(dateTime);
    final days = diff.inDays;

    if (days > 30) {
      return "Long time ago..";
    } else if (days > 0) {
      return "$days days ago..";
    } else {
      return "Just now..";
    }
  }

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
              padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(commenter,
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 14,
                                  color: Color.fromARGB(179, 75, 57, 239),
                                )),
                          ],
                        ),
                        Text(
                          humanReadableTimeDiff(DateTime.now()),
                          style: const TextStyle(
                              fontFamily: "Readex",
                              fontSize: 12,
                              color: Color.fromARGB(255, 87, 99, 108)),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 24,
                    thickness: 2,
                    color: Color.fromARGB(255, 242, 242, 242),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      comment,
                      style: const TextStyle(
                          fontFamily: "Readex",
                          fontSize: 13,
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
