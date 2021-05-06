import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:portfolio/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  initializeDateFormatting().then((_) => runApp(App()));
}