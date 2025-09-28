import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class AudioScreendesign2 extends StatelessWidget {
  const AudioScreendesign2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,  <-- এই লাইনটি রিমুভ করা হয়েছে
      appBar: AppBar(
        toolbarHeight: 70,
        scrolledUnderElevation: 0,
        // backgroundColor: Colors.transparent, <-- এটিও রিমুভ করা হয়েছে
        elevation: 0,
        // AppBar-কে গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড দেওয়ার জন্য flexibleSpace ব্যবহার করা হয়েছে
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gradientStart, AppColors.gradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 18),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText.withOpacity(0.8),
            size: 28,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: AppColors.primaryBlue,
              size: 28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.572,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                BookCover(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  img: AppsImages.music_bg,
                ),
                SizedBox(height: screenHeight * 0.03),
                const BookTitleAndAuthor(),
                SizedBox(height: screenHeight * 0.02),
                const ProgressBar(),
                SizedBox(height: screenHeight * 0.035),
                const ContinueButton(),
                SizedBox(height: screenHeight * 0.04),
                const BookStats(),
                SizedBox(height: screenHeight * 0.04),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 24),
                  child: const OverViewSection(),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back,
            color: AppColors.primaryText.withOpacity(0.8),
            size: 28,
          ),
          const Icon(Icons.favorite, color: AppColors.primaryBlue, size: 28),
        ],
      ),
    );
  }
}

class BookCover extends StatelessWidget {
  const BookCover({
    required this.screenWidth,
    required this.img,
    required this.screenHeight,
  });
  final double screenWidth;
  final double screenHeight;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.5,
      height: screenHeight * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(img, fit: BoxFit.cover),
      ),
    );
  }
}

class BookTitleAndAuthor extends StatelessWidget {
  const BookTitleAndAuthor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const Text(
            'A Teaspoon of Earth and Sea',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23.5,
              fontFamily: 'serif',
              fontWeight: FontWeight.w700,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'by Dina Nayeri',
            style: TextStyle(fontSize: 14, color: AppColors.secondaryText2),
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: LinearProgressIndicator(
                value: .4,
                minHeight: 6,
                borderRadius: BorderRadius.circular(20),
                backgroundColor: AppColors.progressBackground,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryBlue,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '24%',
            style: TextStyle(fontSize: 12, color: AppColors.secondaryText2),
          ),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
          minimumSize: const Size(double.infinity, 56), // সম্পূর্ণ প্রস্থ জুড়ে
          elevation: 5,
          shadowColor: AppColors.primaryBlue.withOpacity(0.2),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Continue listening',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.headphones, color: Colors.white, size: 26),
          ],
        ),
      ),
    );
  }
}

class BookStats extends StatelessWidget {
  const BookStats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 28, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatItem(
            value: '4.7',
            label: 'Rating',

            icon: Icons.star,
            iconColor: AppColors.starYellow,
          ),
          StatItem(label: 'Language', value: 'English'),
          StatItem(label: 'Audio', value: '2h 49m'),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  const StatItem({
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.lightText),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(width: 10),
            if (icon != null) ...[
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 4),
            ],
          ],
        ),
      ],
    );
  }
}

class OverViewSection extends StatefulWidget {
  const OverViewSection({super.key});

  @override
  State<OverViewSection> createState() => _OverViewSectionState();
}

class _OverViewSectionState extends State<OverViewSection> {
  bool _isExpanded = false;

  static const String text =
      'Due to an unexpected ally, Valadin and his friends managed to escape. '
      'Not only that, they also waged a battle in the Temple City. '
      'On the other hand, Vrey discovered the reason behind Reuven\'s abandonment '
      'his father a dozen years ago. But, the answer she found actually incised a deeper wound '
      'Not only that, they also waged a battle in the Temple City. '
      'On the other hand, Vrey discovered the reason behind Reuven\'s abandonment '
      'his father a dozen years ago. But, the answer she found actually incised a deeper wound '
      'and made his feelings even more broken. The war started by Valadin and his friends...';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryText2,
          ),
        ),
        const SizedBox(height: 10),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState:
              _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,

          // 🔹 Collapsed Version
          firstChild: SizedBox(
            height: 120,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded; // টগল হবে
                    });
                  },
                  child:
                      _isExpanded
                          ? Text(
                            text,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryText,
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            text,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryText,
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                          ),
                ),

                // 🔹 Fade effect at bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0), // উপরে ট্রান্সপারেন্ট
                          Colors.white.withOpacity(0.9), // নিচে সাদা fade
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Expanded Version
          secondChild: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryText,
            ),
            textAlign: TextAlign.left,
          ),
        ),

        const SizedBox(height: 8),

        // 🔹 Show More Button
      ],
    );
  }
}
