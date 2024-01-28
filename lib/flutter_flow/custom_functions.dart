import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? add(
  int x1,
  int y1,
) {
  return x1 + y1;
}

dynamic dateInfo(DateTime dateObj) {
  var weekdays = ['', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  var months = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  return {
    'day': dateObj.day.toInt(),
    'weekday': weekdays[dateObj.weekday],
    'month': months[dateObj.month]
  };
}

int eventDuration(
  dynamic event,
  int hourHeight,
) {
  DateTime start = DateTime.parse(event['start_time']);
  DateTime end = DateTime.parse(event['end_time']);
  return (hourHeight * (end.difference(start).inSeconds ~/ 60) ~/ 60);
}
