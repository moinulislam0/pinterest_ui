import 'package:flutter/material.dart';
import 'package:pinterest_ui/Hospital%20Management/Hscreen1.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

// মূল স্ক্রিনের উইজেট।
class Hscreen2 extends StatefulWidget {
  const Hscreen2({super.key});

  @override
  State<Hscreen2> createState() => _Hscreen2State();
}

class _Hscreen2State extends State<Hscreen2> {
  int selectedIndex = 1; // Report tab selected by default

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hospitalScreen2Background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: _HeartRateCard(),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: _VitalsRow(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: _buildLatestReportSection(),
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

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.hospitalScreen2Background,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 95,
      title: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text(
          'Report',
          style: TextStyle(
            color: AppColors.hospitalScreen2PrimaryText,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Color.fromARGB(255, 142, 142, 145),
              size: 24,
            ),
            onPressed: () {
              // Click action for the more icon
            },
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  // লেটেস্ট রিপোর্ট সেকশন তৈরির জন্য এই মেথড।
  Widget _buildLatestReportSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lattest Report',
          style: TextStyle(
            color: AppColors.hospitalScreen2PrimaryText,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        // পুনরায় ব্যবহারযোগ্য রিপোর্ট কার্ড উইজেট।
        _ReportFileCard(
          title: 'General Health',
          fileCount: '8 files',
          icon: Icons.description,
          iconBgColor: AppColors.hospitalGeneralHealthIconBg,
          iconColor: AppColors.hospitalGeneralHealthIcon,
        ),
        SizedBox(height: 15),
        _ReportFileCard(
          title: 'Diabetes',
          fileCount: '4 files',
          icon: Icons.description,
          iconBgColor: AppColors.hospitalDiabetesIconBg,
          iconColor: AppColors.hospitalDiabetesIcon,
        ),
      ],
    );
  }
}

// হার্ট রেট কার্ডের জন্য উইজেট।
class _HeartRateCard extends StatelessWidget {
  const _HeartRateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            AppColors.hospitalHeartRateCardStart,
            AppColors.hospitalHeartRateCardEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Heart Rate',
                style: TextStyle(
                  color: AppColors.hospitalScreen2SecondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '96',
                    style: TextStyle(
                      color: AppColors.hospitalScreen2PrimaryText,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'bpm',
                    style: TextStyle(
                      color: AppColors.hospitalScreen2SecondaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Image.asset(
            AppsImages.heartBeat,
            fit: BoxFit.cover,
            width: 150,
          )
        ],
      ),
    );
  }
}

// রক্ত এবং ওজন কার্ডের জন্য উইজেট।
class _VitalsRow extends StatelessWidget {
  const _VitalsRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // পুনরায় ব্যবহারযোগ্য ভাইটাল কার্ড উইজেট।
        SizedBox(
          width: 167,
          child: _VitalCard(
            icon: AppsImages.blood,
            iconColor: AppColors.hospitalBloodIcon,
            title: 'Blood Group',
            value: 'A+',
            backgroundColor: AppColors.hospitalBloodGroupCard,
          ),
        ),
        SizedBox(width: 24),
        SizedBox(
          width: 167,
          child: _VitalCard(
            icon: AppsImages.weight,
            iconColor: AppColors.hospitalWeightIcon,
            title: 'Weight',
            value: '80 kg',
            backgroundColor: AppColors.hospitalWeightCard,
          ),
        ),
      ],
    );
  }
}

// একটি একক ভাইটাল কার্ডের জন্য পুনরায় ব্যবহারযোগ্য উইজেট।
class _VitalCard extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String title;
  final String value;
  final Color backgroundColor;

  const _VitalCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 22, right: 16, top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                icon,
                color: iconColor,
                fit: BoxFit.contain,
                height: 40,
              ),
              const Icon(Icons.more_horiz,
                  color: AppColors.hospitalScreen2SecondaryText, size: 20),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}

// একটি একক রিপোর্ট ফাইলের জন্য পুনরায় ব্যবহারযোগ্য কার্ড।
class _ReportFileCard extends StatelessWidget {
  final String title;
  final String fileCount;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  const _ReportFileCard({
    required this.title,
    required this.fileCount,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.hospitalReportCardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(255, 204, 203, 203)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.hospitalScreen2PrimaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  fileCount,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert,
              size: 24, color: AppColors.hospitalScreen2SecondaryText),
        ],
      ),
    );
  }
}

// হার্টবিট গ্রাফ আঁকার জন্য কাস্টম পেইন্টার।

// Bottom Navigation Bar Widget
