import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

// The main screen widget that replicates the reading interface
class DiscoveryScreen3 extends StatefulWidget {
  const DiscoveryScreen3({super.key});

  @override
  State<DiscoveryScreen3> createState() => _DiscoveryScreen3State();
}

class _DiscoveryScreen3State extends State<DiscoveryScreen3> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;
  // double _scrollProgress2 = 0.0;
  bool _showReactionPopup = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // Avoid division by zero if maxScrollExtent is 0
      if (_scrollController.position.maxScrollExtent > 0) {
        setState(() {
          _scrollProgress = _scrollController.position.pixels /
              _scrollController.position.maxScrollExtent;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.discoverkBackgroundColor,
      appBar: _buildAppBar(context),
      body: _buildChapterContent(),
      bottomNavigationBar: _buildBottomActionBar(),
    );
  }

  /// Builds the custom top AppBar.
  AppBar _buildAppBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.discoverkAppBarBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 85,
      centerTitle: true,
      leadingWidth: 95,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButton(
          icon: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.discoverkAppBarBackgroundColor,
              border: Border.all(
                color: const Color.fromARGB(255, 218, 218, 218),
              ),
            ),
            child: Icon(Icons.arrow_back_ios_new),
          ),
          onPressed: () {},
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 35),
          child: IconButton(
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.discoverkAppBarBackgroundColor,
                border: Border.all(
                  color: const Color.fromARGB(255, 218, 218, 218),
                ),
              ),
              child: Icon(Icons.list),
            ),
            onPressed: () {},
          ),
        ),
      ],
      title: Text(
        "01 | Minggu pagi Moza",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.discoverkPrimaryTextColor,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(6.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 2.0,
            width: screenWidth * _scrollProgress,
            color: AppColors.discoverkProgressIndicatorColor,
          ),
        ),
      ),
    );
  }

  /// Builds the scrollable body of the chapter.
  Widget _buildChapterContent() {
    const String paragraph1 =
        'komplek yang luas ini hanya dengan kaki saja. Bagaimanapun juga, sepeda lebih tidak membuatku capek. Jadi, aku mengandalkan sepeda biru kesayanganku untuk mengikuti Kak Eghi berjoging.';
    const String paragraph2 =
        '“Halo, Beibei,” sapaku pada sepeda biru yang terparkir di sebelah, aku pun segera menaiki sepedaku meninggalkan garasi.';
    const String paragraph3 =
        '“Ayo, Kak!” teriakku seraya melajukan sepedaku sambil melewati Kak Eghi ';
    const String paragraph41 =
        '“yang sedang menyandarkan tubuhnya di gerbang rumahku. Kak Eghi hanya tertawa sambil menggelengkan kepala. Setelah itu, Kak Eghi berlari kecil mengejarku.';
    const String paragraph4 =
        '“Moz, Shila apa kabar?” tanya Kak Eghi kepadaku.';
    const String paragraph5 =
        'Laju sepedaku melambat. Kini kak Eghi berlari kecil di sampingku.';
    const String paragraph6 =
        '“Kak Shila baik kok, katanya bentar lagi ujian Kak,” kataku ';

    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _buildParagraph(paragraph1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: _buildParagraph(paragraph2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SelectableText.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.7,
                      color:
                          AppColors.discoverkPrimaryTextColor.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: paragraph3,
                        style: const TextStyle(
                          backgroundColor:
                              AppColors.discoverkSelectedParagraphColor,
                          color: AppColors.discoverkPrimaryTextColor,
                          fontSize: 14.5,
                        ),
                        // 🔹 টেক্সটটিকে ক্লিকযোগ্য করার জন্য recognizer যোগ করা হয়েছে
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              // এখানে পপ-আপের অবস্থা পরিবর্তন (toggle) করা হচ্ছে
                              _showReactionPopup = !_showReactionPopup;
                            });
                          },
                      ),
                      TextSpan(
                        text: paragraph41,
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // 🔹 এখানে কন্ডিশন যোগ করা হয়েছে: শুধুমাত্র _showReactionPopup সত্য হলেই এটি দেখা যাবে
                if (_showReactionPopup)
                  Positioned(top: -55, left: 20, child: _buildReactionPopup()),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AppsImages.cycle,
                    width: 110,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildParagraph(paragraph4),
                      _buildParagraph(paragraph5),
                      _buildParagraph(paragraph6),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ExpandableSynopsis(),
          ),
          const SizedBox(height: 110),
        ],
      ),
    );
  }

  Widget _buildParagraph(
    String text, {
    bool isHighlighted = false,
    bool isFaded = false,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.5,
        height: 1.7,
        color: isFaded
            ? AppColors.discoverkPrimaryTextColor
            : (isHighlighted
                ? AppColors.discoverkPrimaryTextColor
                : AppColors.discoverkPrimaryTextColor),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildReactionPopup() {
    return CustomPaint(
      painter: _BubblePainter(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.discoverkPrimaryTextColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('🤔', style: TextStyle(fontSize: 22)),
            SizedBox(width: 12),
            Text('🤨', style: TextStyle(fontSize: 22)),
            SizedBox(width: 12),
            Text('😡', style: TextStyle(fontSize: 22)),
            SizedBox(width: 12),
            Text('😯', style: TextStyle(fontSize: 22)),
            SizedBox(width: 16),
            Icon(Icons.chat_bubble_outline, color: Colors.white, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return BottomAppBar(
      color: AppColors.discoverkAppBarBackgroundColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomBarIcon(Icons.star_border_outlined),
            _buildBottomBarIcon(Icons.chat_bubble_outline),
            _buildBottomBarTextButton(),
            _buildBottomBarIcon(Icons.ios_share_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarIcon(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: AppColors.discoverkIconColor, size: 28),
      onPressed: () {},
    );
  }

  Widget _buildBottomBarTextButton() {
    return GestureDetector(
      onTap: () {},
      child: const Text(
        'Aa',
        style: TextStyle(
          color: AppColors.discoverkIconColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.discoverkPrimaryTextColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.2 + 8, size.height + 8)
      ..lineTo(size.width * 0.2 + 16, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ExpandableSynopsis extends StatefulWidget {
  const ExpandableSynopsis({super.key});

  @override
  State<ExpandableSynopsis> createState() => _ExpandableSynopsisState();
}

class _ExpandableSynopsisState extends State<ExpandableSynopsis> {
  bool _isExpanded = false;

  static const String text =
      '“Bisa aja lo,” kata Kak Eghi sambil tertawa. Due to an unexpected ally,😜 1 Valadin and his friends managed to escape. '
      'Not only that, they also waged a battle in the Temple City';

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // GestureDetector ব্যবহার করে পুরো টেক্সট এলাকাটি ক্লিকযোগ্য করা হয়েছে
        GestureDetector(
          onTap: _toggleExpanded,
          child: Stack(
            children: [
              // এই Text উইজেটটি কলাপ্স বা এক্সপ্যান্ড হবে
              Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14.5,
                  height: 1.7,
                  color: AppColors.discoverkPrimaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
                // _isExpanded সত্য হলে সব লাইন দেখাবে, না হলে ৬ লাইন দেখাবে
                maxLines: _isExpanded ? null : 6,
                // অতিরিক্ত টেক্সটকে ক্লিপ করা হবে যাতে fade ইফেক্ট দেওয়া যায়
                overflow: TextOverflow.clip,
              ),

              // ======== Fade/Blur ইফেক্ট ========
              // শুধুমাত্র কলাপ্স থাকা অবস্থায় এই আবছা ইফেক্টটি দেখা যাবে
              if (!_isExpanded)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 40, // Fade ইফেক্টের উচ্চতা
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // উপরে স্বচ্ছ, নিচে সাদা
                          AppColors.discoverkBackgroundColor.withOpacity(0.0),
                          AppColors.discoverkBackgroundColor,
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        // ======== "Show More" বাটন ========
        // শুধুমাত্র কলাপ্স থাকা অবস্থায় এই বাটনটি দেখা যাবে
      ],
    );
  }
}
