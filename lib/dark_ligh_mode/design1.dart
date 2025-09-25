import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class DarkModeDesign extends StatelessWidget {
  const DarkModeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const ProfileCard(
                search: AppColors.kPrimaryTextColor,
                arrow: AppColors.kPrimaryTextColor,

                colors: AppColors.kCardColor,
                titleColor: AppColors.kPrimaryTextColor,
              ),
              const SizedBox(height: 20),
              const MainCategoriesCard(
                color: AppColors.kCardColor,
                iconC: AppColors.kPrimaryTextColor,
                textC: AppColors.kPrimaryTextColor,
              ),
              const SizedBox(height: 20),
              const WorkCategoryCard(
                arrow: AppColors.kPrimaryTextColor,
                color: AppColors.kCardColor,
                text1: AppColors.kPrimaryTextColor,
                text2: AppColors.kPrimaryTextColor,
              ),
              const SizedBox(height: 20),
              const PersonalCategoryCard(
                arrow: AppColors.kPrimaryTextColor,
                color: AppColors.kCardColor,
                textC: AppColors.kPrimaryTextColor,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

// --- প্রোফাইল কার্ড ---AppColors.kCardColor,
class ProfileCard extends StatelessWidget {
  final Color colors, titleColor, search, arrow;
  const ProfileCard({
    super.key,
    required this.colors,
    required this.titleColor,
    required this.search,
    required this.arrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 92, 91, 91),
                width: 1.5,
              ),
              shape: BoxShape.circle,
              color: AppColors.kBackgroundColor,
              image: DecorationImage(
                image: AssetImage(AppsImages.appLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Jhoan Deo',
                    style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down, color: arrow, size: 20),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Jhoandeo@gmail.com',
                style: TextStyle(
                  color: AppColors.kSecondaryTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.search, color: search, size: 28),
        ],
      ),
    );
  }
}

// --- প্রধান ক্যাটাগরি কার্ড ---
class MainCategoriesCard extends StatelessWidget {
  final Color color, iconC, textC;
  const MainCategoriesCard({
    super.key,
    required this.color,
    required this.iconC,
    required this.textC,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          _buildCategoryItem(Icons.wb_sunny_outlined, 'My Day', '5'),
          _buildCategoryItem(Icons.star_border, 'Important', '45'),
          _buildCategoryItem(Icons.calendar_today_outlined, 'Planned', '23'),
          _buildCategoryItem(Icons.person_outline, 'Shared tasks', '2'),
          _buildCategoryItem(Icons.home_outlined, 'Tasks', '8'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        children: [
          Icon(icon, color: iconC, size: 24),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: textC,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            count,
            style: const TextStyle(
              color: AppColors.kSecondaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// --- "Work" ক্যাটাগরি কার্ড ---
class WorkCategoryCard extends StatelessWidget {
  final Color color, text1, text2, arrow;
  const WorkCategoryCard({
    super.key,
    required this.color,
    required this.text1,
    required this.text2,
    required this.arrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Work',
                style: TextStyle(
                  color: text1,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_up, color: arrow, size: 24),
            ],
          ),
          const SizedBox(height: 10), // হেডার এবং আইটেমের মধ্যে ব্যবধান
          _buildWorkItem(AppColors.kRedColor, 'Office work', '16'),
          _buildWorkItem(AppColors.kBlueColor, 'Grocerys list', '8'),
          _buildWorkItem(AppColors.kGreenColor, 'Shopping list', '55'),
        ],
      ),
    );
  }

  Widget _buildWorkItem(Color color, String title, String count) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        children: [
          Icon(Icons.drag_handle, color: color, size: 24), // ছবির মতো আইকন
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              color: text2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            count,
            style: const TextStyle(
              color: AppColors.kSecondaryTextColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalCategoryCard extends StatelessWidget {
  final Color color, textC, arrow;
  const PersonalCategoryCard({
    super.key,
    required this.color,
    required this.textC,
    required this.arrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Text(
            'Personal',
            style: TextStyle(
              color: textC,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_down, color: arrow, size: 24),
        ],
      ),
    );
  }
}
