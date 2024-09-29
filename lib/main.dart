import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medy/medy_app.dart';

const assetImagePath = 'assets/images';
const logoImage = '$assetImagePath/logo.png';

void main() async {

  await initializeDateFormatting();

  runApp(const MedyApp());
}