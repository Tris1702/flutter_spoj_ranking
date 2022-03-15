import 'package:flutter/material.dart';
import 'package:practice_scraping_data/base/setup_service_locator.dart';
import 'package:practice_scraping_data/screen/compare/compare_screen.dart';
import 'package:practice_scraping_data/screen/home/home_screen.dart';

void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Rank",
                ),
                Tab(
                  text: "Tool",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              CompareScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
