import 'package:flutter/material.dart';
import 'package:push/pages/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' RootPage - /'),
      ),
      body: Center(
        child: Text('hbjhbjbj'),
      ),
    );
  }
}
