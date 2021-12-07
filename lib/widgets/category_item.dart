import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title, this.color);

  @override
  Widget build(BuildContext context) {
    //move to screen and manage the appbar with the back button
    void selectCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        CategoryMealsScreen.routeName, arguments: {'id': id, 'title':title,},
        // CupertinoPageRoute(
        //   builder: (_) {
        //     //passed the data to the category meal screen
        //     return CategoryMealsScreen(id, title);
        //   },
        // ),
      );
    }

    //buttons squares
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
