// অ্যাপে ব্যবহৃত সমস্ত কালার এখানে define করা হয়েছে।
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinterest_ui/core/images.dart';
import 'package:pinterest_ui/core/colors.dart';

class shopCaseDesign3 extends StatefulWidget {
  const shopCaseDesign3({Key? key}) : super(key: key);

  @override
  shopCaseDesign3State createState() => shopCaseDesign3State();
}

class shopCaseDesign3State extends State<shopCaseDesign3> {
  // state ম্যানেজ করার জন্য ভ্যারিয়েবল (এখন public)
  int selectedImageIndex = 0;
  int selectedSizeIndex = 2; // ডিফল্টভাবে 'EU 37.5' সিলেক্টেড
  int quantity = 1;

  // ডেমো ডেটা
  final List<String> productImages = [
    AppsImages.show1,
    AppsImages.show2,
    AppsImages.show1,
  ];
  final List<String> productSizes = ['EU 36.5', 'EU 37', 'EU 37.5', 'EU 38'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProductAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCarousel(
                productImages: productImages,
                selectedImageIndex: selectedImageIndex,
                onImageSelected: (index) {
                  setState(() {
                    selectedImageIndex = index;
                  });
                },
              ),
              ProductInfoSection(
                quantity: quantity,
                onIncrement: () {
                  setState(() => quantity++);
                },
                onDecrement: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
              ),
              SizeSection(
                productSizes: productSizes,
                selectedSizeIndex: selectedSizeIndex,
                onSizeSelected: (index) {
                  setState(() {
                    selectedSizeIndex = index;
                  });
                },
              ),
              const DescriptionSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomActionBar(),
    );
  }
}

// Formerly _buildAppBar
class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 85,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 104, 104, 104),
        ),
        onPressed: () {
          // এখানে ব্যাক বাটনের কাজ যোগ করুন
        },
      ),
      title: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'What are you looking for?',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 134, 134, 134),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.shopkSecondaryTextColor2,
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 184, 184, 184),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.camera_alt_outlined,
            color: Color.fromARGB(255, 109, 108, 108),
            size: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);
}

// Formerly _buildImageCarousel
class ImageCarousel extends StatelessWidget {
  final List<String> productImages;
  final int selectedImageIndex;
  final ValueChanged<int> onImageSelected;

  const ImageCarousel({
    super.key,
    required this.productImages,
    required this.selectedImageIndex,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          color: AppColors.shopkBackgroundColor2,
          child: Image.asset(
            productImages[selectedImageIndex],
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.image_not_supported,
              size: 100,
              color: AppColors.shopkDisabledColor,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Color.fromARGB(255, 104, 104, 104),
                size: 28,
              ),
              onPressed: () {},
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(productImages.length, (index) {
              return GestureDetector(
                onTap: () => onImageSelected(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(4),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.shopkWhite,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selectedImageIndex == index
                          ? AppColors.shopkPrimaryRed
                          : AppColors.shopkBorderColor,
                      width: 1.3,
                    ),
                  ),
                  child: Image.asset(
                    productImages[index],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image,
                        color: AppColors.shopkDisabledColor),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

// Formerly _buildProductInfo
class ProductInfoSection extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductInfoSection({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '327 Moonbeam Stone Pink Women',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.shopkPrimaryTextColor2,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.star, color: AppColors.shopkStarColor, size: 18),
              SizedBox(width: 4),
              Text(
                '4.9',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 110, 108, 108),
                  fontSize: 16,
                  fontFamily: 'serif',
                ),
              ),
              SizedBox(width: 6),
              Text(
                "|",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 155, 153, 153),
                ),
              ),
              SizedBox(width: 6),
              Text(
                '50 reviews',
                style: TextStyle(
                  color: Color.fromARGB(255, 126, 125, 125),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currencyFormatter.format(2137500),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFFf05153),
                ),
              ),
              QuantitySelector(
                quantity: quantity,
                onIncrement: onIncrement,
                onDecrement: onDecrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Formerly _buildQuantitySelector
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuantityButton(
          icon: Icons.remove,
          onPressed: onDecrement,
          isIncrement: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$quantity',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 61, 61, 61),
            ),
          ),
        ),
        _buildQuantityButton(
          icon: Icons.add_outlined,
          onPressed: onIncrement,
          isIncrement: true,
        ),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isIncrement,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: isIncrement
              ? const Color.fromARGB(255, 228, 12, 12)
              : Colors.white,
          shape: BoxShape.circle,
          border: isIncrement
              ? null
              : Border.all(
                  color: const Color.fromARGB(255, 228, 12, 12),
                  width: 1.5,
                ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isIncrement
              ? Colors.white
              : const Color.fromARGB(255, 228, 12, 12),
        ),
      ),
    );
  }
}

class SizeSection extends StatelessWidget {
  final List<String> productSizes;
  final int selectedSizeIndex;
  final ValueChanged<int> onSizeSelected;

  const SizeSection({
    super.key,
    required this.productSizes,
    required this.selectedSizeIndex,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Product Size',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(color: AppColors.shopkPrimaryRed),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(productSizes.length, (index) {
                bool isSelected = selectedSizeIndex == index;
                bool isDisabled = index == 3;
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ChoiceChip(
                    showCheckmark: false,
                    label: Text(
                      productSizes[index],
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.shopkPrimaryRed
                            : AppColors.shopkPrimaryTextColor,
                      ),
                    ),
                    selected: isSelected,
                    onSelected:
                        isDisabled ? null : (selected) => onSizeSelected(index),
                    backgroundColor: isSelected
                        ? const Color.fromARGB(255, 194, 153, 153)
                        : AppColors.shopkWhite,
                    selectedColor: AppColors.shopkWhite,
                    disabledColor: AppColors.shopkBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: isDisabled
                            ? AppColors.shopkBorderColor
                            : isSelected
                                ? AppColors.shopkPrimaryRed
                                : AppColors.shopkBorderColor,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// Formerly _buildDescriptionSection
class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Product Description',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'As recreational running established widespread popularity in the 1970s, the benchmark for running footwear shifted from mere existence to performance. While the era’s designs would be considered simple by today’s standards, the decade stands out as the moment when running shoes truly came into their own.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 43, 42, 42),
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// Formerly _buildBottomActionBar
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
      decoration: BoxDecoration(
        color: AppColors.shopkWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Color(0XFFf05153), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  color: Color(0XFFf05153),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFf05153),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 2,
                shadowColor: Color(0XFFf05153).withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 230, 230),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
