import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  )),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/logo.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          leading: IconButton(
            // color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // This will navigate back
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: Expanded(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 20),
                    const Text("Track Your",
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 34,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        )),
                    Row(
                      children: [
                        Text("Nutritional",
                            style: TextStyle(
                              fontSize: 34,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: Colors.orange[800],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Progress",
                            style: TextStyle(
                              // color: Colors.white,
                              fontSize: 34,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  // color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: const Color(0xF5F5F6F7),
                        border: Border.all(
                            color: const Color.fromARGB(86, 180, 180, 180)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text("Health status",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    // fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  )),
                              SizedBox(width: 10),
                              Icon(
                                Icons.keyboard_double_arrow_right_rounded,
                                color: Colors.green,
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 16 / 10,
                                  child: PieChart(
                                    PieChartData(
                                      sectionsSpace: 4,
                                      centerSpaceRadius: 40,
                                      sections: _showingSections(),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.orange[800],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("Protein"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.blue[400],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("Fat"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.green[400],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("Fiber"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.purple[400],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("Carbs"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.red[400],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("Sugar"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.yellow[700],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("Vitamins"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          color: Colors.brown[400],
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("Minerals"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(99, 243, 243, 243),
                        border: Border.all(
                          width: 0.5,
                          color: const Color(0xC0C0C0C0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Your",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(
                                  width: 8), // Space between the two words
                              Text(
                                "Progress",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: Colors.orange[
                                      800], // Orange color for "Progress"
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Protein",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    "0.8",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fat",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    "0.8",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fiber",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    "0.8",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Calories",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    "0.8",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: 180,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(28, 239, 108, 0),
                            border: Border.all(
                              width: 0.5,
                              color: const Color.fromARGB(209, 124, 90, 217)
                                  .withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your plan",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "get your customized diet plan, easy for tracking and progress monitoring",
                                style: TextStyle(
                                  fontSize: 12,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: 180,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(209, 124, 90, 217)
                                .withOpacity(0.1),
                            border: Border.all(
                              width: 0.5,
                              color: const Color.fromARGB(255, 239, 108, 0),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Explore more features",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "buy premium to unlock more features and get more benefits",
                                style: TextStyle(
                                  fontSize: 12,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                  letterSpacing: 1.2,
                                ),
                              ),
                              // Container(
                              //   width: double.infinity,
                              //   child: const Padding(
                              //     padding: EdgeInsets.all(4),
                              //     child: Icon(
                              //       Icons.arrow_forward_ios,
                              //       color: Colors.orange,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        //
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}

List<PieChartSectionData> _showingSections() {
  return List.generate(7, (i) {
    final isTouched = false;
    // ignore: dead_code
    final double fontSize = isTouched ? 25.0 : 16.0;
    // ignore: dead_code
    final double radius = isTouched ? 60.0 : 50.0;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: Colors.orange[800],
          value: 30,
          title: '30',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 1:
        return PieChartSectionData(
          color: Colors.blue[400],
          value: 20,
          title: '20',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 2:
        return PieChartSectionData(
          color: Colors.green[400],
          value: 15,
          title: '15',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 3:
        return PieChartSectionData(
          color: Colors.purple[400],
          value: 15,
          title: '15',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 4:
        return PieChartSectionData(
          color: Colors.red[400],
          value: 10,
          title: '10',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 5:
        return PieChartSectionData(
          color: Colors.yellow[700],
          value: 5,
          title: '5',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 6:
        return PieChartSectionData(
          color: Colors.brown[400],
          value: 5,
          title: '5',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      default:
        return PieChartSectionData();
    }
  });
}
