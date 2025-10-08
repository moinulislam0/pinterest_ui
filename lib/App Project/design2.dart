import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class AppProjectDesign2 extends StatefulWidget {
  const AppProjectDesign2({super.key});

  @override
  State<AppProjectDesign2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AppProjectDesign2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 244),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50.0, // একটি নির্দিষ্ট चौड़ाई দিন
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage(AppsImages.appLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Jakob',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Wrap(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 228),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: AppColors.primaryText,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 228),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.message,
                    color: AppColors.primaryText,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: CustomSearchBar(),
            ),
            SizedBox(height: 20.h),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: PromoBanner(),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 8.r, right: 8.r),
              child: QuickActions(),
            ),
            SizedBox(height: 15.h),
            const CategoriesSection(),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SectionHeader(
                title: 'Tools You may need',
                subtitle: 'All categories of tools Are Here',
                onSeeAll: () {},
                color: AppColors.primaryGreen,
                colors1: AppColors.primaryGreen,
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarDesign2(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for tools',
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.ubColor,
        ),
        suffixIcon:
            Icon(Icons.search, color: const Color.fromARGB(255, 66, 66, 66)),
        filled: true,
        fillColor: const Color.fromARGB(255, 226, 226, 228),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.r,
          horizontal: 16.r,
        ),
      ),
    );
  }
}

// "Get Your Needed Tool" ব্যানার।
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(left: 24, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColors.primaryGreen, AppColors.darkGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // প্রথম Row, যেখানে বামে টেক্সট এবং ডানে ছবি থাকবে।
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // বাম পাশের টেক্সটগুলো।
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GET YOUR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Needed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Tool',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // ডান পাশের ছবি।
              Image.asset(AppsImages.con_mac, width: 180, fit: BoxFit.contain),
            ],
          ),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // ডটগুলোকে মাঝখানে আনার জন্য।
            children: List.generate(5, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                width: index == 1 ? 6 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(index == 1 ? 1 : 0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Proti row-te koyta item thakbe
      crossAxisCount: 4,

      // Horizontal space
      crossAxisSpacing: 12,

      // Vertical space
      mainAxisSpacing: 12,

      // Ei duita line GridView-ke onanno widget-er vitor thik moto kaj korte help korbe
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: const [
        QuickActionItem(
          iconData: Icons.article_outlined,
          label: 'Newsfeed',
          color: Color(0xFFF2994A),
        ),
        QuickActionItem(
          iconData: Icons.dashboard_customize_outlined,
          label: 'Dashboard',
          color: Color(0xFFEB5757),
        ),
        QuickActionItem(
          iconData: Icons.construction, // একটি উপযুক্ত আইকন
          label: 'My Tools',
          color: AppColors.primaryGreen,
        ),
        QuickActionItem(
          iconData: Icons.dashboard_customize_outlined,
          label: 'Dashboard',
          color: Color(0xFFEB5757),
        ),
      ],
    );
  }
}

// প্রতিটি দ্রুত অ্যাক্সেস আইটেম।
class QuickActionItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color color;

  const QuickActionItem({
    super.key,
    required this.iconData,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(iconData, color: color, size: 24.sp),
        ),
        const SizedBox(height: 13),
        Text(label,
            style: TextStyle(fontSize: 10.sp, color: AppColors.secondaryText)),
      ],
    );
  }
}

// ক্যাটাগরি সেকশন।
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Categories',
          subtitle: 'All categories of tools',
          onSeeAll: () {},
          color: AppColors.orange,
          colors1: AppColors.orange,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 110.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Carpenter', imageUrl: AppsImages.clothes),
                SizedBox(width: 20),
                CategoryCard(label: 'Welder', imageUrl: AppsImages.doctor),
                SizedBox(width: 20),
                CategoryCard(label: 'Mechanic', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String imageUrl;

  const CategoryCard({super.key, required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 130.h,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1.5),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(imageUrl, fit: BoxFit.contain)),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(color: AppColors.primaryText, fontSize: 12.sp),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class ToolsSection extends StatelessWidget {
  const ToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Tools you may need',
          subtitle: '',
          onSeeAll: () {},
          color: AppColors.primaryGreen,
          colors1: AppColors.primaryGreen,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onSeeAll;
  final Color color, colors1;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    required this.onSeeAll,
    required this.color,
    required this.colors1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (subtitle != null && subtitle!.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              width: 12,
              height: 40,
              margin: const EdgeInsets.only(right: 12),
            ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 4.h),
              if (subtitle != null && subtitle!.isNotEmpty)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),
            ],
          ),
          const Spacer(),
          Container(
            height: 35,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onSeeAll,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'See all',
                    style: TextStyle(
                        color: colors1,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right, color: colors1, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// নতুন StatelessWidget ক্লাস
class CustomBottomNavBarDesign2 extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBarDesign2({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.secondaryText,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        // প্রতিটি আইটেমের জন্য icon এবং activeIcon আলাদাভাবে দেওয়া হয়েছে
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home), // সাধারণ অবস্থায় শুধু আইকন
          activeIcon: Column(
            // নির্বাচিত অবস্থায় আইকন এবং নিচে একটি লাইন
            mainAxisSize: MainAxisSize
                .min, // Column কে যতটুকু দরকার ততটুকু জায়গা নিতে বলা হয়েছে
            children: [
              Icon(Icons.home),
              SizedBox(height: 4),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Contact',
          icon: Icon(
            Icons.contact_page,
            color: Colors.grey,
          ), // সাধারণ অবস্থায় শুধু আইকন
          activeIcon: Column(
            // নির্বাচিত অবস্থায় আইকন এবং নিচে একটি লাইন
            mainAxisSize: MainAxisSize
                .min, // Column কে যতটুকু দরকার ততটুকু জায়গা নিতে বলা হয়েছে
            children: [
              Icon(Icons.contact_page),
              SizedBox(height: 4),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Message',
          icon: Icon(
            Icons.message,
            color: Colors.grey,
          ), // সাধারণ অবস্থায় শুধু আইকন
          activeIcon: Column(
            // নির্বাচিত অবস্থায় আইকন এবং নিচে একটি লাইন
            mainAxisSize: MainAxisSize
                .min, // Column কে যতটুকু দরকার ততটুকু জায়গা নিতে বলা হয়েছে
            children: [
              Icon(Icons.message),
              SizedBox(height: 4),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Chat',
          icon: Icon(
            Icons.dashboard,
            color: Colors.grey,
          ), // সাধারণ অবস্থায় শুধু আইকন
          activeIcon: Column(
            // নির্বাচিত অবস্থায় আইকন এবং নিচে একটি লাইন
            mainAxisSize: MainAxisSize
                .min, // Column কে যতটুকু দরকার ততটুকু জায়গা নিতে বলা হয়েছে
            children: [
              Icon(Icons.dashboard),
              SizedBox(height: 4),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ), // সাধারণ অবস্থায় শুধু আইকন
          activeIcon: Column(
            // নির্বাচিত অবস্থায় আইকন এবং নিচে একটি লাইন
            mainAxisSize: MainAxisSize
                .min, // Column কে যতটুকু দরকার ততটুকু জায়গা নিতে বলা হয়েছে
            children: [
              Icon(Icons.search),
              SizedBox(height: 4),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
