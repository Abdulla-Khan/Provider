import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/provider/counter_provider.dart';
import 'package:provider_1/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
