import 'package:base/features/presentation/pages/article_list_by_category_page.dart';
import 'package:base/features/presentation/providers/article_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/category.dart';

class ArticleCategoryPage extends StatefulWidget {
  static String routeName = "/ArticleCategoryPage";
  const ArticleCategoryPage({Key? key}) : super(key: key);

  @override
  _ArticleCategoryPageState createState() => _ArticleCategoryPageState();
}

class _ArticleCategoryPageState extends State<ArticleCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(Provider.of<ArticleProvider>(context,listen:true).categories),
    );
  }


  Widget _noCategory(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No Category Available")
      ],
    );
  }
  Widget _mainWidget(List<Category> categories){
    if(categories.isEmpty) return _noCategory();
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => _categoryCard(categories[index]),
        separatorBuilder: (context, index) =>  Divider(),
        itemCount: categories.length
    );
  }

  Widget _categoryCard(Category category){
    return InkWell(
      onTap: (){
        print("_categoryCard->onTap");
        Provider.of<ArticleProvider>(context, listen: false).setCategory(category);
        Navigator.pushNamed(context, ArticleListByCategoryPage.routeName);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
                imageUrl: category.photo,
                placeholder: (context, str) => Image.asset("assets/images/dolors.jpg"),
                errorWidget: (context, dyn, dyn2) => Image.asset("assets/images/dolors.jpg"),
            ),
          ),
          Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text(category.name)
          ),
        ],
      ),
    );
  }
}
