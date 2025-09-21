import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/icons.dart';

class Design1 extends StatelessWidget {
  const Design1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Text(
                'Tugas Hari Ini',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            // Task List Section
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  TaskCard(
                    subject: 'MTK',
                    icon: AppIcons.homeIconss, // Placeholder icon
                    iconBackgroundColor: AppColors.mtkIconBackground,
                    iconForegroundColor: AppColors.mtkIconForeground,
                    chapter: 'Bab 4',
                    description:
                        'Kerjakan 5 soal essay di halaman 52 buku paket',
                    dueDate: 'Dikumpulkan pukul 10:00',
                  ),
                  SizedBox(height: 16),
                  TaskCard(
                    subject: 'Olahraga',
                    icon: AppIcons.homeIconss, // Placeholder icon
                    iconBackgroundColor: AppColors.olahragaIconBackground,
                    iconForegroundColor: AppColors.olahragaIconForeground,
                    chapter: 'Bab 3',
                    description:
                        'Buat rangkuman bab 3 di google docs\nbuat kesimpulan dari materi di bab 3',
                    dueDate: 'Dikumpulkan pukul 16:30',
                  ),
                  SizedBox(height: 16),
                  TaskCard(
                    subject: 'Kimia',
                    icon: AppIcons.homeIconss, // Placeholder icon
                    iconBackgroundColor: AppColors.kimiaIconBackground,
                    iconForegroundColor: AppColors.kimiaIconForeground,
                    chapter: 'Bab 5',
                    description:
                        'Definisikan zat yang terkandung dalam\nbesi, buat di google docs',
                    dueDate: 'Dikumpulkan pukul 10:00',
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

/// A reusable card widget for displaying a single task.
class TaskCard extends StatelessWidget {
  final String subject;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconForegroundColor;
  final String chapter;
  final String description;
  final String dueDate;

  const TaskCard({
    super.key,
    required this.subject,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconForegroundColor,
    required this.chapter,
    required this.description,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.d1CardbgColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: iconForegroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(icon, color: Colors.white, size: 20.0),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                subject,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            chapter,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dueDate,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.secondaryText,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  foregroundColor: AppColors.buttonText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Detail',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  static const List<Map<String, dynamic>> _navBarItems = [
    {'icon': AppIcons.homeIconss, 'label': 'Home'},
    {'icon': AppIcons.homeIconss, 'label': 'Tugas'},
    {'icon': AppIcons.homeIconss, 'label': 'Jadwal'},
    {'icon': AppIcons.homeIconss, 'label': 'Profile'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        color: AppColors.buttonText,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navBarItems.length, (index) {
          final item = _navBarItems[index];
          final bool isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () => _onItemTapped(index),

            behavior: HitTestBehavior.translucent,
            child:
                isSelected
                    ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.buttonBackground.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(item['icon'], color: AppColors.navBarSelected),
                          const SizedBox(width: 8),
                          Text(
                            item['label'],
                            style: const TextStyle(
                              color: AppColors.navBarSelected,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        item['icon'],
                        color: AppColors.navBarUnselected,
                        size: 28,
                      ),
                    ),
          );
        }),
      ),
    );
  }
}

/// A single item for the custom bottom navigation bar.
class NavItem extends StatelessWidget {
  final IconData icon;

  const NavItem({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: AppColors.navBarUnselected, size: 28),
      onPressed: () {},
    );
  }
}
