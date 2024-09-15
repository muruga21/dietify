import 'package:dietfy/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class CurrentPage extends ChangeNotifier {
  var page = "login";
  var selectedNavItem = "home";
  void setNavSelected(String selected) {
    selectedNavItem = selected;
    notifyListeners();
  }

  var selectedMealType = "breakfast";
  void setMealType(String mealType) {
    selectedMealType = mealType;
    notifyListeners();
  }

  List<Map<String, dynamic>> adjustedDietPlan = [
    {
      'name': 'Oatmeal with fruit',
      'type': 'Breakfast',
      'details': [
        '1 cup of oatmeal cooked in water or almond milk',
        'Top with fresh fruit (e.g., bananas, berries)',
        '1 teaspoon of honey or maple syrup for sweetness'
      ]
    },
    {
      'name': '',
      'type': 'Morning Snack',
      'details': [
        'Rice cakes with a small amount of peanut butter or jam',
        'A cup of herbal tea or water'
      ]
    },
    {
      'name': 'Rice bowl & vegetables',
      'type': 'Lunch',
      'details': [
        '1 cup of cooked white rice',
        'Steamed or roasted vegetables (e.g., carrots, spinach, bell peppers)',
        'Drizzle with olive oil and a pinch of salt for flavor'
      ]
    },
    {
      'name': 'Pasta with tomato sauce',
      'type': 'Dinner',
      'details': [
        '1-1.5 cups of cooked pasta',
        'Tomato-based sauce (skip the meat and cheese)',
        'Serve with a side of steamed green beans or broccoli'
      ]
    }
  ];

  void setDietPlan() {
    adjustedDietPlan = [
      {
        'name': 'Smoothie bowl',
        'type': 'Breakfast',
        'details': [
          '1 cup of unsweetened almond milk',
          '1/2 banana for natural sweetness',
          'A handful of berries',
          '1 tablespoon of chia seeds for fiber'
        ]
      },
      {
        'name': 'Light fruit salad',
        'type': 'Morning Snack',
        'details': [
          'A mix of watermelon, papaya, and apple slices',
          'Sprinkle with a pinch of chia or flax seeds',
          'A cup of herbal tea or water'
        ]
      },
      {
        'name': 'Steamed rice and boiled vegetables',
        'type': 'Lunch',
        'details': [
          '1 cup of steamed white rice',
          'Boiled vegetables (e.g., carrots, beans, zucchini)',
          'No added fats; use lemon juice and herbs for flavor'
        ]
      },
      {
        'name': 'Lentil soup',
        'type': 'Dinner',
        'details': [
          '1 bowl of low-fat lentil soup (no ghee or butter)',
          'Serve with whole-grain crackers or a small piece of whole wheat bread',
          'Steamed spinach or kale on the side'
        ]
      }
    ];
    notifyListeners();
  }

  // ignore: prefer_typing_uninitialized_variables
  var loginSignupCardContent;
  void set(String currentPage) {
    if (currentPage == "login") {
      loginSignupCardContent = "Sign In to your Account";
    } else if (currentPage == "signup") {
      loginSignupCardContent = "Sign up to get started.";
    } else {
      loginSignupCardContent = "Provide the required details";
    }
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentPage(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dietfy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUp(),
      ),
    );
  }
}
