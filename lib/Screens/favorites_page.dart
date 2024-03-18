import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_items.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final List<FoodItems> favoriteFoodItems =
        food.where((item) => item.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Favorites',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent, // Adjust color as needed
        elevation: 0, // Remove app bar elevation
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4, // Add elevation for a raised effect
              child: ListTile(
                leading: Image.network(
                  favoriteFoodItems[index].imgUrl,
                  height: 100,
                  width: 70,
                  fit: BoxFit.cover, // Use cover to maintain aspect ratio
                ),
                title: Text(
                  favoriteFoodItems[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${favoriteFoodItems[index].price} - ${favoriteFoodItems[index].category}",
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteFoodItems[index].isFavorite =
                          !favoriteFoodItems[index].isFavorite;
                    });
                  },
                  icon: Icon(
                    favoriteFoodItems[index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: favoriteFoodItems.length,
      ),
    );
  }
}
