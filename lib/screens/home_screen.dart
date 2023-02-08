import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion17_newsapp/providers/providers.dart';
import 'package:seccion17_newsapp/screens/screens.dart';

import '../share_preferences/preferences.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Home'),
        //   leading: IconButton(
        //     icon: Icon(Preferences.isDarkmode
        //       ? Icons.light_mode_outlined
        //       : Icons.dark_mode_outlined),
        //     onPressed: () {
        //       Preferences.isDarkmode = !Preferences.isDarkmode;
        //       final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    
        //       Preferences.isDarkmode
        //         ? themeProvider.setDarkmode()
        //         : themeProvider.setLightmode();
        //       setState(() {});
        //     },
        //   ),
        // ),
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navigationProvider.currentPage,
      onTap: (i) => navigationProvider.currentPage = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ]
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Screen(),
        Tab2Screen(),
      ],
    );
  }
}
