import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

// The main screen widget - CONVERTED TO STATEFULWIDGET
class DiscoveryScreen2 extends StatefulWidget {
  const DiscoveryScreen2({super.key});

  @override
  State<DiscoveryScreen2> createState() => _DiscoveryScreen2State();
}

class _DiscoveryScreen2State extends State<DiscoveryScreen2> {
  // State variable to track the selected tab index
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 105,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 95,
        leading: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: IconButton(
            // IconButton-এর নিজস্ব প্যাডিং সরিয়ে দেওয়া হয়েছে
            padding: EdgeInsets.zero,
            icon: Container(
              // padding এর পরিবর্তে width এবং height দিয়ে সাইজ কন্ট্রোল করা হয়েছে
              width: 50, // আপনার প্রয়োজন অনুযায়ী সাইজ পরিবর্তন করতে পারেন
              height: 50, // আপনার প্রয়োজন অনুযায়ী সাইজ পরিবর্তন করতে পারেন
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 248, 245, 245),
                  width: 2.5,
                ),
              ),
              // কন্টেইনারের ভেতরে Icon টি নিজে থেকেই মাঝখানে থাকবে
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: AppColors.primaryText,
              ),
            ),
            onPressed: () {},
          ),
        ),
        title: const Text(
          'Detail Books',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText11,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Container(decoration: BoxDecoration())),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    _buildBookCover(),
                    const SizedBox(height: 20),
                    _buildBookInfo(),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: _buildStats(),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: _buildSynopsisSection(),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: _buildBottomActionBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCover() {
    return Container(
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(
              255,
              230,
              219,
              162,
            ).withValues(alpha: .5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(AppsImages.book, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildBookInfo() {
    return const Column(
      children: [
        Text(
          'Cinta Satu Kompleks',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'TheSkyscraper',
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 116, 115, 115),
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatItem(Icons.remove_red_eye_outlined, '1.6M', "Reads"),
          _buildStatItem(Icons.star_outline, '24.7K', 'Votes'),
          _buildStatItem(Icons.list_alt_outlined, '24', 'Parts'),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String text1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.iconColor, size: 22),
            const SizedBox(width: 5),
            Text(
              text1,
              style: const TextStyle(
                color: Color.fromARGB(255, 156, 152, 152),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSynopsisSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ======== পরিবর্তিত অংশ ========
              _buildTab(
                title: 'Synopsis',
                isSelected: _selectedTabIndex == 0,
                text1: "",
                left: "",
                right: "",
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 0;
                  });
                },
              ),
              const SizedBox(width: 20),
              _buildTab(
                title: 'Table of Content',
                left: "(",
                right: ")",
                text1: "24",
                isSelected: _selectedTabIndex == 1,
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 1;
                  });
                },
              ),
              // ============================
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              const Text(
                'Ini tentang Moza dan ketiga cowok yang tinggal satu kompleks dengannya. Ada Eghi, cowok yang Moza sukai. Lalu Dennis, cowok yang menyukai Moza. Juga Ferrish, cowok tukang rusuh. Hidup Moza begitu penuh warna dan kesialan karena ketiganya.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryText,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Jadi, di antara mereka bertiga, siapa yang dapat membuat Moza jatuh cinta?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryText,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildTag('school'),
              _buildTag('humor'),
              _buildTag('benci'),
              _buildTag('love'),
              _buildTag('10+'),
            ],
          ),
        ],
      ),
    );
  }

  // ======== পরিবর্তিত _buildTab ফাংশন ========
  // ======== পরিবর্তিত ও সঠিক _buildTab ফাংশন ========
  Widget _buildTab({
    required String title,
    text1,
    left,
    right,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      // Column-টিকে IntrinsicWidth দিয়ে wrap করা হয়েছে
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
                Text(
                  left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
                Text(
                  text1,
                  style: const TextStyle(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            if (isSelected)
              Container(
                height: 3,
                // এখন IntrinsicWidth এর কারণে এই কন্টেইনারটি সঠিক প্রস্থ পাবে
                color: AppColors.primaryBlue,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: AppColors.secondaryText, fontSize: 12),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.lightGrey, width: 2.5),
              ),
              child: const Icon(
                Icons.bookmark_border,
                color: AppColors.iconColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu_book,
                  color: Colors.white,
                  size: 28,
                ),
                label: const Text(
                  'Start Reading',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 236, 233, 233),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
