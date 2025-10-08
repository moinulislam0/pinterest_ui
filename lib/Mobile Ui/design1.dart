import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/icons.dart';

class Design1 extends StatelessWidget {
  const Design1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 45, bottom: 25),
            child: Text(
              'Tugas Hari Ini',
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryMu,
              ),
            ),
          ),
          // Task List Section
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              children: [
                TaskCard(
                  subject: 'MTK',
                  icon: Icons.pie_chart, // Placeholder icon
                  iconBackgroundColor: AppColors.mtkIconBackground,
                  iconForegroundColor: AppColors.mtkIconForeground,
                  chapter: 'Bab 4',
                  description: 'Kerjakan 5 soal essay di halaman 52 buku paket',
                  dueDate: 'Dikumpulkan pukul 10:00',
                ),
                SizedBox(height: 16.h),
                TaskCard(
                  subject: 'Olahraga',
                  icon: Icons.sports_esports, // Placeholder icon
                  iconBackgroundColor: AppColors.olahragaIconBackground,
                  iconForegroundColor: AppColors.olahragaIconForeground,
                  chapter: 'Bab 3',
                  description:
                      'Buat rangkuman bab 3 di google docs\nbuat kesimpulan dari materi di bab 3',
                  dueDate: 'Dikumpulkan pukul 16:30',
                ),
                SizedBox(height: 17.h),
                TaskCard(
                  subject: 'Kimia',
                  icon: Icons.science, // Placeholder icon
                  iconBackgroundColor: AppColors.kimiaIconBackground,
                  iconForegroundColor: AppColors.kimiaIconForeground,
                  chapter: 'Bab 5',
                  description:
                      'Definisikan zat yang terkandung dalam\nbesi, buat di google docs',
                  dueDate: 'Dikumpulkan pukul 10:00',
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: SafeArea(child: CustomBottomNavBar()),
    );
  }
}

/// A reusable card widget for displaying a single task.
class TaskCard extends StatelessWidget {
  final String subject;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconForegroundColor;
  final String chapter;
  final String description;
  final String dueDate;

  const TaskCard({
    super.key,
    required this.subject,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconForegroundColor,
    required this.chapter,
    required this.description,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.primaryColorMu.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                  color: iconForegroundColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Icon(icon, color: Colors.white, size: 15.sp),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                subject,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColorMu.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            chapter,
            style: TextStyle(
              fontSize: 15.r,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryMu,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 15.r,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryMu,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dueDate,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 206, 211, 219)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColorMu,
                  foregroundColor: AppColors.buttonText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.r,
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Detail',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.whiteGreyMu,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  static const List<Map<String, dynamic>> _navBarItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.school, 'label': 'Tugas'},
    {'icon': Icons.calendar_month, 'label': 'Jadwal'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.buttonText,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navBarItems.length, (index) {
          final item = _navBarItems[index];
          final bool isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () => _onItemTapped(index),
            behavior: HitTestBehavior.translucent,
            child: isSelected
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorMu.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(item['icon'],
                            size: 20.sp, color: AppColors.primaryColorMu),
                        SizedBox(width: 8.w),
                        Text(
                          item['label'],
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColorMu,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Icon(
                      item['icon'],
                      color: AppColors.navBarUnselected,
                      size: 20.sp,
                    ),
                  ),
          );
        }),
      ),
    );
  }
}

/// A single item for the custom bottom navigation bar.
class NavItem extends StatelessWidget {
  final IconData icon;

  const NavItem({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: AppColors.navBarUnselected, size: 28),
      onPressed: () {},
    );
  }
}
