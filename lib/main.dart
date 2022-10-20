import 'package:flutter/material.dart';
import 'package:json_tree/controllers/home_page_controller.dart';
import 'view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageController>(
            create: (_) => HomePageController()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Homepage()),
    );
  }
}
