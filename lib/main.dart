import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push/firebase_options.dart';
import 'package:push/pages/notification_page.dart';
import 'pages/home_page.dart';
import 'package:push/Api/firebase_api.dart';

////////
final navigatorKey = GlobalKey<NavigatorState>();
////////
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        useMaterial3: true,
      ),

      //////
      navigatorKey: navigatorKey,
      //////
      routes: {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}
