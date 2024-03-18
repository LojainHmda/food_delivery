import 'package:flutter/material.dart';
import 'package:food_delivery/Screens/product_details_page.dart';
import 'package:food_delivery/models/category_items.dart';
import 'package:food_delivery/models/food_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedcategoryindex;
  late List<FoodItems> filterdfood = [];

  @override
  void initState() {
    super.initState();
    filterdfood = food;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                          padding: EdgeInsets.all(8), child: Icon(Icons.menu))),
                ),
                const Column(
                  children: [
                    Text(
                      "carrunt location",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text("Tulkarem, Palestine")
                      ],
                    )
                  ],
                ),
                InkWell(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.notifications))),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://mir-s3-cdn-cf.behance.net/projects/404/53be8f164357411.63f587d921233.jpg",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorise.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedcategoryindex == null ||
                              selectedcategoryindex != index) {
                            selectedcategoryindex = index;
                          } else {
                            selectedcategoryindex = null;
                            filterdfood = food;
                          }
                        });
                        if (selectedcategoryindex != null) {
                          final selectedcategory =
                              categorise[selectedcategoryindex!];
                          filterdfood = food
                              .where((element) =>
                                  element.category == selectedcategory.name)
                              .toList();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: selectedcategoryindex == index
                              ? Colors.deepOrange
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                categorise[index].assetPath,
                                height: 50,
                                width: 50,
                                color: selectedcategoryindex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                categorise[index].name,
                                style: TextStyle(
                                    color: selectedcategoryindex == index
                                        ? Colors.white
                                        : Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Find your Food...",
                  hintStyle: const TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              itemCount: filterdfood.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(foodItem: filterdfood[index]),
                  ));
                  setState(() {
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          Image.network(filterdfood[index].imgUrl, height: 80),
                          Text(
                            filterdfood[index].name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(filterdfood[index].category,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          Text("\$${filterdfood[index].price}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      PositionedDirectional(
                          top: 0,
                          end: 0,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  filterdfood[index] = filterdfood[index]
                                      .copyWith(
                                          isFavorite:
                                              !filterdfood[index].isFavorite);

                                  final selectedFoodItem = food.firstWhere(
                                      (item) =>
                                          item.id == filterdfood[index].id);

                                  final selectedFoodIndex =
                                      food.indexOf(selectedFoodItem);

                                  food[selectedFoodIndex] = filterdfood[index];
                                });
                              },
                              icon: Icon(
                                filterdfood[index].isFavorite == false
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.red,
                              )))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
