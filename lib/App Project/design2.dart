import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class AppProjectDesign2 extends StatefulWidget {
  const AppProjectDesign2({super.key});

  @override
  State<AppProjectDesign2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AppProjectDesign2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 244),
      appBar: AppBar(
        scrolledUnderElevation: 0,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50.0, // একটি নির্দিষ্ট चौड़ाई দিন
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppsImages.appLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Jakob',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Wrap(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 228),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: AppColors.primaryText,
                    size: 28,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 228),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.message,
                    color: AppColors.primaryText,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: const CustomSearchBar(),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: const PromoBanner(),
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: const QuickActions(),
            ),
            const SizedBox(height: 40),

            const CategoriesSection(),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SectionHeader(
                title: 'Tools You may need',
                subtitle: 'All categories of tools Are Here',
                onSeeAll: () {},
                color: Colors.green,
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for tools',
        hintStyle: TextStyle(color: AppColors.secondaryText),
   
        suffixIcon: Icon(Icons.search, color: AppColors.secondaryText),
        filled: true,
        fillColor: const Color.fromARGB(255, 226, 226, 228),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}

// "Get Your Needed Tool" ব্যানার।
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      padding: const EdgeInsets.only(left: 24, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColors.primaryGreen, AppColors.darkGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // প্রথম Row, যেখানে বামে টেক্সট এবং ডানে ছবি থাকবে।
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // বাম পাশের টেক্সটগুলো।
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'GET YOUR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      'Needed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tool',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // ডান পাশের ছবি।
              Image.asset(AppsImages.con_mac, width: 180, fit: BoxFit.contain),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // ডটগুলোকে মাঝখানে আনার জন্য।
            children: List.generate(5, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                width: index == 1 ? 16 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(index == 1 ? 1 : 0.5),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        QuickActionItem(
          iconData: Icons.article_outlined,
          label: 'Newsfeed',
          color: Color(0xFFF2994A),
        ),
        QuickActionItem(
          iconData: Icons.dashboard_customize_outlined,
          label: 'Dashboard',
          color: Color(0xFFEB5757),
        ),
        QuickActionItem(
          iconData: Icons.construction, // একটি উপযুক্ত আইকন
          label: 'My Tools',
          color: AppColors.primaryGreen,
        ),
        QuickActionItem(
          iconData: Icons.monetization_on_outlined,
          label: 'Earnings',
          color: Color(0xFF2F80ED),
        ),
      ],
    );
  }
}

// প্রতিটি দ্রুত অ্যাক্সেস আইটেম।
class QuickActionItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color color;

  const QuickActionItem({
    super.key,
    required this.iconData,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(iconData, color: color, size: 28),
        ),
        const SizedBox(height: 18),
        Text(label, style: TextStyle(color: AppColors.secondaryText)),
      ],
    );
  }
}

// ক্যাটাগরি সেকশন।
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Categories',
          subtitle: 'All categories of tools',
          onSeeAll: () {},
          color: Colors.orange,
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Carpenter', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Welder', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Mechanic', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
                SizedBox(width: 20),
                CategoryCard(label: 'Plumber', imageUrl: AppsImages.con_man),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String imageUrl;

  const CategoryCard({super.key, required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(imageUrl, fit: BoxFit.contain)),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(color: AppColors.primaryText),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ToolsSection extends StatelessWidget {
  const ToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Tools you may need',
          subtitle: '',
          onSeeAll: () {},
          color: Colors.green,
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onSeeAll;
  final Color color;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    required this.onSeeAll,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (subtitle != null && subtitle!.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              width: 12,
              height: 40,
              margin: const EdgeInsets.only(right: 12),
            ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8),
              if (subtitle != null && subtitle!.isNotEmpty)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),
            ],
          ),
          const Spacer(),

          Container(
            height: 35,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onSeeAll,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'See all',
                    style: TextStyle(
                      color: AppColors.accentOrange,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.accentOrange,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// নতুন StatelessWidget ক্লাস
class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.secondaryText,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        // প্রতিটি আইটেমের জন্য icon এবং activeIcon আলাদাভাবে দেওয়া হয়েছে
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home), // সাধারণ অবস্থায় শুধু আইকন
          activeIcon: Column(
            // নির্বাচিত অবস্থায় আইকন এবং নিচে একটি লাইন
            mainAxisSize:
                MainAxisSize
                    .min, // Column কে যতটুকু দরকার ততটুকু জায়গা নিতে বলা হয়েছে
            children: [
              Icon(Icons.home),
              SizedBox(height: 4),
              Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Grid',
          icon: Icon(Icons.grid_view),
          activeIcon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.grid_view),
              SizedBox(height: 4),
              Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search),
          activeIcon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search),
              SizedBox(height: 4),
              Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Chat',
          icon: Icon(Icons.chat_bubble_outline),
          activeIcon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chat_bubble_outline),
              SizedBox(height: 4),
              Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person_outline),
          activeIcon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_outline),
              SizedBox(height: 4),
              Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
