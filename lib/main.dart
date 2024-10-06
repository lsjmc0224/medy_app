import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medy/medy_app.dart';

const assetImagePath = 'assets/images';
const logoImage = '$assetImagePath/logo.png';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final status = await Geolocator.checkPermission();
  if (status == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }
  await initializeDateFormatting();

  runApp(const MedyApp());
}