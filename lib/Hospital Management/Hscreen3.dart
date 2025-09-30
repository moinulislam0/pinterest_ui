import 'package:flutter/material.dart';

import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class HScreen3 extends StatelessWidget {
  const HScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 105,
        automaticallyImplyLeading: false,
        title: _CustomAppBar(),
      ),
      backgroundColor: AppColors.appBackground1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _UpcomingScheduleSection(),
              const SizedBox(height: 30),

              // পার্ট ৩: ক্যাটাগরি বিভাগ
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: _CategoriesSection(),
              ),
              const SizedBox(height: 30),

              // পার্ট ৪: সেরা ডাক্তার বিভাগ
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: _TopDoctorsSection(),
              ),
              const SizedBox(height: 20),
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
          backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=12'), // একটি Placeholder ছবি
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Shadhin',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'How is your health?',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon:
              const Icon(Icons.search, color: AppColors.primaryText, size: 28),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined,
              color: AppColors.primaryText, size: 28),
        ),
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
          child: const Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.seeAllText1,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: _SectionHeader(title: 'Upcoming Schedule'),
        ),
        SizedBox(height: 15),
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
                ),
                SizedBox(width: 15),
                _ScheduleCard(
                  doctorName: 'Dr. Alisa Dewali',
                  specialty: 'Odontology',
                  dateTime: 'Feb 26, 11:00am',
                  imageUrl: AppsImages.doctorImage,
                ),
                SizedBox(width: 15),
                _ScheduleCard(
                  doctorName: 'Dr. Alisa Dewali',
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

  const _ScheduleCard({
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue1,
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
                          color: const Color(0xFF2799f9),
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
                                  color: Colors.white, fontSize: 12),
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
        _SectionHeader(title: 'Categories'),
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

  const _CategoryItem(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.cardBackground1,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor1.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.secondaryText1,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
        _SectionHeader(title: 'Top Doctors'),
        SizedBox(height: 15),
        _DoctorCard(
          name: 'Dr. Shakib Khan',
          specialty: 'Dental • Asian Hospital',
          rating: '(365)',
          imageUrl: 'https://i.ibb.co/6Pz2sS1/doctor1.png', // Placeholder
        ),
        SizedBox(height: 15),
        _DoctorCard(
          name: 'Dr. Adrian Segara',
          specialty: 'Surgeo • Apollo Hospital',
          rating: '(147)',
          imageUrl: 'https://i.ibb.co/6Pz2sS1/doctor1.png', // Placeholder
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
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText1,
                  ),
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
          const Icon(Icons.more_horiz, color: AppColors.secondaryText1),
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
