import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/global_controller.dart';
import 'screens/map.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlobalController()),
        // ... other providers if any
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalController(),
      child: MaterialApp(
        title: 'gg',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green[700],
        ),
        home: const MapScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
