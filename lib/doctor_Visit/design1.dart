import 'package:flutter/material.dart';

import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class DScreen1 extends StatelessWidget {
  const DScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackground1,
        scrolledUnderElevation: 0,
        toolbarHeight: 105,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: _CustomAppBar(),
        ),
      ),
      backgroundColor: AppColors.appBackground1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 22, right: 15),
                child: _SectionHeader(title: 'Upcoming Schedule'),
              ),
              _UpcomingScheduleSection(),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 15),
                child: _SectionHeader(title: 'Categories'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: _CategoriesSection(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 15),
                child: _SectionHeader(title: 'Top Doctors'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: _TopDoctorsSection(),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),

      // পার্ট ৫: কাস্টম বটম নেভিগেশন বার
      bottomNavigationBar: _CustomBottomNavigationBar(),
    );
  }
}

// ১. কাস্টম অ্যাপ বার উইজেট।
class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,

          backgroundImage:
              AssetImage(AppsImages.appLogo), // একটি Placeholder ছবি
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(children: [
              Text('Hi, ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  )),
              Text(
                'Shadhin',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
            ]),
            SizedBox(height: 4),
            Text(
              'How is your health?',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.secondaryText1,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search,
              color: Color.fromARGB(255, 92, 96, 105), size: 28),
        ),
        IconButton(
          onPressed: () {},
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications_outlined,
                size: 28,
                color: Color.fromARGB(255, 92, 96, 105),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// একটি পুনরায় ব্যবহারযোগ্য সেকশন হেডার।
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.seeAllTextsub.withValues(alpha: .7),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _UpcomingScheduleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 5),
        SizedBox(
          height: 150,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                _ScheduleCard(
                  doctorName: 'Dr. Alisa Dewali',
                  specialty: 'Cardiovascular',
                  dateTime: 'Feb 24, 9:00am',
                  imageUrl: AppsImages.doctorImage,
                  colors: AppColors.primaryBlue1,
                  color: Color(0XFF2b9bfa),
                ),
                SizedBox(width: 15),
                _ScheduleCard(
                  doctorName: 'Dr. Alisa Dewali',
                  specialty: 'Odontology',
                  dateTime: 'Feb 26, 11:00am',
                  imageUrl: AppsImages.doctorImage,
                  colors: Color(0XFF5a95fe),
                  color: Color(0XFF5189ef),
                ),
                SizedBox(width: 15),
                _ScheduleCard(
                  doctorName: 'Dr. Alisa Dewali',
                  colors: AppColors.primaryBlue1,
                  color: Color(0XFF2b9bfa),
                  specialty: 'Odontology',
                  dateTime: 'Feb 26, 11:00am',
                  imageUrl: AppsImages.doctorImage,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// একটি সময়সূচী কার্ডের উইজেট।
class _ScheduleCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String dateTime;
  final String imageUrl;
  final Color colors, color;

  const _ScheduleCard({
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
    required this.imageUrl,
    required this.colors,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(20),
      ),
      // Stack overflow এড়ানোর জন্য clipBehavior যোগ করা হয়েছে
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Background decorative circles (unchanged)
          Positioned(
            right: -30,
            bottom: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Image is now a direct child of Stack and positioned
          Positioned(
            bottom: 0, // Align to the bottom of the card
            right: -50, // Give some space from the right edge
            child: Container(
              width: 210, // Increased width
              height: 210, // Increased height to reach the bottom
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain, // Use contain to prevent distortion
                alignment: Alignment.bottomCenter,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
          ),

          // Text content remains in a Row inside Padding
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            doctorName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.videocam,
                              color: Colors.white, size: 20),
                        ],
                      ),
                      Text(
                        specialty,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(), // Pushes the date to the bottom
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: .9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.white, size: 14),
                            const SizedBox(width: 6),
                            Text(
                              dateTime,
                              style: const TextStyle(
                                  color: Color(0XFF87edff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // The image container is no longer here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ৩. ক্যাটাগরি বিভাগের উইজেট।
class _CategoriesSection extends StatelessWidget {
  const _CategoriesSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CategoryItem(
                icon: Icons.monitor_heart,
                label: 'Cardiology',
                color: Colors.red),
            _CategoryItem(
                icon: Icons.psychology,
                label: 'Psychologist',
                color: Colors.blue),
            _CategoryItem(
                icon: Icons.science_outlined,
                label: 'Quick Test',
                color: Colors.purple),
            _CategoryItem(
                icon: Icons.coronavirus,
                label: 'Covid 19',
                color: Colors.orange),
          ],
        ),
      ],
    );
  }
}

// একটি ক্যাটাগরি আইটেমের উইজেট।

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.black, // আরও সঠিক রঙের জন্য পরিবর্তন
              fontSize: 11,
              fontWeight: FontWeight.w600, // ছবির মতো সাধারণ ফন্ট ওয়েট
            ),
          ),
        ],
      ),
    );
  }
}

// ৪. সেরা ডাক্তার বিভাগের উইজেট।
class _TopDoctorsSection extends StatelessWidget {
  const _TopDoctorsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        _DoctorCard(
          name: 'Dr. Shakib Khan',
          specialty: 'Dental • Asian Hospital',
          rating: '(365)',
          imageUrl: AppsImages.doctorImage, // Placeholder
        ),
        SizedBox(height: 15),
        _DoctorCard(
          name: 'Dr. Adrian Segara',
          specialty: 'Surgeo • Apollo Hospital',
          rating: '(147)',
          imageUrl: AppsImages.doctorImage, // Placeholder
        ),
      ],
    );
  }
}

// একটি ডাক্তার কার্ডের উইজেট।
class _DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String rating;
  final String imageUrl;

  const _DoctorCard({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor1.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue1.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText1,
                      ),
                    ),
                    const Icon(Icons.more_vert,
                        color: AppColors.secondaryText1),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  specialty,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.secondaryText1,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star,
                        color: AppColors.ratingStar, size: 16),
                    const Icon(Icons.star,
                        color: AppColors.ratingStar, size: 16),
                    const Icon(Icons.star,
                        color: AppColors.ratingStar, size: 16),
                    const Icon(Icons.star,
                        color: AppColors.ratingStar, size: 16),
                    const Icon(Icons.star,
                        color: AppColors.ratingStar, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      rating,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.secondaryText),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ৫. কাস্টম বটম নেভিগেশন বারের উইজেট।
class _CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor1,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppColors.primaryBlue1,
        unselectedItemColor: AppColors.unselectedBottomNav,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business_center_outlined), label: 'Briefcase'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Menu'),
        ],
      ),
    );
  }
}
