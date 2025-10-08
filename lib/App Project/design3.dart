import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinterest_ui/App%20Project/design2.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

// ক্যাটেগরি ডেটা মডেল
class Category {
  final String name;
  final String imagePath;

  const Category({required this.name, required this.imagePath});
}

final List<Category> categories = [
  const Category(name: 'Plumber', imagePath: AppsImages.plumber),
  const Category(name: 'Carpenter', imagePath: AppsImages.plumber),
  const Category(name: 'Welder', imagePath: AppsImages.plumber),
  const Category(name: 'Contactor', imagePath: AppsImages.plumber),
  const Category(name: 'Electrician', imagePath: AppsImages.plumber),
  const Category(name: 'Painter', imagePath: AppsImages.plumber),
  const Category(name: 'Laundry', imagePath: AppsImages.plumber),
  const Category(name: 'Mechanic', imagePath: AppsImages.plumber),
  const Category(name: 'Cleaner', imagePath: AppsImages.plumber),
  const Category(name: 'Carpenter', imagePath: AppsImages.plumber),
  const Category(name: 'Electrician', imagePath: AppsImages.plumber),
  const Category(name: 'Contactor', imagePath: AppsImages.plumber),
];

class AppProjectDesign3 extends StatefulWidget {
  const AppProjectDesign3({super.key});

  @override
  State<AppProjectDesign3> createState() => _AppProjectDesign3State();
}

class _AppProjectDesign3State extends State<AppProjectDesign3> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.backgroundTop,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          "Categories",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: GridView.builder(
            padding: const EdgeInsets.only(
              top: 40,
              left: 24,
              right: 24,
              bottom: 100,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.85,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(category: categories[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarDesign2(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 223, 222, 222),
          width: 2,
        ),
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ক্যাটেগরির ছবি
          Image.asset(
            category.imagePath,
            height: 75,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.work,
                size: 50,
                color: AppColors.textColor,
              );
            },
          ),
          const SizedBox(height: 20),

          Text(
            category.name,
            style: const TextStyle(
              color: AppColors.textColor1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// বটম নেভিগেশন বার উইজেট
