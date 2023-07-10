import 'package:flutter/material.dart';
import 'package:railseat/view/homepage/ui/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rail Seat Finder',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(primary: Color.fromARGB(255, 51, 126, 255)),
      ),
      home: const HomeScreen(seatCount: 72),
    );
  }
}