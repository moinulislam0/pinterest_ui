import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';

class AppTextStyles {
  // ==== COMMON TEXT STYLES ====

  // Heading Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle heading5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle heading6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  // Body Text Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryTextColor,
  );

  // Caption and Label Styles
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText1,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
  );

  // Button Text Styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
  );

  // ==== HOSPITAL MANAGEMENT TEXT STYLES ====
  static const TextStyle hospitalTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.hospitalTextPrimary,
  );

  static const TextStyle hospitalSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.hospitalTextSecondary,
  );

  static const TextStyle hospitalHeartRate = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.hospitalScreen2PrimaryText,
  );

  static const TextStyle hospitalBpm = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.hospitalScreen2SecondaryText,
  );

  static const TextStyle hospitalVitalValue = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.hospitalScreen2PrimaryText,
  );

  // ==== SHOP CASE TEXT STYLES ====
  static const TextStyle shopProductTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.shopkPrimaryTextColor,
  );

  static const TextStyle shopProductPrice = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0XFFf05153),
  );

  static const TextStyle shopRating = TextStyle(
    fontWeight: FontWeight.w700,
    color: Color.fromARGB(255, 110, 108, 108),
    fontSize: 16,
    fontFamily: 'serif',
  );

  static const TextStyle shopReviews = TextStyle(
    color: Color.fromARGB(255, 126, 125, 125),
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle shopQuantity = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 61, 61, 61),
  );

  // ==== APP PROJECT TEXT STYLES ====
  static const TextStyle appProjectTitle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle appProjectSubtitle = TextStyle(
    fontSize: 15.0,
    color: AppColors.secondaryText1,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle appProjectCardTitle = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle appProjectCardSubtitle = TextStyle(
    color: AppColors.secondaryText1,
    fontSize: 14,
  );

  static const TextStyle appProjectCounter = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  // ==== PRODUCTS DISCOVER TEXT STYLES ====
  static const TextStyle discoverTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.discoverkPrimaryTextColor,
  );

  static const TextStyle discoverSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.discoverkSecondaryTextColor,
  );

  static const TextStyle discoverBody = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.discoverkPrimaryTextColor,
    height: 1.5,
  );

  // ==== HINT TEXT STYLES ====
  static const TextStyle hintText = TextStyle(
    color: AppColors.secondaryText1,
    fontSize: 14,
  );

  static const TextStyle searchHint = TextStyle(
    color: AppColors.secondaryText1,
    fontSize: 16,
  );
}
