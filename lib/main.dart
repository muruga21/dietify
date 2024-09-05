import 'package:dietfy/pages/home.dart';
import 'package:dietfy/pages/login.dart';
import 'package:dietfy/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class CurrentPage extends ChangeNotifier {
  var page = "login";
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
