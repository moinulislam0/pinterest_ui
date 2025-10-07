import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

// The main screen widget for the doctor's profile.
// এটি মূল স্ক্রিন উইজেট।
class DScreen3 extends StatefulWidget {
  const DScreen3({super.key});

  @override
  State<DScreen3> createState() => _DScreen3State();
}

class _DScreen3State extends State<DScreen3> {
  int _selectedDateIndex = 3; // 'Tue 15' is selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground1,
      // extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBookAppointmentButton(),
    );
  }

  // AppBar widget. It's clickable.
  // অ্যাপবারটি এখানে তৈরি করা হয়েছে।
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: AppColors.appBackground1,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,
            color: Color.fromARGB(255, 31, 29, 29)),
        onPressed: () {
          // Handle back button press
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border,
              color: AppColors.kPrimaryBlueColor),
          onPressed: () {
            // Handle favorite button press
          },
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined,
              color: AppColors.kPrimaryBlueColor),
          onPressed: () {
            // Handle share button press
          },
        ),
      ],
    );
  }

  // The main body widget with a gradient background.
  // স্ক্রিনের মূল অংশ এখানে তৈরি।
  Widget _buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Space for AppBar
            _buildDoctorHeader(),
            const SizedBox(height: 24),
            _buildStatsRow(),
            const SizedBox(height: 30),
            _buildSectionTitle('About Doctor'),
            const SizedBox(height: 8),
            _buildAboutDoctorText(),
            const SizedBox(height: 24),
            _buildSectionTitle('Working time'),
            const SizedBox(height: 8),
            const Text(
              'Mon - Sat (08:30 AM - 09:00 PM)',
              style:
                  TextStyle(color: AppColors.kSecondaryTextColor, fontSize: 14),
            ),
            const SizedBox(height: 24),
            _buildScheduleSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Doctor's header section with avatar and details.
  // ডাক্তারের ছবি এবং বিবরণী অংশ।
  Widget _buildDoctorHeader() {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor:
                  AppColors.kWhiteColor, // এটি বর্ডারের মতো কাজ করবে
              child: CircleAvatar(
                radius: 42,
                backgroundColor:
                    Colors.grey, // ছবি লোড হওয়ার আগে এই রঙটি দেখাবে
                // পরিবর্তন: child এর পরিবর্তে backgroundImage ব্যবহার করা হয়েছে
                backgroundImage: AssetImage(
                  AppsImages.appLogo,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: -5,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.kWhiteColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.medical_services,
                    color: Colors.blue, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Alis Dewali',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryTextColor1,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.blue, size: 18),
                  SizedBox(width: 4),
                  Text(
                    '4.9 (462 reviews)',
                    style: TextStyle(
                        color: AppColors.kSecondaryTextColor, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                'Psychologist • Asian Hospital',
                style: TextStyle(
                    color: AppColors.kSecondaryTextColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Row of statistics cards.
  // পরিসংখ্যান কার্ডগুলোর সারি।
  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatsCard(
          icon: Icons.people_alt,
          value: '1000+',
          label: 'Patients',
          iconColor: AppColors.kStatsCardBlueIcon,
          bgColor: AppColors.kStatsCardBlueIconBg,
        ),
        _buildStatsCard(
          icon: Icons.person_outline,
          value: '5 yr+',
          label: 'Experience',
          iconColor: AppColors.kStatsCardPinkIcon,
          bgColor: AppColors.kStatsCardPinkIconBg,
        ),
        _buildStatsCard(
          icon: Icons.star_border,
          value: '4.9',
          label: 'Ratings',
          iconColor: AppColors.kStatsCardYellowIcon,
          bgColor: AppColors.kStatsCardYellowIconBg,
        ),
      ],
    );
  }

  // Reusable widget for a single statistics card.
  // একটি পরিসংখ্যান কার্ডের জন্য পুনর্ব্যবহারযোগ্য উইজেট।
  Widget _buildStatsCard({
    required IconData icon,
    required String value,
    required String label,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 3 - 24,
      decoration: BoxDecoration(
        color: Colors.white, // AppColors.kWhiteColor
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade50.withOpacity(0.6),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      // পরিবর্তন ১: Stack ব্যবহার করা হয়েছে ডিজাইনটি তৈরি করার জন্য
      child: Stack(
        clipBehavior: Clip.none, // স্ট্যাকের বাইরেও আইকন দেখা যাবে
        alignment: Alignment.center,
        children: [
          // নিচে থাকা টেক্সট অংশ
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A4D6F),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // পরিবর্তন ২: আইকন এবং তার নীল الخلفيةটি উপরে পজিশন করা হয়েছে
          Positioned(
            top: 0, // কার্ডের সীমানা থেকে উপরে বসানো হয়েছে
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryTextColor1,
      ),
    );
  }

  // "About Doctor" text with a clickable "See More".
  // "See More" লিঙ্কসহ ডাক্তারের বিবরণী।
  Widget _buildAboutDoctorText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.kSecondaryTextColor,
          height: 1.5,
          fontFamily: 'Inter',
        ),
        children: [
          const TextSpan(
            text:
                'Doctor Eleanor top specialist at Asian Hospital at London. He has achieved several awards and recognition ........',
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                // Handle "See More" tap
              },
              child: const Text(
                'See More',
                style: TextStyle(
                  color: AppColors.kPrimaryBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Schedule section with clickable date items.
  // তারিখসহ সিডিউল অংশ।
  Widget _buildScheduleSection() {
    final List<Map<String, String>> dates = [
      {'day': 'Sat', 'date': '12'},
      {'day': 'Sun', 'date': '13'},
      {'day': 'Mon', 'date': '14'},
      {'day': 'Tue', 'date': '15'},
      {'day': 'Wed', 'date': '16'},
      {'day': 'Thu', 'date': '17'},
      {'day': 'Fri', 'date': '18'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Schedule'),
            IconButton(
              icon: const Icon(Icons.calendar_today_outlined,
                  color: AppColors.kSecondaryTextColor, size: 20),
              onPressed: () {
                // Handle calendar icon press
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90, // Adjusted height to fit the design
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: 12), // Adjusted spacing
            itemBuilder: (context, index) {
              bool isSelected = _selectedDateIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDateIndex = index;
                  });
                },
                child: Container(
                  width: 55, // Adjusted width
                  padding: const EdgeInsets.symmetric(
                      vertical: 2), // Adjusted padding
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.kPrimaryBlueColor : Colors.white,
                    borderRadius: BorderRadius.circular(30), // Pill shape
                  ),
                  child: Column(
                    // This is the main change to fix the alignment
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dates[index]['day']!,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.kWhiteColor
                                : Color(0XFFc3c7cf),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // The SizedBox between day and date circle is removed.
                      Container(
                        padding: const EdgeInsets.all(
                            11), // Adjusted padding for the circle
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.kWhiteColor
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          dates[index]['date']!,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.kPrimaryBlueColor
                                : Color(0XFFc3c7cf),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookAppointmentButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
      child: ElevatedButton(
        onPressed: () {
          // Handle booking action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryBlueColor,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          shadowColor: AppColors.kPrimaryBlueColor.withOpacity(0.5),
        ),
        child: const Text(
          'Book Appointment',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
    );
  }
}
