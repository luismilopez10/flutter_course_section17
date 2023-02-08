import 'package:flutter/material.dart';

class Tab2Screen extends StatelessWidget {
  static const String routerName = 'Tab2';
  
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
         child: Text('Tab2Screen'),
      ),
    );
  }
}