import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion17_newsapp/services/services.dart';
import 'package:seccion17_newsapp/widgets/widgets.dart';

class Tab2Screen extends StatelessWidget {
  static const String routerName = 'Tab2';
  
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CategoryList(),
            const Divider(thickness: 1,),
            newsService.getArticlesBySelectedCategory.isEmpty
              ? const Expanded(child: Center(child: CircularProgressIndicator(),))
              : Expanded(child: NewsList(newsService.getArticlesBySelectedCategory)),
          ],
        ),
      ),
    );
  }
}