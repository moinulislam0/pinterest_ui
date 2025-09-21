import 'package:flutter/material.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/icons.dart';
import 'package:pinterest_ui/core/images.dart';

class Design2 extends StatelessWidget {
  const Design2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonText,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, bottom: 13),
                child: HeaderSection(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 13),
                child: AttendanceSection(),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: SectionTitle(title: 'Jadwal Pelajaran'),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 10, bottom: 13),
                child: SubjectsGrid(),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 13),
                child: SectionTitle(title: 'Pekerjaan Rumah', showArrow: true),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: HomeworkSection(),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(),
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
                  fit:
                      BoxFit
                          .cover, // Optional: ensures image fills space properly
                ),
              ),
            ),
            const SizedBox(width: 18),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ryan Azhari',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '07110661',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: AppColors.secondaryText),
          onPressed: () {},
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
        const Text(
          'Absen kehadiran hari ini',
          style: TextStyle(fontSize: 14, color: AppColors.secondaryText),
        ),
        const SizedBox(height: 13),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Pin Code',
                  style: TextStyle(
                    color: AppColors.buttonText,
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
                border: Border.all(color: AppColors.buttonBackground, width: 2),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.qr_code_scanner,
                  color: AppColors.secondaryText,
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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        if (showArrow)
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.secondaryText,
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
      },
      {
        'label': 'B.Indo',
        'icon': Icons.menu_book_outlined,
        'color': AppColors.bindoBg,
      },
      {
        'label': 'B.Inggris',
        'icon': Icons.translate_outlined,
        'color': AppColors.binggrisBg,
      },
      {
        'label': 'Fisika',
        'icon': Icons.science_outlined,
        'color': AppColors.fisikaBg,
      },
      {
        'label': 'Kimia',
        'icon': Icons.biotech_outlined,
        'color': AppColors.kimiaBg,
      },
      {
        'label': 'Biologi',
        'icon': Icons.eco_outlined,
        'color': AppColors.biologiBg,
      },
      {
        'label': 'Olahraga',
        'icon': Icons.sports_basketball_outlined,
        'color': AppColors.olahragaBg,
      },
      {
        'label': 'Agama',
        'icon': Icons.mosque_outlined,
        'color': AppColors.agamaBg,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.79,
      ),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return SubjectIcon(
          label: subject['label'] as String,
          icon: subject['icon'] as IconData,
          color: subject['color'] as Color,
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
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeworkCard(
            subject: 'Agama',
            description: 'Mencari Riwayat\nSaling Menghargai',
            icon: Icons.mosque_outlined,
            iconColor: Colors.yellow.shade800,
            bgColor: AppColors.agamaBg,
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
  final Color color;
  const SubjectIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: AppColors.primaryText, size: 28),
        ),
        const SizedBox(height: 15),
        Text(
          label,
          style: const TextStyle(fontSize: 15, color: AppColors.secondaryText),
        ),
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
      width: 230,
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
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, size: 25, color: iconColor),
              ),
              const SizedBox(width: 18),
              Text(
                subject,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

//---------------- Bottom Nav ----------------//
