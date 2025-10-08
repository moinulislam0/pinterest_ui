import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/icons.dart';
import 'package:pinterest_ui/core/images.dart';

class Design2 extends StatelessWidget {
  const Design2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 95,
        title: HeaderSection(),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.textGrey1, size: 28.r),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: AppColors.buttonText,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 13),
                child: AttendanceSection(),
              ),
              SizedBox(height: 22),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: SectionTitle(title: 'Jadwal Pelajaran'),
              ),
              SizedBox(height: 4),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 10, bottom: 13),
                child: SubjectsGrid(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 13),
                child: SectionTitle(title: 'Pekerjaan Rumah', showArrow: true),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: HomeworkSection(),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: CustomBottomNavBar()),
    );
  }
}

//---------------- Header ----------------//
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  24,
                ), // Makes outer container circular
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  30,
                ), // Clips the image inside
                child: Image.asset(
                  AppsImages.appLogo,
                  fit: BoxFit
                      .cover, // Optional: ensures image fills space properly
                ),
              ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ryan Azhari',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryMu,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '07110661',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 183, 187, 194),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

//---------------- Attendance ----------------//
class AttendanceSection extends StatelessWidget {
  const AttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'Absen kehadiran hari ini',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 183, 187, 194),
          ),
        ),
        const SizedBox(height: 13),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                autofocus: false,
                onHover: (value) => {false},
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColorMu,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Pin Code',
                  style: TextStyle(
                    color: AppColors.whiteGreyMu,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryColorMu, width: 2),
              ),
              child: IconButton(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: const Icon(
                  Icons.qr_code_scanner,
                  color: AppColors.primaryColorMu,
                ),
                onPressed: () {},
                iconSize: 28,
                padding: const EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//---------------- Section Title ----------------//
class SectionTitle extends StatelessWidget {
  final String title;
  final bool showArrow;
  const SectionTitle({super.key, required this.title, this.showArrow = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryMu,
          ),
        ),
        if (showArrow)
          Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            weight: 10.w,
            color: AppColors.primaryColorMu,
          ),
      ],
    );
  }
}

//---------------- Subjects Grid ----------------//
class SubjectsGrid extends StatelessWidget {
  const SubjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {
        'label': 'MTK',
        'icon': Icons.calculate_outlined,
        'color': AppColors.mtkBg,
        'color1': AppColors.mtkBg1,
      },
      {
        'label': 'B.Indo',
        'icon': Icons.menu_book_outlined,
        'color': AppColors.bindoBg,
        'color1': AppColors.bindoBg1,
      },
      {
        'label': 'B.Inggris',
        'icon': Icons.translate_outlined,
        'color': AppColors.binggrisBg,
        'color1': AppColors.binggrisBg1,
      },
      {
        'label': 'Fisika',
        'icon': Icons.science_outlined,
        'color': AppColors.fisikaBg,
        'color1': AppColors.fisikaBg1,
      },
      {
        'label': 'Kimia',
        'icon': Icons.biotech_outlined,
        'color': AppColors.kimiaBg,
        'color1': AppColors.kimiaBg1,
      },
      {
        'label': 'Biologi',
        'icon': Icons.eco_outlined,
        'color': AppColors.biologiBg,
        'color1': AppColors.biologiBg1,
      },
      {
        'label': 'Olahraga',
        'icon': Icons.sports_basketball_outlined,
        'color': AppColors.olahragaBg,
        'color1': AppColors.olahragaBg1,
      },
      {
        'label': 'Agama',
        'icon': Icons.mosque_outlined,
        'color': AppColors.agamaBg,
        'color1': AppColors.agamaBg1,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 5,
        childAspectRatio: 0.79,
      ),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return SubjectIcon(
          label: subject['label'] as String,
          icon: subject['icon'] as IconData,
          color: subject['color'] as Color,
          color1: subject['color1'] as Color,
        );
      },
    );
  }
}

//---------------- Homework Section ----------------//
class HomeworkSection extends StatelessWidget {
  const HomeworkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const HomeworkCard(
            subject: 'Agama',
            description: 'Mencari Riwayat\nSaling Menghargai',
            icon: Icons.logout_rounded,
            iconColor: Colors.white,
            bgColor: Color(0XFFcdd2a6),
          ),
          const SizedBox(width: 16),
          const HomeworkCard(
            subject: 'Fisika',
            description: 'Menghitung Rumus\nKubus',
            icon: Icons.ac_unit,
            iconColor: Colors.white,
            bgColor: Color(0XFFd0ba9e),
          ),
          const SizedBox(width: 16),
          HomeworkCard(
            subject: 'Fisika',
            description: 'Menghitung Rumus\nKubus',
            icon: Icons.science_outlined,
            iconColor: Colors.orange.shade800,
            bgColor: AppColors.fisikaBg,
          ),
          const SizedBox(width: 16),
          HomeworkCard(
            subject: 'Fisika',
            description: 'Menghitung Rumus\nKubus',
            icon: Icons.science_outlined,
            iconColor: Colors.orange.shade800,
            bgColor: AppColors.fisikaBg,
          ),
          const SizedBox(width: 16),
          HomeworkCard(
            subject: 'Fisika',
            description: 'Menghitung Rumus\nKubus',
            icon: Icons.science_outlined,
            iconColor: Colors.orange.shade800,
            bgColor: AppColors.fisikaBg,
          ),
          const SizedBox(width: 16),
          HomeworkCard(
            subject: 'Fisika',
            description: 'Menghitung Rumus\nKubus',
            icon: Icons.science_outlined,
            iconColor: Colors.orange.shade800,
            bgColor: AppColors.fisikaBg,
          ),
        ],
      ),
    );
  }
}

//---------------- Subject Icon ----------------//
class SubjectIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color, color1;
  const SubjectIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.color1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: color1, size: 24.sp),
        ),
        SizedBox(height: 12.h),
        Text(label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColorMu,
            )),
      ],
    );
  }
}

//---------------- Homework Card ----------------//
class HomeworkCard extends StatelessWidget {
  final String subject;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  const HomeworkCard({
    super.key,
    required this.subject,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      padding: const EdgeInsets.only(left: 22, top: 20),
      decoration: BoxDecoration(
        color: AppColors.d1CardbgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 30.h,
                width: 30.w,
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, size: 15.sp, color: iconColor),
              ),
              SizedBox(width: 14.w),
              Text(
                subject,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColorMu,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryMu,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

//---------------- Bottom Nav ----------------//
