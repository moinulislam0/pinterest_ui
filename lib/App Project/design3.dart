import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';

// ছবি থেকে নেওয়া কালার কোড
class AppColors {
  static const Color backgroundTop = Color(0xFFF5F5F5);
  static const Color backgroundBottom = Color(0xFFEBEBEB);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color shadowColor = Color(0xFFD8D8D8);
  static const Color textColor = Color(0xFF424242);
  static const Color navIconActive = Color(0xFF00C853);
  static const Color navIconInactive = Color(0xFFBDBDBD);
}

// ক্যাটেগরি ডেটা মডেল
class Category {
  final String name;
  final String imagePath;

  const Category({required this.name, required this.imagePath});
}

final List<Category> categories = [
  const Category(name: 'Plumber', imagePath: 'assets/images/plumber.png'),
  const Category(name: 'Carpenter', imagePath: 'assets/images/carpenter.png'),
  const Category(name: 'Welder', imagePath: 'assets/images/welder.png'),
  const Category(name: 'Contactor', imagePath: 'assets/images/contactor.png'),
  const Category(
    name: 'Electrician',
    imagePath: 'assets/images/electrician.png',
  ),
  const Category(name: 'Painter', imagePath: 'assets/images/painter.png'),
  const Category(name: 'Laundry', imagePath: 'assets/images/laundry.png'),
  const Category(name: 'Mechanic', imagePath: 'assets/images/mechanic.png'),
  const Category(name: 'Cleaner', imagePath: 'assets/images/cleaner.png'),
  const Category(name: 'Carpenter', imagePath: 'assets/images/carpenter_2.png'),
  const Category(
    name: 'Electrician',
    imagePath: 'assets/images/electrician_2.png',
  ),
  const Category(name: 'Contactor', imagePath: 'assets/images/contactor_2.png'),
];

// মূল ক্যাটেগরি স্ক্রিন উইজেট
class AppProjectDesign3 extends StatelessWidget {
  const AppProjectDesign3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.all(16.0),
           
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              crossAxisSpacing: 16.0, 
              mainAxisSpacing: 16.0, 
              childAspectRatio: 0.85, // আইটেমের উচ্চতা ও প্রস্থের অনুপাত
            ),
            itemCount: categories.length, // মোট আইটেমের সংখ্যা
            itemBuilder: (context, index) {
              // প্রতিটি আইটেমের জন্য CategoryCard উইজেট কল করা হয়েছে
              return CategoryCard(category: categories[index]);
            },
          ),
        ),
      ),
      // কাস্টম বটম নেভিগেশন বার
      bottomNavigationBar: const CustomBottomNavBar(),
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
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ক্যাটেগরির ছবি
          Image.asset(
            category.imagePath,
            height: 50, // ছবির উচ্চতা
            errorBuilder: (context, error, stackTrace) {
              // ছবি লোড না হলে একটি placeholder আইকন দেখানো হবে
              return const Icon(
                Icons.work,
                size: 50,
                color: AppColors.textColor,
              );
            },
          ),
          const SizedBox(height: 12),
          // ক্যাটেগরির নাম
          Text(
            category.name,
            style: const TextStyle(
              color: AppColors.textColor,
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
