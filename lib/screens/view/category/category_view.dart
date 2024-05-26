import 'package:flutter/material.dart';
import 'package:new_app/models/category_model.dart';
import 'package:new_app/screens/widgets/categories/category_card.dart';

class CategoryView extends StatelessWidget {
  late CategoryModel category;
  List<CategoryModel> categories = const[
    CategoryModel(
      image: 'assets/images/business.jpg',
       categoryName: 'Business'
       ),
    CategoryModel(
      image: 'assets/images/entertaiment.jpg',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/images/health.jpg',
      categoryName: 'Health',
    ),
    CategoryModel(
      image: 'assets/images/science.jpg',
      categoryName: 'Science',
    ),
    CategoryModel(
      image: 'assets/images/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      image: 'assets/images/sports.jpg',
      categoryName: 'Sports',
    ),
    CategoryModel(
      image: 'assets/images/general.jpg',
      categoryName: 'General',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
