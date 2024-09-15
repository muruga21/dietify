import 'package:dietfy/containers/bottom_nav_bar.dart';
import 'package:dietfy/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> recommendFoodList = {
  "meals": {
    "breakfast": [
      {
        // "image"
        "food": "Oatmeal with Fruit",
        "calories": 150,
        "carbohydrates": "27g",
        "protein": "3g",
        "fat": "2.5g",
        "fiber": "4g",
        "label": "breakfast"
      },
      {
        "food": "Smoothie (Banana and Berries)",
        "calories": 200,
        "carbohydrates": "45g",
        "protein": "2g",
        "fat": "1g",
        "fiber": "6g",
        "label": "breakfast"
      },
      {
        "food": "Whole Wheat Toast with Jam",
        "calories": 120,
        "carbohydrates": "25g",
        "protein": "3g",
        "fat": "1g",
        "fiber": "2g",
        "label": "breakfast"
      },
      {
        "food": "Rice Cakes with Peanut Butter",
        "calories": 180,
        "carbohydrates": "22g",
        "protein": "5g",
        "fat": "8g",
        "fiber": "3g",
        "label": "breakfast"
      }
    ],
    "lunch": [
      {
        "food": "Rice Bowl with Steamed Vegetables",
        "calories": 350,
        "carbohydrates": "60g",
        "protein": "6g",
        "fat": "5g",
        "fiber": "8g",
        "label": "lunch"
      },
      {
        "food": "Quinoa Salad with Olive Oil",
        "calories": 300,
        "carbohydrates": "35g",
        "protein": "8g",
        "fat": "10g",
        "fiber": "7g",
        "label": "lunch"
      },
      {
        "food": "Pasta with Tomato Sauce",
        "calories": 400,
        "carbohydrates": "65g",
        "protein": "10g",
        "fat": "5g",
        "fiber": "4g",
        "label": "lunch"
      },
      {
        "food": "Veggie Wrap with Hummus",
        "calories": 250,
        "carbohydrates": "45g",
        "protein": "6g",
        "fat": "7g",
        "fiber": "9g",
        "label": "lunch"
      }
    ],
    "dinner": [
      {
        "food": "Baked Sweet Potato with Olive Oil",
        "calories": 180,
        "carbohydrates": "38g",
        "protein": "3g",
        "fat": "4g",
        "fiber": "6g",
        "label": "dinner"
      },
      {
        "food": "Stir-Fried Vegetables with Brown Rice",
        "calories": 350,
        "carbohydrates": "60g",
        "protein": "7g",
        "fat": "6g",
        "fiber": "9g",
        "label": "dinner"
      },
      {
        "food": "Roasted Vegetables with Couscous",
        "calories": 320,
        "carbohydrates": "50g",
        "protein": "8g",
        "fat": "7g",
        "fiber": "8g",
        "label": "dinner"
      },
      {
        "food": "Grilled Tofu & Steamed Broccoli",
        "calories": 250,
        "carbohydrates": "15g",
        "protein": "15g",
        "fat": "12g",
        "fiber": "5g",
        "label": "dinner"
      }
    ]
  }
};

class RecommendedFood extends StatelessWidget {
  const RecommendedFood({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPage = context.watch<CurrentPage>();
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Recommended Food",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xc0c0c0c0),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: currentPage.selectedMealType == "breakfast"
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      currentPage.setMealType("breakfast");
                    },
                    child: const Text(
                      "Breakfast",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xc0c0c0c0),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: currentPage.selectedMealType == "lunch"
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      currentPage.setMealType("lunch");
                    },
                    child: const Text(
                      "Lunch",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xc0c0c0c0),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: currentPage.selectedMealType == "dinner"
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      currentPage.setMealType("dinner");
                    },
                    child: const Text(
                      "Dinner",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recommendFoodList["meals"]
                        [currentPage.selectedMealType]
                    .length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(40, 192, 192, 192),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            const ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image(
                                image: AssetImage("assets/food1.jpg"),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text(
                                  recommendFoodList["meals"]
                                          [currentPage.selectedMealType][index]
                                      ["food"],
                                  style: const TextStyle(
                                    // color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Calories: ${recommendFoodList["meals"][currentPage.selectedMealType][index]["calories"]}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Carbohydrates: ${recommendFoodList["meals"][currentPage.selectedMealType][index]["carbohydrates"]}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Protein: ${recommendFoodList["meals"][currentPage.selectedMealType][index]["protein"]}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          "Fat: ${recommendFoodList["meals"][currentPage.selectedMealType][index]["fat"]}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Fiber: ${recommendFoodList["meals"][currentPage.selectedMealType][index]["fiber"]}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
