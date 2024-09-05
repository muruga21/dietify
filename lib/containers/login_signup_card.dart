import 'package:dietfy/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSignupCard extends StatelessWidget {
  const LoginSignupCard({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPage = context.watch<CurrentPage>();

    return Container(
      padding: const EdgeInsets.all(16),
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logincardbg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/logo.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              const Text("DIETIFY",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  )),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            currentPage.loginSignupCardContent,
            style: const TextStyle(
              fontSize: 44,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
              height: 1, // Adjust line height here
            ),
          ),
          const SizedBox(height: 20), // Adds space between the texts
          const Text(
            "Please enter your credentials below.",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.normal,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
