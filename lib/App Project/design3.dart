import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/App%20Project/design2.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

// ক্যাটেগরি ডেটা মডেল
class Category {
  final String name;
  final String imagePath;
  final IconData icon; // আইকন যোগ করা হয়েছে

  const Category({
    required this.name,
    required this.imagePath,
    required this.icon, // কনস্ট্রাক্টরে আইকন যোগ করা হয়েছে
  });
}

final List<Category> categories = [
  const Category(
      name: 'Plumber', imagePath: AppsImages.book, icon: Icons.plumbing),
  const Category(
      name: 'Carpenter',
      imagePath: AppsImages.plumber,
      icon: Icons.cleaning_services),
  const Category(
      name: 'Welder', imagePath: AppsImages.dcUser, icon: Icons.engineering),
  const Category(
      name: 'Contactor', imagePath: AppsImages.doctor, icon: Icons.business),
  const Category(
      name: 'Electrician',
      imagePath: AppsImages.bag,
      icon: Icons.electrical_services),
  const Category(
      name: 'Painter', imagePath: AppsImages.asso, icon: Icons.format_paint),
  const Category(
      name: 'Laundry',
      imagePath: AppsImages.plumber,
      icon: Icons.local_laundry_service),
  const Category(
      name: 'Mechanic', imagePath: AppsImages.plumber, icon: Icons.car_repair),
  const Category(
      name: 'Cleaner',
      imagePath: AppsImages.doctor,
      icon: Icons.cleaning_services),
  const Category(
      name: 'Carpenter',
      imagePath: AppsImages.clothes,
      icon: Icons.engineering),
  const Category(
      name: 'Electrician',
      imagePath: AppsImages.doctorImage,
      icon: Icons.electrical_services),
  const Category(
      name: 'Contactor', imagePath: AppsImages.plumber, icon: Icons.business),
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
              height: 40.h,
              width: 40.w,
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
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w600),
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
              top: 30,
              left: 24,
              right: 24,
              bottom: 100,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: .8,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              
              return CategoryCard(category: categories[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CustomBottomNavBarDesign2(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  // কনস্ট্রাক্টর থেকে icon প্যারামিটারটি সরিয়ে দেওয়া হয়েছে
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
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ক্যাটেগরির ছবি
          Image.asset(
            category.imagePath,
            height: 50.h,
            errorBuilder: (context, error, stackTrace) {
              // এখানে category অবজেক্ট থেকে icon ব্যবহার করা হচ্ছে
              return Icon(
                category.icon,
                color: AppColors.textColor,
                size: 40,
              );
            },
          ),
          SizedBox(height: 15.h),

          Text(
            category.name,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
