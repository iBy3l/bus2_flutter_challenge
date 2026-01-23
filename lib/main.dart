import 'package:flutter/material.dart';

import 'core/di/service_locator.dart' as di;
import 'feature/people/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus2 Flutter Challenge',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}
