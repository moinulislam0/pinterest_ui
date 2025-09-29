import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinterest_ui/core/images.dart';

// --- Color Constants ---
const Color kBackgroundColor = Color(0xFFFFFFFF);
const Color kPrimaryRedColor = Color(0xFFE53935);
const Color kLightGreyColor = Color(0xFFF5F5F5);
const Color kSearchBarBorderColor = Color(0xFFE0E0E0);
const Color kPrimaryTextColor = Color(0xFF212121);
const Color kSecondaryTextColor = Color(0xFF757575);

// The main screen widget
class shopCaseDesign1 extends StatelessWidget {
  const shopCaseDesign1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const SearchBarSection(), // Using the new public widget class
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 85,
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromARGB(255, 235, 241, 235),
            height: 1.3,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: const [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: PromoBannerSection(), // Using the new public widget class
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: CategoriesSection(), // Using the new public widget class
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: RecommendedSection(), // Using the new public widget class
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Using the new public widget class
    );
  }
}

// Formerly _buildSearchBar()
class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                border: Border.all(color: kSearchBarBorderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(
                    color: kSecondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(Icons.search, color: kSecondaryTextColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.camera_alt_outlined,
            color: Color.fromARGB(255, 73, 73, 73),
            size: 28,
          ),
          const SizedBox(width: 16),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromARGB(255, 73, 73, 73),
                size: 28,
              ),
              Positioned(
                top: -12,
                right: 2,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: kPrimaryRedColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Color.fromARGB(255, 214, 214, 214),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Formerly _buildPromoBanner()
class PromoBannerSection extends StatelessWidget {
  const PromoBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 185,
        decoration: BoxDecoration(
          color: kPrimaryRedColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -142,
              bottom: -222,
              child: Image.asset(
                AppsImages.clothes,
                width: 420,
                height: 640,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.sell, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Best Seller!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "serif",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'Discover the perfect\nshopping journey!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'serif',
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: kPrimaryRedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                  ),
                  child: const Text(
                    'Shop Now!',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Formerly _buildCategoriesSection()
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.category_outlined, color: kPrimaryRedColor, size: 26),
              SizedBox(width: 8),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0XFFf2f2f2), width: 2.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(img: AppsImages.watch, label: 'Watches'),
                    CategoryItem(img: AppsImages.bag, label: 'Bags'),
                    CategoryItem(img: AppsImages.bag, label: 'Beauty'),
                    CategoryItem(img: AppsImages.clo, label: 'Clothing'),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(img: AppsImages.asso, label: 'Accessories'),
                    CategoryItem(img: AppsImages.shoe, label: 'Shoes'),
                    CategoryItem(img: AppsImages.hand, label: 'Lifestyle'),
                    CategoryItem(img: AppsImages.more, label: 'More'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Formerly _buildRecommendedSection()
class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, color: kPrimaryRedColor),
                    SizedBox(width: 8),
                    Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryTextColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  'See more',
                  style: TextStyle(
                    color: kPrimaryRedColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 19),
          SizedBox(
            height: 328,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16.0),
              children: const [
                ProductCard(
                  img: AppsImages.show2,
                  imageUrl: 'https://via.placeholder.com/150',
                  productName: '327 Moonbeam Stone\nPink Women',
                  currentPrice: 'Rp2.137.500',
                  originalPrice: 'Rp2.250.000',
                  discount: '5%',
                  rating: 4.9,
                  soldCount: 56,
                  color: Color.fromARGB(255, 236, 6, 6),
                  icon: Icons.favorite_rounded,
                ),
                SizedBox(width: 18),
                ProductCard(
                  img: AppsImages.show1,
                  icon: Icons.favorite_outline,
                  color: Color.fromARGB(255, 107, 107, 107),
                  imageUrl: 'https://via.placeholder.com/150',
                  productName: '327 Moonbeam Stone\nPink Women',
                  currentPrice: 'Rp2.137.500',
                  originalPrice: 'Rp2.250.000',
                  discount: '5%',
                  rating: 4.9,
                  soldCount: 56,
                ),
                SizedBox(width: 18),
                ProductCard(
                  img: AppsImages.show2,
                  imageUrl: 'https://via.placeholder.com/150',
                  productName: '327 Moonbeam Stone\nPink Women',
                  currentPrice: 'Rp2.137.500',
                  originalPrice: 'Rp2.250.000',
                  discount: '5%',
                  rating: 4.9,
                  soldCount: 56,
                  color: Color.fromARGB(255, 236, 6, 6),
                  icon: Icons.favorite_rounded,
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Formerly _buildBottomNavigationBar()
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300]!, width: 1.0)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: kPrimaryRedColor,
        unselectedItemColor: kSecondaryTextColor,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Formerly _CategoryItem, now a public reusable widget
class CategoryItem extends StatelessWidget {
  final String img;
  final String label;

  const CategoryItem({Key? key, required this.img, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      child: Column(
        children: [
          SvgPicture.asset(img, height: 25),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              color: Color.fromARGB(255, 46, 45, 45),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Public reusable widget for Product Card
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String currentPrice;
  final String originalPrice;
  final String discount;
  final double rating;
  final int soldCount;
  final Color color;
  final IconData icon;
  final String img;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.soldCount,
    required this.color,
    required this.icon,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0XFFf6f6f6), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  color: const Color(0XFFededed),
                  child: Center(child: Image.asset(img)),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'New!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  currentPrice,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEEEEE),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        discount,
                        style: const TextStyle(
                          color: Color(0xFFE53935),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      originalPrice,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: const TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      '•',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$soldCount Sold',
                      style: const TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
