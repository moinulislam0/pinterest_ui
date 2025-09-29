import 'package:flutter/material.dart';
import 'package:pinterest_ui/App%20Project/design1.dart';
import 'package:pinterest_ui/App%20Project/design2.dart';
import 'package:pinterest_ui/App%20Project/design3.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';
import 'package:pinterest_ui/Mobile%20Ui/design2.dart';
import 'package:pinterest_ui/Mobile%20Ui/design3.dart';
import 'package:pinterest_ui/dark_ligh_mode/design1.dart';
import 'package:pinterest_ui/dark_ligh_mode/design2.dart';
import 'package:pinterest_ui/music_Screen/design1.dart';
import 'package:pinterest_ui/music_Screen/design2.dart';
import 'package:pinterest_ui/music_Screen/design3.dart';
import 'package:pinterest_ui/products_discover/design1.dart';
import 'package:pinterest_ui/products_discover/design2.dart';
import 'package:pinterest_ui/products_discover/design3.dart';
import 'package:pinterest_ui/shopCase/design1.dart';
import 'package:pinterest_ui/shopCase/design2.dart';
import 'package:pinterest_ui/shopCase/design3.dart';

// ধাপ ১: ডিজাইন এবং ক্যাটাগরিগুলোর জন্য ডেটা মডেল তৈরি করা
class DesignPage {
  final String name;
  final Widget page;

  const DesignPage({required this.name, required this.page});
}

class DesignCategory {
  final String name;
  final List<DesignPage> designs;

  const DesignCategory({required this.name, required this.designs});
}

// ধাপ ২: সমস্ত ডিজাইনকে তাদের ক্যাটাগরি অনুযায়ী সাজানো
final List<DesignCategory> designCategories = [
  DesignCategory(
    name: 'E-Commerce Shop Case',
    designs: [
      DesignPage(name: 'Shop Case Design 1', page: shopCaseDesign1()),
      DesignPage(name: 'Shop Case Design 2', page: shopCaseDesign2()),
      DesignPage(name: 'Shop Case Design 3', page: shopCaseDesign3()),
    ],
  ),
  DesignCategory(
    name: 'Mobile UI',
    designs: [
      DesignPage(name: 'Mobile UI Design 1', page: Design1()),
      DesignPage(name: 'Mobile UI Design 2', page: Design2()),
      DesignPage(name: 'Mobile UI Design 3', page: Design3()),
    ],
  ),
  DesignCategory(
    name: 'App Project',
    designs: [
      DesignPage(name: 'App Project Design 1', page: AppProjectDesign1()),
      DesignPage(name: 'App Project Design 2', page: AppProjectDesign2()),
      DesignPage(name: 'App Project Design 3', page: AppProjectDesign3()),
    ],
  ),
  DesignCategory(
    name: 'Music Screens',
    designs: [
      DesignPage(name: 'Audiobook Home Screen', page: AudiobookHomeScreen()),
      DesignPage(name: 'Audiobook Screen 2', page: AudioScreendesign2()),
      DesignPage(name: 'Audiobook Screen 3', page: AudioScreendesign3()),
    ],
  ),
  DesignCategory(
    name: 'Dark/Light Mode',
    designs: [
      DesignPage(name: 'Dark Mode Design', page: DarkModeDesign()),
      DesignPage(name: 'Light Mode Design', page: DarkModeDesign2()),
    ],
  ),
  DesignCategory(
    name: 'Products Discover',
    designs: [
      DesignPage(name: 'Products Discover 1', page: DiscoveryScreen()),
      DesignPage(name: 'Products Discover 2', page: DiscoveryScreen2()),
      DesignPage(name: 'Products Discover 3', page: DiscoveryScreen3()),
    ],
  ),
];

// ধাপ ৩: মূল Pages ক্লাস, যা এখন ক্যাটাগরি লিস্ট দেখাবে
class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All UI Categories',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 37, 38, 39),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: designCategories.length,
        itemBuilder: (context, index) {
          final category = designCategories[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                category.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => CategoryDetailScreen(category: category),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ধাপ ৪: নতুন একটি স্ক্রিন যা নির্দিষ্ট ক্যাটাগরির ডিজাইনগুলো দেখাবে
class CategoryDetailScreen extends StatelessWidget {
  final DesignCategory category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name, style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 13, 66, 50),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: category.designs.length,
        itemBuilder: (context, index) {
          final design = category.designs[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(design.name),
              trailing: const Icon(Icons.slideshow_rounded, size: 20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => design.page),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
