import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? getListSum(List<double> list) {
  var sum = 0.0;
  for (var i = 0; i < list.length; i++) {
    sum += list[i];
  }
  return sum;
}

double? calculateZakat(
  double bank,
  double hand,
  double gold,
  double silver,
) {
  var total;
  var tot;
  tot = (bank + hand + (gold * 6803.95) + (silver * 82.07));
  if (tot >= 50254.96) {
    return total = 0.025 * tot;
  } else {
    return 0.00;
  }
}
