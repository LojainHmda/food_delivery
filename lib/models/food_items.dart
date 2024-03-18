class FoodItems {
  final String id;
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final String estmatedtime;
  final int numberOfSales;
  bool isFavorite;

  FoodItems(
      {required this.id,
      required this.name,
      required this.category,
      required this.imgUrl,
      required this.price,
      this.estmatedtime = "30 min",
      this.numberOfSales = 2,
      this.isFavorite = false});



  FoodItems copyWith({ bool? isFavorite}) {
    return FoodItems(
        id: id, name: name, category: category, imgUrl: imgUrl, price: price,isFavorite: isFavorite??this.isFavorite);
  }
}


List<FoodItems> food = [
  FoodItems(
      id: "1",
      name: "Beef Burger",
      category: "Burger",
      imgUrl:
          "https://t4.ftcdn.net/jpg/05/85/29/13/360_F_585291348_nfsxpgUHUkphTWtkruvHW7lGvF6IdSvM.jpg",
      price: 6.5),
  FoodItems(
      id: "2",
      name: "Chicken Burger",
      category: "Burger",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/034/763/829/non_2x/ai-generated-fried-chicken-burger-free-png.png",
      price: 6.5),
  FoodItems(
      id: "3",
      name: "Cheese Burger",
      category: "Burger",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/027/143/844/original/delicious-cheese-burger-on-transparent-background-png.png",
      price: 6.5),
  FoodItems(
      id: "10",
      name: "Chicken Pizza",
      category: "Pizza",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/024/108/111/original/tasty-bbq-chicken-cheese-pizza-isolated-on-transparent-background-png.png",
      price: 6.5),
  FoodItems(
      id: "4",
      name: "margaita Pizza",
      category: "Pizza",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/022/478/733/original/pizza-margherita-and-beer-ai-transparent-png.png",
      price: 6.5),
  FoodItems(
      id: "5",
      name: "Chicken pasta",
      category: "Pasta",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/036/498/544/original/ai-generated-koshari-on-a-white-plate-on-transparent-background-png.png",
      price: 6.5),
  FoodItems(
      id: "6",
      name: "Kosharie pasta",
      category: "Pasta",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/036/498/544/original/ai-generated-koshari-on-a-white-plate-on-transparent-background-png.png",
      price: 6.5),
  FoodItems(
      id: "7",
      name: "lasania ",
      category: "Pasta",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/026/757/850/non_2x/lasagna-with-ai-generated-free-png.png",
      price: 6.5),
  FoodItems(
      id: "8",
      name: "fride chicken ",
      category: "Chicken",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/024/724/514/non_2x/hot-and-crispy-fried-chicken-isolated-on-transparent-background-fresh-pieces-of-crispy-fried-chicken-fast-food-generative-ai-free-png.png",
      price: 6.5),
  FoodItems(
      id: "9",
      name: "Grilled chicken ",
      category: "Chicken",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/021/665/578/original/delicious-grilled-chicken-cutout-png.png",
      price: 6.5),
];
