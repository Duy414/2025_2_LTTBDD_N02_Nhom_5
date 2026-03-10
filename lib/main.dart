import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum Language{Vietnamese, English}
Language currentLanguage = Language.Vietnamese;
class Food {
  String name;
  String description;
  String image;
  Food({required this.name, required this.description, required this.image});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodLibraryScreen(),
    );
  }
}

class FoodLibraryScreen extends StatelessWidget {
  final List<Food> foodsVietnamese = [
    Food(
      name: "Phở",
      description: "Món phở truyền thống của Việt Nam",
      image: "imgs/pho.jpg"),
    Food(
      name: "Bánh Burger",
      description: "Món ăn nhanh phổ biến trên thế giới",
      image: "imgs/burger.jpg"),
    Food(
      name: "Sushi",
      description: "Món ăn truyền thống của Nhật Bản",
      image: "imgs/sushi.jpg"),
    Food(
      name: "Pizza",
      description: "Món ăn nổi tiếng của Ý",
      image: "imgs/pizaa.jpg"),
  ];

  final List<Food> foodsEnglish = [
    Food(
      name: "Pho",
      description: "Vietnamese pho delivery system",
      image: "imgs/pho.jpg"),
    Food(
      name: "Burger",
      description: "Fast food is popular around the world.",
      image: "imgs/burger.jpg"),
    Food(
      name: "Sushi",
      description: "Traditional Japanese dishes",
      image: "imgs/sushi.jpg"),
    Food(
      name: "Pizza",
      description: "Famous Italian dish",
      image: "imgs/pizaa.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Food> foods = currentLanguage == Language.Vietnamese ? foodsVietnamese : foodsEnglish;
    return Scaffold(
      appBar: AppBar(
        title: Text("Thư viện món ăn"),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder:(context, index){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                foods[index].image,
                width: 75,
              ),
              title: Text(foods[index].name),
              subtitle: Text(foods[index].description),
            ),
          );
        },),
    );
  }
}