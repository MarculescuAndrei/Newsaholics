import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsaholic/Helper/news.dart';
import 'package:newsaholic/Models/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    getCategoryNews();
    // TODO: implement initState
    super.initState();
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text("aholic", style: TextStyle(
                color: Colors.grey
            ),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].description,
                            url : articles[index].url
                        );
                      }
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc, @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ArticleView(
              blogUrl: url,
            )
        ));
      } ,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                child: Image.network(imageUrl),
                borderRadius: BorderRadius.circular(6)
            ),
            SizedBox(height: 8,),
            Text(
                title,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500
                )
            ),
            SizedBox(height: 8,),
            Text(
                desc,
                style: TextStyle(
                    color: Colors.grey
                )
            ),
          ],
        ),
      ),
    );
  }
}
