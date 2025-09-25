import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        "Let's Discover",
        style: TextStyle(
          fontSize: 28.0,
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
              const Text(
                'Categories',
                style: TextStyle(
                  color: Color.fromARGB(255, 128, 125, 125),
                  fontSize: 16.0,
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
            spacing: 8.0,

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
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color:
              isActive
                  ? AppColors.activeCategoryBackground
                  : AppColors.inactiveCategoryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // শর্ত অনুযায়ী আইকনের ব্যাকগ্রাউন্ড কালার পরিবর্তন
                color:
                    isActive
                        ? Colors.white
                        : const Color.fromARGB(
                          255,
                          107,
                          107,
                          107,
                        ).withOpacity(0.1),
              ),
              child: Icon(
                icon,
                size: 15.0,
                color:
                    isActive
                        ? AppColors.inactiveCategoryicon
                        : AppColors.inactiveCategoryText,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: TextStyle(
                color:
                    isActive
                        ? AppColors.activeCategoryText
                        : AppColors.inactiveCategoryText,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable widget for the horizontally scrolling book covers.
class BookCarousel extends StatefulWidget {
  const BookCarousel({Key? key}) : super(key: key);

  @override
  State<BookCarousel> createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  int _selectedIndex = 0;

  void _onBookTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: BookCover(
                  isSelected: _selectedIndex == 0,
                  onTap: () => _onBookTap(0),
                ),
              ),
              const SizedBox(width: 16),
              BookCover(
                isSelected: _selectedIndex == 1,
                onTap: () => _onBookTap(1),
              ),
              const SizedBox(width: 16),
              BookCover(
                isSelected: _selectedIndex == 2,
                onTap: () => _onBookTap(2),
              ),
              const SizedBox(width: 16),
              BookCover(
                isSelected: _selectedIndex == 3,
                onTap: () => _onBookTap(3),
              ),
              const SizedBox(width: 16),
              BookCover(
                isSelected: _selectedIndex == 4,
                onTap: () => _onBookTap(4),
              ),
              const SizedBox(width: 16),
              BookCover(
                isSelected: _selectedIndex == 5,
                onTap: () => _onBookTap(5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookCover extends StatelessWidget {
  // isNumbered প্যারামিটারটি আর প্রয়োজন নেই, তাই সরিয়ে দেওয়া হয়েছে
  final bool isSelected;
  final VoidCallback onTap;

  const BookCover({Key? key, required this.isSelected, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 130,
            height: isSelected ? 210 : 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[300],
              boxShadow:
                  isSelected
                      ? [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            223,
                            166,
                            166,
                          ).withOpacity(0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                      : [],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage(AppsImages.con_man),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // শর্তটি পরিবর্তন করা হয়েছে: শুধু isSelected হলেই ব্যাজ দেখা যাবে
          if (isSelected)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.numberBadgeBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '#1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
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
      padding: const EdgeInsets.only(left: 24),
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

    _tapRecognizer =
        TapGestureRecognizer()
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
