import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum Language{Vietnamese, English}
Language currentLanguage = Language.Vietnamese;
Map<String, Map<String, String>> text = {
  "Vietnamese": {
    "tenapp": "Thư Viện Món Ăn",
    "ngonngu": "Ngôn Ngữ",
    "thongtin": "Thông Tin Nhóm",
    "detai": "Ứng dụng thư viện món ăn",
    "monhoc": "Môn Học: Lập trình cho thiết bị di động",
    "giaovien": "Giáo Viên Hướng Dẫn: Nguyễn Xuân Quế",
    "nhom": "Nhóm 5: Trần Văn Duy",
    "masv": "Mã Sinh Viên: 23015552",
    "namhoc": "Năm Học: 2025-2026",
  },
  "English": {
    "tenapp": "Food Library",
    "ngonngu": "Language",
    "thongtin": "Group information",
    "detai": "Recipe library app",
    "monhoc": "Course: Mobile App Development",
    "giaovien": "Instructor: Nguyen Xuan Que",
    "nhom": "Group 5: Tran Van Duy",
    "masv": "ID: 23015552",
    "namhoc": "Year: 2025-2026",
  }
};
String t(String key) {
  return currentLanguage == Language.Vietnamese
      ? text["Vietnamese"]![key]!
      : text["English"]![key]!;
}
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
    Food(
      name: "Bún Đậu", 
      description: "Món ăn của Việt Nam", 
      image: "imgs/bundau.jpg"),
    Food(
      name: "Nem Chua", 
      description: "Món ăn nổi tiếng của một tỉnh ở Việt Nam", 
      image: "imgs/nemchua.jpg"),
    Food(
      name: "Cơm Tấm", 
      description: "Món ăn trưa phổ biến", 
      image: "imgs/comtam.jpg"),
    Food(
      name: "Bún Chả", 
      description: "Món bún cùng với chả", 
      image: "imgs/buncha.jpg"),
    Food(
      name: "Kim Chi", 
      description: "Món không thể thiếu của bữa ăn ở Hàn Quốc", 
      image: "imgs/kimchi.jpg"),
    Food(
      name: "Hot Dog", 
      description: "Món ăn nhanh phổ biến ở Mỹ", 
      image: "imgs/hotdog.jpg"),
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
    Food(
      name: "Bun Dau", 
      description: "Vietnamese food", 
      image: "imgs/bundau.jpg"),
    Food(
      name: "Nem Chua", 
      description: "A famous dish from a province in Vietnam.", 
      image: "imgs/nemchua.jpg"),
    Food(
      name: "Broken rice", 
      description: "Popular lunch dishes", 
      image: "imgs/comtam.jpg"),
    Food(
      name: "Bun Cha", 
      description: "Rice noodles with meatballs", 
      image: "imgs/buncha.jpg"),
    Food(
      name: "Kimchi", 
      description: "An indispensable dish in Korean meals.", 
      image: "imgs/kimchi.jpg"),
    Food(
      name: "Hot Dog", 
      description: "Fast food is popular in America.", 
      image: "imgs/hotdog.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Food> foods = currentLanguage == Language.Vietnamese ? foodsVietnamese : foodsEnglish;
    return Scaffold(
      backgroundColor: Color.fromARGB(120, 180, 168, 61),
      appBar: AppBar(
        title: Text(t("tenapp")),
        backgroundColor: Color.fromARGB(255, 250, 182, 81),
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
                width: 100,
              ),
              title: Text(foods[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              subtitle: Text(foods[index].description, style: TextStyle(fontSize: 14),)
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
      backgroundColor: Color.fromARGB(120, 255, 252, 222),
      appBar: AppBar(title: Text(t("ngonngu"),), backgroundColor: Color.fromARGB(255, 250, 182, 81),),
      body: Column(
        children: [

          ListTile(
            title: Text("English", style: TextStyle(fontSize: 16)),
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
            title: Text("Tiếng Việt", style: TextStyle(fontSize: 16)),
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
      backgroundColor: Color.fromARGB(120, 180, 168, 61),
      appBar: AppBar(
        title: Text(t("thongtin")),
        backgroundColor: Color.fromARGB(255, 250, 182, 81),
        ),
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
            Text(t("detai"), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 15),
            Text(t("monhoc"), style: TextStyle(fontSize: 15),),
            Text(t("giaovien"), style: TextStyle(fontSize: 15),),
            Text(t("nhom"), style: TextStyle(fontSize: 15),),
            Text(t("masv"), style: TextStyle(fontSize: 15),),
            Text(t("namhoc"), style: TextStyle(fontSize: 15),)
            ]
          ),
          ),
        ),
      ),
    );
  }
}
