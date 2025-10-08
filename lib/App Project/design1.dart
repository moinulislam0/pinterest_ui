import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class AppProjectDesign1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          Container(
            height: 350.h,
            width: double.infinity,
            color: const Color.fromARGB(255, 231, 231, 231),
            child: Image.asset(AppsImages.con_man),
          ),
          const SizedBox(height: 50),

          const PageIndicator(),
          SizedBox(height: 30.h),

          Text(
            'Find Tools You Need',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 20.0),

          Padding(
            padding: EdgeInsets.only(left: 22.r, right: 22.r),
            child: Text(
              'Uborro is a tool sharing platform we create this app to help our users to easily find tools online sothat they dont have to buy one saves both money & time',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.9.sp,
                color: AppColors.ubColor,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 12.h),

          SafeArea(child: const NavigationButton()),
          //const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 18.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const SizedBox(width: 8.0),
        Container(
          width: 8.w,
          height: 8.h,
          decoration: const BoxDecoration(
            color: AppColors.inactiveDotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8.0),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: const BoxDecoration(
            color: AppColors.inactiveDotColor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColorAP,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(Icons.arrow_forward,
          color: AppColors.whiteGreyMu, size: 28.0),
    );
  }
}
