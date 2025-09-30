import 'package:flutter/material.dart';
import 'package:pinterest_ui/App%20Project/design1.dart';
import 'package:pinterest_ui/App%20Project/design2.dart';
import 'package:pinterest_ui/App%20Project/design3.dart';
import 'package:pinterest_ui/Hospital%20Management/Hscreen1.dart';
import 'package:pinterest_ui/Hospital%20Management/Hscreen2.dart';
import 'package:pinterest_ui/Hospital%20Management/Hscreen3.dart';
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

// ডিজাইন পেজ এবং ক্যাটাগরি ক্লাস অপরিবর্তিত
class DesignPage {
  final String name;
  final Widget page;

  const DesignPage({required this.name, required this.page});
}

class DesignCategory {
  final String name;
  final IconData icon;
  final String date;
  final List<DesignPage> designs;

  const DesignCategory({
    required this.name,
    required this.icon,
    required this.date,
    required this.designs,
  });
}

// ডেটা অপরিবর্তিত
final List<DesignCategory> designCategories = [
  DesignCategory(
    name: 'E-Commerce Shop Case',
    icon: Icons.shopping_cart_outlined,
    date: 'Sep 29',
    designs: [
      DesignPage(name: 'Shop Case Design 1', page: const shopCaseDesign1()),
      DesignPage(name: 'Shop Case Design 2', page: const shopCaseDesign2()),
      DesignPage(name: 'Shop Case Design 3', page: const shopCaseDesign3()),
    ],
  ),
  DesignCategory(
    name: 'Mobile UI',
    icon: Icons.phone_android_rounded,
    date: 'sep 21',
    designs: [
      DesignPage(name: 'Mobile UI Design 1', page: const Design1()),
      DesignPage(name: 'Mobile UI Design 2', page: const Design2()),
      DesignPage(name: 'Mobile UI Design 3', page: const Design3()),
    ],
  ),
  DesignCategory(
    name: 'App Project',
    icon: Icons.app_registration_rounded,
    date: 'Sep 24',
    designs: [
      DesignPage(name: 'App Project Design 1', page: AppProjectDesign1()),
      DesignPage(name: 'App Project Design 2', page: const AppProjectDesign2()),
      DesignPage(name: 'App Project Design 3', page: const AppProjectDesign3()),
    ],
  ),
  DesignCategory(
    name: 'Music Screens',
    icon: Icons.music_note_rounded,
    date: 'sep 25',
    designs: [
      DesignPage(
        name: 'Audiobook Home Screen',
        page: const AudiobookHomeScreen(),
      ),
      DesignPage(name: 'Audiobook Screen 2', page: const AudioScreendesign2()),
      DesignPage(name: 'Audiobook Screen 3', page: const AudioScreendesign3()),
    ],
  ),
  const DesignCategory(
    name: 'Dark/Light Mode',
    icon: Icons.brightness_6_rounded,
    date: 'sep 25',
    designs: [
      DesignPage(name: 'Dark Mode Design', page: DarkModeDesign()),
      DesignPage(name: 'Light Mode Design', page: DarkModeDesign2()),
    ],
  ),
  const DesignCategory(
    name: 'Products Discover',
    icon: Icons.search_rounded,
    date: 'Sep 28',
    designs: [
      DesignPage(name: 'Products Discover 1', page: DiscoveryScreen()),
      DesignPage(name: 'Products Discover 2', page: DiscoveryScreen2()),
      DesignPage(name: 'Products Discover 3', page: DiscoveryScreen3()),
    ],
  ),
  const DesignCategory(
    name: 'Hospital Management',
    icon: Icons.search_rounded,
    date: 'Sep 30',
    designs: [
      DesignPage(name: 'Hospital Management 1', page: Hscreen1()),
      DesignPage(name: 'Hospital Management 2', page: const Hscreen2()),
      DesignPage(name: 'Hospital Management  3', page: const HScreen3()),
    ],
  ),
];

// পরিবর্তন ১: প্রতিটি ক্যাটাগরির জন্য সুন্দর রঙের একটি লিস্ট তৈরি করা হয়েছে
final List<Map<String, Color>> colorPalette = [
  {'bg': Colors.blue.shade50, 'icon': Colors.blue.shade800},
  {'bg': Colors.green.shade50, 'icon': Colors.green.shade800},
  {'bg': Colors.orange.shade50, 'icon': Colors.orange.shade800},
  {'bg': Colors.purple.shade50, 'icon': Colors.purple.shade800},
  {'bg': Colors.red.shade50, 'icon': Colors.red.shade800},
  {'bg': Colors.teal.shade50, 'icon': Colors.teal.shade800},
  {'bg': Colors.orange.shade50, 'icon': Colors.orange.shade800},
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // পরিবর্তন ২: Scaffold এবং AppBar এর ডিজাইন উন্নত করা হয়েছে
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // একটি সুন্দর অফ-হোয়াইট রঙ
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'UI Collections',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: Colors.grey.withOpacity(0.2),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 15,
          bottom: 100,
        ),
        itemCount: designCategories.length,
        itemBuilder: (context, index) {
          final category = designCategories[index];
          // পরিবর্তন ৩: প্রতি আইটেমের জন্য কালার প্যালেট থেকে একটি রঙ নেওয়া হয়েছে
          final colors = colorPalette[index % colorPalette.length];
          final designNames = category.designs.map((d) => d.name).join(', ');

          return Card(
            elevation: 2,
            shadowColor: Colors.grey.withOpacity(0.2), // সুন্দর ছায়া
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // আরও রাউন্ডেড এজ
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              // পরিবর্তন ৪: CircleAvatar এবং Icon এর রঙ পরিবর্তন করা হয়েছে
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: colors['bg'],
                child: Icon(category.icon, color: colors['icon']),
              ),
              title: Text(
                category.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black87,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  designNames,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${category.designs.length} Pages',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      // পরিবর্তন ৫: পেইজের সংখ্যার রঙ আইকনের রঙের সাথে মেলানো হয়েছে
                      color: colors['icon'],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category.date,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetailScreen(
                      category: category,
                      // পরিবর্তন ৬: পরবর্তী পেইজে রঙ পাস করা হয়েছে
                      themeColor: colors['icon']!,
                    ),
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

class CategoryDetailScreen extends StatelessWidget {
  final DesignCategory category;
  final Color themeColor; // পরিবর্তন ৭: রঙ রিসিভ করার জন্য ভ্যারিয়েবল

  const CategoryDetailScreen({
    super.key,
    required this.category,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // পরিবর্তন ৮: AppBar এর রঙ আগের পেইজ থেকে আসা রঙের সাথে মিলিয়ে দেওয়া হয়েছে
      appBar: AppBar(
        title: Text(category.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
        iconTheme: const IconThemeData(color: Colors.white), // ব্যাক আইকন সাদা
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: category.designs.length,
        itemBuilder: (context, index) {
          final design = category.designs[index];
          return Card(
            elevation: 2,
            shadowColor: themeColor.withOpacity(0.2), // থিম কালারের ছায়া
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              title: Text(
                design.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              // পরিবর্তন ৯: আইকনের রঙ থিম কালারের সাথে মেলানো হয়েছে
              trailing: Icon(Icons.slideshow_rounded, color: themeColor),
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
