import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_items.dart';
import 'package:food_delivery/widgets/product_details_property.dart';

class ProductDetailsPage extends StatefulWidget {
  final FoodItems foodItem;

  const ProductDetailsPage({super.key, required this.foodItem});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  int quantity = 1;

  void decreseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  void increseQuantity() {
    quantity++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("details page"),
          actions: [
            IconButton(
              
                onPressed: () {
                  setState(() {
                        widget.foodItem.isFavorite = !widget.foodItem.isFavorite;
                     
                  });
              
                },
                icon: Icon(
                  widget.foodItem.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                )),
            const SizedBox(
              width: 6,
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(
                        widget.foodItem.imgUrl,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.foodItem.name,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                    Text(widget.foodItem.category,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey))
                                  ],
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              decreseQuantity();
                                            });
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Text(quantity.toString()),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              increseQuantity();
                                            });
                                          },
                                          icon: const Icon(Icons.add))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProuductDetailsProperty(
                                    title: "Size", value: "Mefium"),
                                SizedBox(
                                  height: 40,
                                  child: VerticalDivider(),
                                ),
                                ProuductDetailsProperty(
                                    title: "Calories", value: "150kal"),
                                SizedBox(
                                  height: 40,
                                  child: VerticalDivider(),
                                ),
                                ProuductDetailsProperty(
                                    title: "Cooking", value: "10-20 Min"),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            const Text(
                              "Beef burger meal: Grilled beef patty in a bun with toppings, fries, and drink,Beef burger meal: Grilled beef patty in a bun with toppings, fries, and drink.Beef burger meal: Grilled beef patty in a bun with toppings, fries, and drink,Beef burger meal: Grilled beef patty in a bun with toppings, fries, and drink.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${widget.foodItem.price * quantity}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 24),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Text("CheckOut"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
