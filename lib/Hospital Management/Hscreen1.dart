import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/textstyles.dart';
import 'package:pinterest_ui/core/images.dart';

// Main screen widget
class Hscreen1 extends StatefulWidget {
  const Hscreen1({Key? key}) : super(key: key);

  @override
  State<Hscreen1> createState() => _Hscreen1State();
}

class _Hscreen1State extends State<Hscreen1> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 105,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, top: 20, right: 28),
                child: SearchBarWidget(),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: SectionTitle(title: 'Services'),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: ServicesGridWidget(),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: MedicalServicesBannerWidget(),
              ),
              SizedBox(height: 35),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 28),
                child: SectionTitle(title: 'Upcoming Appointments'),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 24, bottom: 80),
                child: UpcomingAppointmentsWidget(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

// Builds the top header with greeting and profile picture
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  SvgPicture.asset(
                    AppsImages.handIcon,
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                    placeholderBuilder: (context) => const Icon(
                      Icons.waving_hand,
                      color: Colors.amber,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Hello!',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Martin Shah',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.hospitalTextPrimary,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      AppsImages.appLogo,
                      fit: BoxFit.cover,
                      // Error handling for missing image
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.person,
                            size: 30, color: AppColors.hospitalTextSecondary);
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: -3,
                  top: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppColors.hospitalPrimary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Builds the search input field
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.hospitalSearchBarBg,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search medical...',
          hintStyle:
              TextStyle(color: AppColors.hospitalTextSecondary, fontSize: 12),
          prefixIcon:
              Icon(Icons.search, color: AppColors.hospitalTextSecondary),
          suffixIcon: Icon(
            Icons.filter_list,
            color: AppColors.hospitalTextPrimary,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}

class ServicesGridWidget extends StatelessWidget {
  const ServicesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ServiceIcon(
          icon: AppsImages.dcUser,
          backgroundColor: AppColors.hospitalService1Bg,
          iconColor: AppColors.hospitalServiceIcon1,
        ),
        ServiceIcon(
          icon: AppsImages.firstAid,
          backgroundColor: AppColors.hospitalService2Bg,
          iconColor: AppColors.hospitalServiceIcon2,
        ),
        ServiceIcon(
          icon: AppsImages.list,
          backgroundColor: AppColors.hospitalService3Bg,
          iconColor: AppColors.hospitalServiceIcon3,
        ),
        ServiceIcon(
          icon: AppsImages.virus,
          backgroundColor: AppColors.hospitalService4Bg,
          iconColor: AppColors.hospitalServiceIcon4,
        ),
      ],
    );
  }
}

class MedicalServicesBannerWidget extends StatelessWidget {
  const MedicalServicesBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
      decoration: BoxDecoration(
        color: AppColors.hospitalBannerBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get the Best\nMedical Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.hospitalBannerTitle,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We provide best quality medical service without further cost.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.hospitalTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AppsImages.doctor,
                fit: BoxFit.cover,
                height: 160,
                // Error handling for missing image
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.local_hospital,
                      size: 100, color: AppColors.hospitalPrimary);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingAppointmentsWidget extends StatelessWidget {
  const UpcomingAppointmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          AppointmentCard(
            date: '12',
            day: 'Tue',
            time: '09:30 AM',
            doctor: 'Dr. Mim Akhter',
            specialty: 'Depression',
            color: AppColors.hospitalUpcomingAppointmentActive,
            textColor: AppColors.hospitalWhite,
            dateBoxColor: AppColors.hospitalDateBoxBg,
          ),
          SizedBox(width: 15),
          AppointmentCard(
            date: '13',
            day: 'We',
            time: '11:00 AM',
            doctor: 'Dr. Alex Doe',
            specialty: 'Checkup',
            color: AppColors.hospitalUpcomingAppointmentInactive,
            textColor: AppColors.hospitalTextPrimary,
            dateBoxColor: AppColors.hospitalAppointmentDateBoxColor,
          ),
        ],
      ),
    );
  }
}

// Builds the Bottom Navigation Bar as a dedicated class
class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          label: 'Report',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: 'Notifications',
        ),
      ],
      selectedFontSize: 14,
      currentIndex: selectedIndex,
      selectedItemColor: AppColors.hospitalPrimary,
      unselectedItemColor: AppColors.hospitalTextSecondary,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.hospitalWhite,
      elevation: 2.0,
      onTap: onItemTapped,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

// --- Reusable Custom Widgets (Unchanged as they were already public classes) ---

// A simple reusable widget for section titles
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.hospitalTextPrimary,
      ),
    );
  }
}

// Reusable widget for each icon in the 'Services' section
class ServiceIcon extends StatelessWidget {
  final String icon;
  final Color backgroundColor;
  final Color iconColor;

  const ServiceIcon({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 85,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: SvgPicture.asset(
        icon,
        color: iconColor,
        width: 40,
      )),
    );
  }
}

// Reusable widget for the appointment cards
class AppointmentCard extends StatelessWidget {
  final String date;
  final String day;
  final String time;
  final String doctor;
  final String specialty;
  final Color color;
  final Color textColor;
  final Color dateBoxColor;

  const AppointmentCard({
    Key? key,
    required this.date,
    required this.day,
    required this.time,
    required this.doctor,
    required this.specialty,
    required this.color,
    required this.textColor,
    required this.dateBoxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: dateBoxColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFb2eff1),
                  ),
                ),
                Text(
                  day,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0XFFb2eff1),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: TextStyle(
                      fontSize: 14,
                      color: textColor.withOpacity(0.8),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.more_horiz,
                color: textColor.withOpacity(0.8),
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
