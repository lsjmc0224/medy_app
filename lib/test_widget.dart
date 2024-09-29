import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medy/main/w_calendar.dart';

// Import your widgets here
// import 'package:medy/widgets/main_calendar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(const TestWidgetApp());
}

class TestWidgetApp extends StatelessWidget {
  const TestWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestWidgetScreen(),
    );
  }
}

class TestWidgetScreen extends StatelessWidget {
  const TestWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your test widgets here
            // Example:
            MainCalendar(
              markedDates: [
                DateTime(2024, 9, 1),
                DateTime(2024, 9, 15),
                DateTime(2024, 9, 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
