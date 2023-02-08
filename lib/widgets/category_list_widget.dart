import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion17_newsapp/models/category_model.dart';
import 'package:seccion17_newsapp/services/services.dart';
import 'package:seccion17_newsapp/theme/app_theme.dart';

class CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final categoryName = categories[index].name;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButtons(categories[index]),
                const SizedBox(height: 5,),
                Text('${categoryName[0].toUpperCase()}${categoryName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButtons extends StatelessWidget {
  final Category category;

  const _CategoryButtons(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    
    return GestureDetector(
      onTap: () => newsService.selectedCategory = category.name,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          category.icon,
          size: newsService.selectedCategory == this.category.name
            ? 30
            : 25,
          color: newsService.selectedCategory == this.category.name
            ? AppTheme.primary
            : AppTheme.categoryButtonColor,
        ),
      ),
    );
  }
}