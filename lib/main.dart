import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wheather/providers/weather_provider.dart';
import 'package:wheather/ui/get_started.dart';

late Box box;
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RepositoryProvider(),
          ),
        ],
        builder: (context, child) {
          return const MaterialApp(
            title: 'Weather App',
            home: GetStarted(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
