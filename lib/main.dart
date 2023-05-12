import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/homescreen_providers.dart';
import 'package:todo/screens/home_layout.dart';
import 'package:todo/shared/styles/my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HomeScreenProider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routname: (context) => HomeScreen(),
        },
        initialRoute: HomeScreen.routname);
  }
}
