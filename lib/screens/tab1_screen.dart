import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion17_newsapp/services/services.dart';
import 'package:seccion17_newsapp/widgets/widgets.dart';

class Tab1Screen extends StatefulWidget {
  static const String routerName = 'Tab1';

  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: newsService.headlines.isEmpty
      ? const Center(child: CircularProgressIndicator(),)
      : SafeArea(child: NewsList(newsService.headlines)),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
