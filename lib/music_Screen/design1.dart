import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        toolbarHeight: 80,
        backgroundColor: AppColors.bg,
        title: Padding(
          padding: const EdgeInsets.only(left: 25, right: 15),
          child: AppBarWidget(key: ValueKey('app_bar_widget')),
        ),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 20.r),
                      child: const GreetingWidget(),
                    ),
                    const SizedBox(height: 24),
                    const CurrentlyPlayingCard(),
                    const SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 10.r),
                      child: const SectionHeader(title: "Listened recently"),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(left: 5.r),
                      child: const BookListItem(
                        title: 'Swimmer Among the Stars: Stories',
                        author: 'Kanishk Tharoor',
                        progress: 0.7,
                        img: AppsImages.swm,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.r),
                      child: const BookListItem(
                        title: 'Detransition, Baby',
                        author: 'Torrey Peters',
                        progress: 0.4,
                        img: AppsImages.swm,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(left: 10.r),
                      child: const SectionHeader(title: "Favorites"),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(left: 5.r),
                      child: const BookListItem(
                        title: 'Leave the World Behind',
                        author: 'Rumaan Alam',
                        progress: 0.9,
                        img: AppsImages.swm,
                      ),
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
      bottomNavigationBar: SafeArea(
        child: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: onItemTapped,
        ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            boxShadow: [],
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(AppsImages.appLogo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_none_outlined,
            size: 20.sp,
            color: Colors.black,
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
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            Text(
              ' Julia!',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColorMS,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          'What will you listen to today?',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColorMS),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Stack(
          children: [
            Container(
              color: AppColors.playGrColor,
              padding: EdgeInsets.only(
                left: 15.r,
                top: 18.r,
                bottom: 25.r,
                right: 10.r,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.playGrColor,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(10, 10),
                        ),
                      ],
                      color: AppColors.playGrColor,
                      borderRadius: BorderRadius.circular(12.0),
                      image: const DecorationImage(
                        image: AssetImage(AppsImages.swm),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Icon(
                      Icons.pause,
                      color: AppColors.background,
                      size: 28.sp,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'A Teaspoon of Earth and Sea',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryText,
                                  fontFamily: 'serif',
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'by Dina Nayeri',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromARGB(255, 122, 121, 121),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(4.r),
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
      style: TextStyle(
        fontSize: 14.sp,
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
      padding: const EdgeInsets.only(left: 6, right: 20, top: 15, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60.w,
            height: 62.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(2, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                    fontFamily: 'serif',
                  ),
                ),
                SizedBox(height: 4.h),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- সমাধান: IconButton এর পরিবর্তে GestureDetector ও Icon ব্যবহার করা হয়েছে ---
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_horiz, color: AppColors.iconColor),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 2.5,
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
      padding: const EdgeInsets.only(bottom: 20, left: 30, right: 38),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
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

  Widget _buildNavItem({
    required IconData icon,
    IconData? activeIcon,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return IconButton(
      onPressed: () => onItemTapped(index),
      icon: Icon(
        isSelected ? (activeIcon ?? icon) : icon,
        color: isSelected ? AppColors.eventBlue : AppColors.iconColor,
        size: 26,
      ),
    );
  }
}
