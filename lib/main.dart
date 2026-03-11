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

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FoodLibraryScreen(),
//     );
//   }
// }
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
    context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  void refresh(){
    setState(() {});
  }
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ManLanguage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,MaterialPageRoute(builder: (_) => Manthongtin())
              );
            },
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
class ManLanguage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ngôn ngữ")),

      body: Column(
        children: [

          ListTile(
            title: Text("English"),
            leading: Radio(
              value: Language.English,
              groupValue: currentLanguage,
              onChanged: (Language? value) {
                currentLanguage = value!;
                MyApp.of(context)!.refresh();
                Navigator.pop(context);
              },
            ),
          ),

          ListTile(
            title: Text("Tiếng Việt"),
            leading: Radio(
              value: Language.Vietnamese,
              groupValue: currentLanguage,
              onChanged: (Language? value) {
                currentLanguage = value!;
                MyApp.of(context)!.refresh();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Manthongtin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin nhóm"),),
      body: Center(child: Card(
        elevation: 5, 
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(
              Icons.restaurant_menu,
              size: 50,
              color: Colors.red,
            ),
            SizedBox(height: 10),
            Text("Ứng dụng thư viện món ăn", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 15),
            Text("Môn Học: Lập trình cho thiết bị di động", style: TextStyle(fontSize: 16),),
            Text("Giáo Viên Hướng Dẫn: Nguyễn Xuân Quế", style: TextStyle(fontSize: 16),),
            Text("Nhóm 5: Trần Văn Duy",style: TextStyle(fontSize: 16),),
            Text("Mã Sinh Viên: 23015552", style: TextStyle(fontSize: 16),),
            Text("Năm Học: 2025-2026", style: TextStyle(fontSize: 16),)
            ]
          ),
          ),
        ),
      ),
    );
  }
}
