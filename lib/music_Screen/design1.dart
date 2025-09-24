import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class AudiobookHomeScreen extends StatefulWidget {
  const AudiobookHomeScreen({super.key});

  @override
  State<AudiobookHomeScreen> createState() => _AudiobookHomeScreenState();
}

class _AudiobookHomeScreenState extends State<AudiobookHomeScreen> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 83,
        backgroundColor: AppColors.bg,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: AppBarWidget(key: ValueKey('app_bar_widget')),
        ),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      const GreetingWidget(),
                      const SizedBox(height: 24),
                      const CurrentlyPlayingCard(),
                      const SizedBox(height: 30),
                      const SectionHeader(title: "Listened recently"),
                      const SizedBox(height: 16),
                      const BookListItem(
                        title: 'Swimmer Among the Stars: Stories',
                        author: 'Kanishk Tharoor',
                        progress: 0.7,
                        img: AppsImages.swm,
                      ),
                      const BookListItem(
                        title: 'Detransition, Baby',
                        author: 'Torrey Peters',
                        progress: 0.4,
                        img: AppsImages.swm,
                      ),
                      const SizedBox(height: 20),
                      const SectionHeader(title: "Favorites"),
                      const SizedBox(height: 16),
                      const BookListItem(
                        title: 'Leave the World Behind',
                        author: 'Rumaan Alam',
                        progress: 0.9,
                        img: AppsImages.swm,
                      ),
                      const SizedBox(
                        height: 100,
                      ), // স্ক্রলিং এর জন্য অতিরিক্ত জায়গা
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

// উপরের অ্যাপ বার
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50.0, // একটি নির্দিষ্ট चौड़ाई দিন
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(AppsImages.appLogo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 28,
            color: AppColors.iconColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

// অভিবাদন টেক্সট
class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Text(
              'Hey,',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Text(
              ' Julia!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          'What will you listen to today?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryText,
          ),
        ),
      ],
    );
  }
}

class CurrentlyPlayingCard extends StatelessWidget {
  const CurrentlyPlayingCard({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardBorderRadius = 20.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      // Stack এর চাইল্ডগুলোকে গোলাকার বর্ডারের ভেতরে রাখার জন্য ClipRRect
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Stack(
          children: [
            // Layer 1: মূল কন্টেন্ট এবং ব্যাকগ্রাউন্ড
            Container(
              color: AppColors.playGrColor,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 68,
                    decoration: BoxDecoration(
                      color: AppColors.playGrColor,
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(AppsImages.swm),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Icon(
                      Icons.pause,
                      color: AppColors.background,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'A Teaspoon of Earth and Sea',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'by Dina Nayeri',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 122, 121, 121),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.more_horiz,
                                color: AppColors.iconColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Layer 2: Progress Indicator (Stack এর উপরে বসানো)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.eventBlue),
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// সেকশনের হেডার
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryText,
      ),
    );
  }
}

// অডিওবুকের লিস্ট আইটেম
class BookListItem extends StatelessWidget {
  final String title;
  final String author;
  final double progress;
  final String img;

  const BookListItem({
    super.key,
    required this.title,
    required this.author,
    required this.progress,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 68,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),

          // --- --- --- --- --- ---
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  author,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 145, 143, 143),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.more_horiz, color: AppColors.iconColor),
                onPressed: () {},
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 3.5,
                  backgroundColor: AppColors.progressTrack,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.eventBlue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// নিচের নেভিগেশন বার
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ), // আইকনগুলোর উপরে-নিচে একটু জায়গা দেওয়ার জন্য
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment.spaceAround ব্যবহার করে আইটেমগুলোকে মাঝখানে আনা হয়েছে
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.auto_stories_outlined,
              activeIcon: Icons.auto_stories,
              index: 0,
            ),
            _buildNavItem(icon: Icons.search, index: 1),
            _buildNavItem(
              icon: Icons.bookmark_border,
              activeIcon: Icons.bookmark,
              index: 2,
            ),
            _buildNavItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  // প্রতিটি নেভিগেশন আইটেম তৈরি করার জন্য একটি Helper Widget
  Widget _buildNavItem({
    required IconData icon,
    IconData? activeIcon,
    required int index,
  }) {
    // বর্তমান আইটেমটি নির্বাচিত কিনা তা পরীক্ষা করা হচ্ছে
    final isSelected = selectedIndex == index;

    return IconButton(
      onPressed: () => onItemTapped(index),
      icon: Icon(
        // যদি নির্বাচিত থাকে এবং activeIcon থাকে, তবে সেটি দেখানো হবে, নাহলে সাধারণ আইকন
        isSelected ? (activeIcon ?? icon) : icon,
        color: isSelected ? AppColors.eventBlue : AppColors.iconColor,
        size: 26, // আইকনের সাইজ
      ),
    );
  }
}
