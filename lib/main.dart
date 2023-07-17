import 'package:flutter/material.dart';
import 'package:multi_provider/provider/count_provider.dart';
import 'package:multi_provider/provider/multi_provider.dart';
import 'package:provider/provider.dart';

import 'screen/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CountProvider()),
        ChangeNotifierProvider(create: (_)=> MyProviderOne()),
      ],

      child: const MaterialApp(
        home: Home(),
        title: "Multiple Provider Example",
      ),
    );
  }
}


