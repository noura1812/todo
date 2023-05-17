import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/homescreen_providers.dart';
import 'package:todo/providers/settings_provider.dart';
import 'package:todo/screens/home_layout.dart';
import 'package:todo/screens/update_task_screen.dart';
import 'package:todo/shared/styles/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeScreenProider>(
        create: (context) => HomeScreenProider(),
      ),
      ChangeNotifierProvider<SettingsProvidr>(
        create: (context) => SettingsProvidr(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvidr>(context);

    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line

          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale(provider.Language),
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'),
        ],
        themeMode: provider.Theme == 'light' ? ThemeMode.light : ThemeMode.dark,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routname: (context) => const HomeScreen(),
          UpdateTask.routname: (context) => UpdateTask(),
        },
        initialRoute: HomeScreen.routname);
  }
}
