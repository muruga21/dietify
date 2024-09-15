import 'package:dietfy/main.dart';
import 'package:dietfy/pages/dietplan.dart';
import 'package:dietfy/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealInputPage extends StatelessWidget {
  final TextEditingController breakfastController = TextEditingController();
  final TextEditingController lunchController = TextEditingController();
  final TextEditingController dinnerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPage = context.watch<CurrentPage>();
    return Scaffold(
      backgroundColor: Colors.white, // Light theme background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content
            children: [
              TextField(
                controller: breakfastController,
                decoration: InputDecoration(
                  labelText: "Breakfast",
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.grey[200], // Gray input field
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: lunchController,
                decoration: InputDecoration(
                  labelText: "Lunch",
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: dinnerController,
                decoration: InputDecoration(
                  labelText: "Dinner",
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  currentPage.setDietPlan();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dietplan()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // White text
                ),
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
