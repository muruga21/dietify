import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          leading: IconButton(
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
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Expanded(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Track Your",
                          style: TextStyle(
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
                                fontSize: 34,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              )),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: const Color(0xF5F5F6F7),
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius:
                          BorderRadius.circular(10), // Add border radius here
                    ),
                    child: AspectRatio(
                        aspectRatio: 16 / 16,
                        child: LineChart(
                          LineChartData(
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 3),
                                  FlSpot(1, 1),
                                  FlSpot(2, 4),
                                  FlSpot(3, 2),
                                  FlSpot(4, 5),
                                  FlSpot(5, 3),
                                  FlSpot(6, 4),
                                ],
                                isCurved: true,
                                color: Colors.black,
                                barWidth: 1,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: const Color.fromARGB(209, 124, 90, 217)
                                      .withOpacity(0.2),
                                ),
                                dotData: const FlDotData(show: false),
                              ),
                            ],
                            lineTouchData: const LineTouchData(
                              handleBuiltInTouches: true,
                            ),
                            gridData: const FlGridData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const style = TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    );
                                    switch (value.toInt()) {
                                      case 0:
                                        return const Text('Mon', style: style);
                                      case 1:
                                        return const Text('Tue', style: style);
                                      case 2:
                                        return const Text('Wed', style: style);
                                      case 3:
                                        return const Text('Thu', style: style);
                                      case 4:
                                        return const Text('Fri', style: style);
                                      case 5:
                                        return const Text('Sat', style: style);
                                      case 6:
                                        return const Text('Sun', style: style);
                                      default:
                                        return const SizedBox.shrink();
                                    }
                                  },
                                  interval: 1,
                                  reservedSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(height: 20),
                  const Text("Your Progress",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      )),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(86, 124, 90, 217)),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Protein",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "0.8 grams",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Roboto",
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(86, 124, 90, 217)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fiber",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "42.1 grams",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Roboto",
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )));
  }
}
