class CategoryItems {
  final String id;
  final String name;
  final String assetPath;

  CategoryItems(
      {required this.id, required this.name, required this.assetPath});
}

List<CategoryItems> categorise = [
  CategoryItems(
      id: "1", name: "Burger", assetPath: "assets/images/burger.png"),
  CategoryItems(
      id: "2", name: "Chicken", assetPath: "assets/images/chicken.png"),
  CategoryItems(
      id: "3", name: "Pizza", assetPath: "assets/images/pizza.png"),
  CategoryItems(
      id: "4", name: "Pasta", assetPath: "assets/images/pasta.png"),
  CategoryItems(
      id: "5", name: "Drinks", assetPath: "assets/images/drinks.png"),
  CategoryItems(
      id: "6", name: "Beef", assetPath: "assets/images/beef.png"),
];
