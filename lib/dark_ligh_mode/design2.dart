import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';

import 'package:pinterest_ui/dark_ligh_mode/design1.dart';

class DarkModeDesign2 extends StatelessWidget {
  const DarkModeDesign2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const ProfileCard(
                search: AppColors.kPrimaryTextColor1,
                arrow: AppColors.kPrimaryTextColor1,

                colors: AppColors.kCardColor1,
                titleColor: AppColors.kPrimaryTextColor1,
              ),
              const SizedBox(height: 20),
              const MainCategoriesCard(
                color: AppColors.kCardColor1,
                iconC: AppColors.kPrimaryTextColor1,
                textC: AppColors.kPrimaryTextColor1,
              ),
              const SizedBox(height: 20),
              const WorkCategoryCard(
                arrow: AppColors.kPrimaryTextColor1,
                color: AppColors.kCardColor1,
                text1: AppColors.kPrimaryTextColor1,
                text2: AppColors.kPrimaryTextColor1,
              ),
              const SizedBox(height: 20),
              const PersonalCategoryCard(
                color: AppColors.kCardColor1,
                textC: AppColors.kPrimaryTextColor1,
                arrow: AppColors.kPrimaryTextColor1,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
