import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: const Header(),
        backgroundColor: AppColors.background,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            // Overall padding for the screen content.
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: .0),
                const CategoriesSection(),
                const SizedBox(height: 24.0),
                const BookCarousel(),
                const SizedBox(height: 24.0),
                const BookDetails(),
              ],
            ),
          ),
        ),
      ),
      // The bottom navigation bar.
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}

// Reusable widget for the top header section.
class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        "Let's Discover",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}

// Reusable widget for the categories section.
class CategoriesSection extends StatefulWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  // কোন ক্যাটাগরিটি সিলেক্ট করা আছে তা ট্র্যাক করার জন্য
  String _selectedCategory = 'Romance';

  // ক্যাটাগরি সিলেক্ট করার জন্য ফাংশন
  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  color: Color.fromARGB(255, 128, 125, 125),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.more_horiz,
                color: AppColors.secondaryText,
                size: 28.0,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 16),
          child: Wrap(
            spacing: 15.sp,
            children: [
              CategoryChip(
                label: 'Romance',
                icon: Icons.favorite,
                isActive: _selectedCategory == 'Romance',
                onTap: () => _selectCategory('Romance'),
              ),
              CategoryChip(
                label: 'Fantasy',
                icon: Icons.auto_awesome,
                isActive: _selectedCategory == 'Fantasy',
                onTap: () => _selectCategory('Fantasy'),
              ),
              CategoryChip(
                label: 'Horror',
                icon: Icons.masks,
                isActive: _selectedCategory == 'Horror',
                onTap: () => _selectCategory('Horror'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryChip(
                  label: 'Comedy',
                  icon: Icons.sentiment_satisfied_alt,
                  isActive: _selectedCategory == 'Comedy',
                  onTap: () => _selectCategory('Comedy'),
                ),
                SizedBox(width: 15),
                CategoryChip(
                  label: 'Adventure',
                  icon: Icons.explore,
                  isActive: _selectedCategory == 'Adventure',
                  onTap: () => _selectCategory('Adventure'),
                ),
                SizedBox(width: 15),
                CategoryChip(
                  label: 'Non-F',
                  icon: Icons.notes,
                  isActive: _selectedCategory == 'Non-F',
                  onTap: () => _selectCategory('Non-F'),
                ),
                CategoryChip(
                  label: 'Non-FF',
                  icon: Icons.notes,
                  isActive: _selectedCategory == 'Non-FF',
                  onTap: () => _selectCategory('Non-FF'),
                ),
                CategoryChip(
                  label: 'Non-F1',
                  icon: Icons.notes,
                  isActive: _selectedCategory == 'Non-F1',
                  onTap: () => _selectCategory('Non-F1'),
                ),
                // নিচের গুলোকে আলাদা করার জন্য লেবেল পরিবর্তন করতে পারেন
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Custom widget for the category selection chips.
class CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap; // ক্লিকের জন্য কলব্যাক ফাংশন

  const CategoryChip({
    Key? key,
    required this.label,
    required this.icon,
    this.isActive = false,
    required this.onTap, // কনস্ট্রাক্টরে যোগ করা হয়েছে
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ক্লিকের জন্য GestureDetector ব্যবহার করা হয়েছে
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 8.r),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.activeCategoryBackground
              : AppColors.inactiveCategoryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // শর্ত অনুযায়ী আইকনের ব্যাকগ্রাউন্ড কালার পরিবর্তন
                color: isActive
                    ? Colors.white
                    : const Color(0xFF6B6B6B).withOpacity(0.1),
              ),
              child: Icon(
                icon,
                size: 15.sp,
                color: isActive
                    ? AppColors.inactiveCategoryicon
                    : AppColors.inactiveCategoryText,
              ),
            ),
            const SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                label,
                style: TextStyle(
                  color: isActive
                      ? AppColors.whiteGreyMu
                      : AppColors.inactiveCategoryText,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(width: 4.w),
          ],
        ),
      ),
    );
  }
}

// Reusable widget for the book carousel section.
class BookCarousel extends StatefulWidget {
  final int initialIndex;

  const BookCarousel({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BookCarousel> createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  final double _kItemWidth = 150.0;
  final double _kHorizontalPadding = 8.0;
  late PageController _pageController;
  late int _selectedIndex;

  // === পরিবর্তন ১: এখানে ছবির একটি তালিকা তৈরি করুন ===
  final List<String> _bookImages = [
    AppsImages.book,
    AppsImages.clothes,
    AppsImages.doctor,
    AppsImages.book,
    AppsImages.book,
    AppsImages.doctor,
    // আপনার প্রয়োজন অনুযায়ী আরও ছবি যোগ করুন
  ];
  // =================================================

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(
      initialPage: _selectedIndex,
      viewportFraction: 0.5,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double itemWidthWithPadding = _kItemWidth + (_kHorizontalPadding * 2);
    final double newViewportFraction = itemWidthWithPadding / screenWidth;

    if (_pageController.viewportFraction != newViewportFraction) {
      _pageController = PageController(
        initialPage: _selectedIndex,
        viewportFraction: newViewportFraction,
      );
    }

    return SizedBox(
      height: 220,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: _pageController,
        // === পরিবর্তন ২: itemCount এখন তালিকার দৈর্ঘ্যের উপর নির্ভর করবে ===
        itemCount: _bookImages.length,
        // ============================================================
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double pageOffset = 0;
              if (_pageController.position.haveDimensions) {
                pageOffset = (_pageController.page ?? 0) - index;
              }

              final double scale =
                  (1.0 - (pageOffset.abs() * 0.15)).clamp(0.85, 1.0);
              final double translateY = pageOffset.abs() * 30.0;

              return Transform.translate(
                offset: Offset(0, translateY),
                child: Transform.scale(
                  scale: scale,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _kHorizontalPadding),
                    child: BookCover(
                      // === পরিবর্তন ৩: তালিকা থেকে নির্দিষ্ট index-এর ছবিটি পাস করুন ===
                      images: _bookImages[index],
                      // ==============================================================
                      isSelected: _selectedIndex == index,
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// A simplified display widget for the example
class BookCover extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String images;

  const BookCover({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _kItemWidth = 150.0;
    // const double _kHorizontalPadding = 8.0; // এই লাইনটির আর প্রয়োজন নেই
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _kItemWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.blue.shade400 : Colors.grey.shade400,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        // === পরিবর্তন এখানে করা হয়েছে ===
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              12), // কন্টেইনারের সাথে মিলিয়ে রাউন্ডেড কর্নার
          child: Image.asset(
            images, // আপনার AppImages.doctor ভেরিয়েবলটি এখানে ব্যবহার করুন
            fit: BoxFit.cover, // ইমেজটি যেন পুরো কন্টেইনার জুড়ে থাকে
          ),
        ),
        // ============================
      ),
    );
  }
}

// Reusable widget for the book details section below the carousel.
class BookDetails extends StatelessWidget {
  const BookDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          const Text(
            'Cinta Satu Kompleks',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'TheSkyscraper',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 126, 123, 123),
            ),
          ),
          const SizedBox(height: 10.0),
          const BookStats(),
          const SizedBox(height: 20.0),
          const BookDescription(),
          const SizedBox(height: 30.0),
          const TagSection(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

// Widget for displaying book statistics (views, stars, chapters).
class BookStats extends StatelessWidget {
  const BookStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatItem(icon: Icons.visibility_outlined, value: '1.6M'),
        const SizedBox(width: 16.0),
        StatItem(icon: Icons.star_outline, value: '24.7K'),
        const SizedBox(width: 16.0),
        StatItem(icon: Icons.format_list_bulleted, value: '24'),
      ],
    );
  }
}

// A single stat item used in the BookStats widget.
class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const StatItem({Key? key, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color.fromARGB(255, 167, 159, 159), size: 20.0),
        const SizedBox(width: 4.0),
        Text(
          value,
          style: const TextStyle(
            color: Color.fromARGB(255, 126, 123, 123),
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

// Widget for the book's description with a "See More" link.

class BookDescription extends StatefulWidget {
  const BookDescription({Key? key}) : super(key: key);

  @override
  State<BookDescription> createState() => _BookDescriptionState();
}

class _BookDescriptionState extends State<BookDescription> {
  // টেক্সটটি expanded নাকি collapsed, তার অবস্থা ট্র্যাক করার জন্য
  bool _isExpanded = false;

  // সম্পূর্ণ টেক্সট এবং সংক্ষিপ্ত টেক্সট
  final String fullText =
      'Ini tentang Moza dan ketiga cowok yang tinggal satu kompleks dengannya. Ada Eghi, cowok yang Moza sukai. Lalu Dennis, cowok yang menyukai Moza. Juga Ferrish, cowok tukang rusuh. Hidup Moza begitu penuh warna dan kejutan tak terduga yang membuatnya belajar banyak hal baru dalam perjalanan remajanya.';
  final String shortText =
      'Ini tentang Moza dan ketiga cowok yang tinggal satu kompleks dengannya. Ada Eghi, cowok yang Moza sukai. Lalu Dennis, cowok yang menyukai Moza. Juga Ferrish, cowok tukang rusuh. Hidup Moza begitu penuh warna dan ke ...';

  late final TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();

    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      };
  }

  @override
  void dispose() {
    // মেমোরি লিক এড়ানোর জন্য recognizer dispose করা হয়েছে
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.secondaryText,
          height: 1.5, // Line spacing.
        ),
        children: [
          // _isExpanded-এর উপর ভিত্তি করে টেক্সট দেখানো হচ্ছে
          TextSpan(
            text: _isExpanded ? fullText : shortText,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 97, 92, 92),
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          // _isExpanded-এর উপর ভিত্তি করে লিঙ্কের লেখা পরিবর্তন হচ্ছে
          TextSpan(
            text: _isExpanded ? ' See Less' : ' See More',
            style: const TextStyle(
              color: AppColors.seeMoreText,
              fontWeight: FontWeight.w500,
            ),
            // TextSpan-কে ক্লিকযোগ্য করার জন্য recognizer যোগ করা হয়েছে
            recognizer: _tapRecognizer,
          ),
        ],
      ),
    );
  }
}

// Widget for the section of tags related to the book.
class TagSection extends StatelessWidget {
  const TagSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        TagChip(label: 'school'),
        TagChip(label: 'humor'),
        TagChip(label: 'benci'),
        TagChip(label: 'love'),
        TagChip(label: '10+'),
      ],
    );
  }
}

// A simple chip widget for displaying tags.
class TagChip extends StatelessWidget {
  final String label;
  const TagChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.inactiveCategoryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color.fromARGB(255, 49, 48, 48),
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// The bottom navigation bar for the app.
class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  // কোন আইটেমটি সিলেক্ট করা আছে, তার ইনডেক্স ট্র্যাক করার জন্য
  int _selectedIndex = 0;

  // আইটেমে ট্যাপ করলে এই ফাংশনটি কল হবে
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // সিলেক্টেড ইনডেক্স আপডেট করা হচ্ছে
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // currentIndex এখন স্টেট ভ্যারিয়েবলের সাথে যুক্ত
      currentIndex: _selectedIndex,
      // onTap ফাংশনটি যোগ করা হয়েছে
      onTap: _onItemTapped,
      backgroundColor: AppColors.background,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.activeNavIcon,
      unselectedItemColor: AppColors.inactiveNavIcon,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
