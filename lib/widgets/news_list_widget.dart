import 'package:flutter/material.dart';
import 'package:seccion17_newsapp/models/models.dart';
import 'package:seccion17_newsapp/theme/app_theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return _News(
          news: news[index],
          index: index,
        );
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _TopBarCard(news, index),
          _TitleCard(news),
          _ImageCard(news),
          _BodyCard(news),
          _ButtonsCard(),
          const SizedBox(height: 10,),
          const Divider(thickness: 1,),
        ],
      ),
    );
  }
}

class _ButtonsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: AppTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10,),
          MaterialButton(
            color: AppTheme.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article news;

  const _BodyCard(this.news);

  @override
  Widget build(BuildContext context) {
    return news.description != null
      ? Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(news.description ?? ''),)
      : Container();
  }
}

class _ImageCard extends StatelessWidget {
  final Article news;

  const _ImageCard(this.news);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        child: news.urlToImage != null
          ? FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assests/images/giphy.gif'),
              image: NetworkImage(news.urlToImage!))
          : const Image(            
              fit: BoxFit.cover,
              image: AssetImage('assets/images/no-image.png'),)
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article news;

  const _TitleCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
      child: Text(
        news.title,
        maxLines: 2, 
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article news;
  final int index;

  const _TopBarCard(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, bottom: 8),
      child: Row(
        children: [
          Text('${index + 1}. ', style: const TextStyle(color: AppTheme.accentColor), textAlign: TextAlign.start),
          Text('${news.source.name}. '),
        ],
      ),
    );
  }
}
