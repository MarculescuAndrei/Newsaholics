import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsaholic/Helper/data.dart';
import 'package:newsaholic/Helper/news.dart';
import 'package:newsaholic/Models/article_model.dart';
import 'package:newsaholic/Models/category_model.dart';
import 'package:newsaholic/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // // nu aici
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: FlatButton(
  //         child: Text(FirebaseAuth.instance.currentUser.email),
  //         onPressed: (){
  //           FirebaseAuth.instance.signOut();
  //         },
  //       ),
  //     ),
  //   );
  // }

  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text("aholic", style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            /// Categories
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index)
              {
                return CategoryTile(
                  imageUrl: categories[index].imageUrl,
                  categoryName: categories[index].categoryName,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
// comment

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover)),
            Container(
              alignment:  Alignment.center,
              width: 120, height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(categoryName, style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    );
  }
}
