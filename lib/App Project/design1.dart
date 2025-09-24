import 'package:flutter/material.dart';
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
          // const SizedBox(height: 100),
          Container(
            height: 400,
            width: double.infinity,
            color: const Color.fromARGB(255, 231, 231, 231),

            child: Image.asset(AppsImages.con_man),
          ),
          const SizedBox(height: 50),

          const PageIndicator(),
          const SizedBox(height: 48.0),

          const Text(
            'Find Tools You Need',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 20.0),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Text(
              'Uborro is a tool sharing platform we create this app to help our users to easily find tools online sothat they dont have to buy one saves both money & time',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: AppColors.subtextColor,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 50),

          const NavigationButton(),
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
          width: 24.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(4.0),
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
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.arrow_forward, color: Colors.white, size: 28.0),
    );
  }
}
