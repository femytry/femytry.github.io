import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:portfolio/app.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(App()));
}