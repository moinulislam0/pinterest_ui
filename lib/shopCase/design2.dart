import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinterest_ui/core/images.dart';
import 'package:pinterest_ui/shopCase/design1.dart';

// Color constants extracted from the image
class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color primaryRed = Color(0xFFE94444);
  static const Color primaryText = Color(0xFF212121);
  static const Color secondaryText = Color(0xFF757575);
  static const Color tertiaryText = Color.fromARGB(255, 112, 112, 112);
  static const Color borderColor = Color(0XFFf4f4f4);
  static const Color discountBg = Color(0xFFFFF0F0);
  static const Color starColor = Color(0xFFFFA000);
}

// The main screen widget that holds all the UI components
class shopCaseDesign2 extends StatefulWidget {
  const shopCaseDesign2({Key? key}) : super(key: key);

  @override
  State<shopCaseDesign2> createState() => _shopCaseDesign2State();
}

class _shopCaseDesign2State extends State<shopCaseDesign2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> categories = [
    {'icon': AppsImages.shoe, 'label': 'Shoes'},
    {'icon': AppsImages.watch, 'label': 'Watches'},
    {'icon': AppsImages.bag, 'label': 'Bags'},
    {'icon': AppsImages.bag, 'label': 'Beauty'},
    {'icon': AppsImages.clo, 'label': 'Clothing'},
    {'icon': AppsImages.hand, 'label': 'Lifestyle'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        title: const CustomAppBar(),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                toolbarHeight: 0,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  labelColor: AppColors.primaryRed,
                  unselectedLabelColor: AppColors.secondaryText,
                  indicatorColor: AppColors.primaryRed,
                  indicatorWeight: 2.8,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: AppColors.borderColor,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  tabs: const [
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text('Popular'),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Latest'),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Best Sellers'),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Popular'),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Price'),
                            SizedBox(width: 4),
                            Icon(Icons.expand_more, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: 15),
              // Horizontal Category List
              Padding(
                padding: const EdgeInsets.only(left: 28),
                // CHANGED: Using the new public CategoryList widget
                child: CategoryList(
                  categories: categories,
                  selectedIndex: _selectedCategoryIndex,
                  onCategoryTap: (index) {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                ),
              ),
              // Product Grid
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SizedBox(
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

// NEW PUBLIC WIDGET: Formerly _buildCategoryList()
class CategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final int selectedIndex;
  final Function(int) onCategoryTap; // Callback to handle state changes

  const CategoryList({
    Key? key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onCategoryTap(index), // Use the callback
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : 24, // Adjusted padding for first item
                right: index == categories.length - 1 ? 16 : 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    category['icon'] as String,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? AppColors.primaryRed
                          : AppColors.secondaryText,
                      BlendMode.srcIn,
                    ),
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['label'] as String,
                    style: TextStyle(
                      color:
                          isSelected
                              ? AppColors.primaryRed
                              : AppColors.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// CustomAppBar widget
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 90, 90, 90),
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 204, 204, 204),
                  width: 1.4,
                ),
              ),
              child: const Center(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(Icons.search, color: AppColors.tertiaryText),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What are you looking for?',
                          hintStyle: TextStyle(
                            color: AppColors.tertiaryText,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list,
              color: AppColors.primaryRed,
              weight: 10,
              fill: 1,
            ),
            label: const Text(
              'Filter',
              style: TextStyle(
                color: Color.fromARGB(255, 245, 102, 102),
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primaryRed, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
