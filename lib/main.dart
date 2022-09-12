import 'package:cho_lay_v2/provider/allProvider.dart';
import 'package:cho_lay_v2/provider/date_and_tabIndex_provider.dart';
import 'package:cho_lay_v2/provider/transaction_provider.dart';
import 'package:cho_lay_v2/screens/main/overall_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.lightBlue);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateAndTabIndex(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          //fontFamily: 'Pyidaungsu',
          primaryColor: primaryColor,
          primarySwatch: canvasColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  textStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white))),
        ),
        home: const OverallScreen(),
      ),
    );
  }
}
