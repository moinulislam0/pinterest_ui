import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class Doctor {
  final String name;
  final String specialty;
  final bool isOnline;

  Doctor({required this.name, required this.specialty, required this.isOnline});
}

class DScreen2 extends StatefulWidget {
  const DScreen2({super.key});

  @override
  State<DScreen2> createState() => _DScreen2State();
}

class _DScreen2State extends State<DScreen2> {
  int _selectedIndex = 2;

  final List<Doctor> doctors = [
    Doctor(name: 'Dr. Alisa Dewali', specialty: 'Psychologist', isOnline: true),
    Doctor(name: 'Dr. Klimisch J', specialty: 'Viralogist', isOnline: true),
    Doctor(name: 'Dr. Mensah T', specialty: 'Surgeon', isOnline: false),
    Doctor(name: 'Dr. Alexa Jr', specialty: 'Pediatrician', isOnline: true),
    Doctor(name: 'Dr. Dianne A', specialty: 'Radiologists', isOnline: true),
    Doctor(
        name: 'Dr. Eleanor Pena', specialty: 'Orthodontist', isOnline: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground1,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.appBackground1,
      elevation: 0,
      toolbarHeight: 73,
      leadingWidth: 73,
      leading: Padding(
        padding: const EdgeInsets.only(left: 28),
        child: Center(
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
      title: const Text(
        'Doctor List',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18.0,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.tune,
                size: 24.0,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }

  // Builds the main content area of the screen.
  // স্ক্রিনের প্রধান অংশ তৈরি করে।
  Widget _buildBody() {
    return Padding(
      // Padding for the entire body content.
      // পুরো body-এর জন্য প্যাডিং।
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          _buildSearchBar(),
          const SizedBox(height: 24.0),
          _buildDoctorGrid(),
        ],
      ),
    );
  }

  // Builds the search bar widget.
  // সার্চ বার উইজেট তৈরি করে।
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kSearchBarColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search a doctor',
            hintStyle: TextStyle(
              color: AppColors.kSecondaryTextColor,
              fontSize: 14.0,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.kSecondaryTextColor,
              size: 30.0,
            ),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
        ),
      ),
    );
  }

  // Builds the grid view of doctor cards.
  // ডাক্তার কার্ডগুলির গ্রিড ভিউ তৈরি করে।
  Widget _buildDoctorGrid() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 80.0, left: 16, right: 16),
        itemCount: doctors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns as in the image
          crossAxisSpacing: 20.0, // Horizontal spacing between cards
          mainAxisSpacing: 16.0, // Vertical spacing between cards
          childAspectRatio: 0.8, // Aspect ratio to match the card shape
        ),
        itemBuilder: (context, index) {
          return DoctorCard(doctor: doctors[index]);
        },
      ),
    );
  }

  // Builds the bottom navigation bar.
  // Bottom Navigation Bar তৈরি করে।
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kCardBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
        // The bottom navigation bar in the image doesn't have rounded corners,
        // so we don't apply any border radius here.
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.kCardBackgroundColor,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.kSelectedIconColor,
        unselectedItemColor: AppColors.kUnselectedIconColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.kCardBackgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundColor:
                    AppColors.kBackgroundColor, // ছবি লোড হওয়ার আগে দেখাবে
                backgroundImage: AssetImage(
                    AppsImages.appLogo), // doctor.imagePath ব্যবহার করা ভালো
              ),
              if (doctor.isOnline)
                Positioned(
                  top: 2, // ডটকে আরও ভালোভাবে পজিশন করা হয়েছে
                  right: 4,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.kOnlineIndicatorColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 15.0),
          // Doctor's name
          Text(
            doctor.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4.0),
          // Doctor's specialty
          Text(
            doctor.specialty,
            style: const TextStyle(
              color: AppColors.kSecondaryTextColor,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 18.0),
          InkWell(
            onTap: () {
              // Action for appointment button click.
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: AppColors.kAppointmentButtonColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Appointment',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
