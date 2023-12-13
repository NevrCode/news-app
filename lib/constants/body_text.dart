import 'package:flutter/material.dart';

const textStyleTest = TextStyle(
    fontFamily: "Readex",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 63, 72, 78));

const hintstyle = TextStyle(
    fontFamily: "Readex",
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 63, 72, 78));

const commentInputstyle = InputDecoration(
  hintText: 'Write a comment..',
  hintStyle: hintstyle,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0x00000000),
      width: 1,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(4.0),
      topRight: Radius.circular(4.0),
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0x00000000),
      width: 1,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(4.0),
      topRight: Radius.circular(4.0),
    ),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0x00000000),
      width: 1,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(4.0),
      topRight: Radius.circular(4.0),
    ),
  ),
  focusedErrorBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0x00000000),
      width: 1,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(4.0),
      topRight: Radius.circular(4.0),
    ),
  ),
  contentPadding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 5),
);

const nameInputstyle = InputDecoration(
  hintText: 'Nama Kamu..',
  hintStyle: hintstyle,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(150, 169, 169, 169),
        width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(218, 1, 201, 11),
        width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(149, 252, 6, 6),
        width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(150, 169, 169, 169),
        width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))),
  contentPadding: EdgeInsetsDirectional.fromSTEB(16, 2, 8, 0),
);
