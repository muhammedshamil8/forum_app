import 'package:flutter/material.dart';
import 'package:forumapp/views/new_feature.dart';
import '/views/favorite_page.dart';
import '/views/profile_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'views/login_page.dart';
import 'views/home_page.dart';
// import 'dart:io';
// import 'package:flutter/foundation.dart';

void main() {
  //  FlutterError.onError = (details) {
  //   FlutterError.presentError(details);
  //   if (kReleaseMode) exit(1);
  // };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final token = box.read('token');
    // print(token);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forum App',
      home: token == null ? const LoginPage() : const HomeLoader(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomeLoader extends StatelessWidget {
  const HomeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)), // Simulating a delay
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const NavigationPage();
        }
      },
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black12,
                width: 2.0, // Adjust the width as needed
              ),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
              if (index == 2) {
                // Show modal dialog
                showModal(context);
              }
            },
            indicatorColor: Colors.blue,
            height: 65,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.new_label),
                label: 'New feature',
              ),
              NavigationDestination(
                  icon: Badge(
                    label: Text('2'),
                    child: Icon(Icons.favorite),
                  ),
                  label: 'Liked'),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: <Widget>[
          /// Home page
          const HomePage(),

          /// New feature page (placeholder)
          const NewFeaturePage(),

          /// /// Liked page (placeholder)
          const LikedPage(),

          /// Profile page
          const ProfilePage(),
        ][currentPageIndex]);
  }

  void showModal(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.info, size: 30, color: Colors.blue),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'This is on process. Please wait for the next update.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentPageIndex = 0;
              });
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
