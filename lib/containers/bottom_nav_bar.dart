import 'package:dietfy/main.dart';
import 'package:dietfy/pages/dietplan.dart';
import 'package:dietfy/pages/home.dart';
import 'package:dietfy/pages/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPage = context.watch<CurrentPage>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: TextButton(
                  onPressed: () {
                    currentPage.setNavSelected("home");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: Icon(
                    Icons.home,
                    color: (currentPage.selectedNavItem == "home")
                        ? Colors.blue
                        : Colors.white,
                  )),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: TextButton(
                  onPressed: () {
                    currentPage.setNavSelected("dietplan");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dietplan()));
                  },
                  child: Icon(
                    Icons.food_bank,
                    color: (currentPage.selectedNavItem == "dietplan")
                        ? Colors.blue
                        : Colors.white,
                  )),
              label: 'Diet Plan',
            ),
            BottomNavigationBarItem(
              icon: TextButton(
                  onPressed: () {
                    currentPage.setNavSelected("recommendation");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecommendedFood()));
                  },
                  child: Icon(
                    Icons.food_bank_outlined,
                    color: (currentPage.selectedNavItem == "recommendation")
                        ? Colors.blue
                        : Colors.white,
                  )),
              label: 'Recommended',
            ),
            // BottomNavigationBarItem(
            //   icon: TextButton(
            //       onPressed: () {
            //         currentPage.setNavSelected("recommendation");
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const RecommendedFood()));
            //       },
            //       child: Icon(
            //         Icons.food_bank_rounded,
            //         color: (currentPage.selectedNavItem == "Tracking")
            //             ? Colors.blue
            //             : Colors.white,
            //       )),
            //   label: 'Recommended',
            // )
          ],
        ),
      ),
    );
  }
}
