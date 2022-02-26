import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamza Rahimy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TempDisplay(),
    );
  }
}

class TempDisplay extends StatelessWidget {
  const TempDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hamza\'s Portfolio\nChanges Coming Soon.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
