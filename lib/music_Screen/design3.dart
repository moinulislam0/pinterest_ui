import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/core/colors.dart';
import 'package:pinterest_ui/core/images.dart';

class AudioScreendesign3 extends StatelessWidget {
  const AudioScreendesign3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,  <-- এই লাইনটি রিমুভ করা হয়েছে
      appBar: AppBar(
        title: Text(
          "A Teaspoon of Earth...",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            fontFamily: 'serif',
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80.sp,
        scrolledUnderElevation: 0,
        // backgroundColor: Colors.transparent, <-- এটিও রিমুভ করা হয়েছে
        elevation: 0,
        // AppBar-কে গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড দেওয়ার জন্য flexibleSpace ব্যবহার করা হয়েছে
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gradientStart2, AppColors.gradientStart2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.r),
          child: IconButton(
            icon: Center(
              child: Icon(
                Icons.arrow_back,
                color: AppColors.primaryText,
                size: 24.sp,
              ),
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark_outline,
              color: AppColors.secondaryText,
              size: 20.sp,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.470,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gradientStart2, AppColors.gradientStart2],
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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: TextExpandedwidget(),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Text(
                  '"Where is Mahtab?" Saba asks again, and fidgets in the backseat of the car. Her father drives, while in the passenger seat her mother searches her purse for passports and plane tickets and all the papers needed to get out of Iran.',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    fontFamily: 'sans-serif',
                  ),
                ),
              ),
              SizedBox(height: 80.h),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: AudioWaveform(),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: hours(),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.only(left: 18, right: 10),
                child: PlayerControls(),
              ),
            ],
          ),
        ],
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

class AudioWaveform extends StatelessWidget {
  const AudioWaveform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ওয়েভফর্মের বারগুলোর উচ্চতা
    final List<double> barHeights = [
      16,
      30,
      40,
      50,
      40,
      28,
      26,
      16,
      24,
      30,
      20,
      50,
      40,
      26,
      21,
      60,
      40,
      27,
      22,
      16,
      30,
      40,
      50,
      40,
      28,
      26,
      16,
      24,
      30,
      20,
      50,
      40,
      26,
      21,
      60,
      40,
      30,
      50,
      40,
      10,
      30,
      50,
      40,
      20,
      28,
      26,
      16,
      24,
      30,
      20,
      50,
    ];

    return SizedBox(
      height:
          50.h, // সর্বোচ্চ উচ্চতার জন্য SizedBox এর height কিছুটা বাড়ানো হলো
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(barHeights.length, (index) {
          final color = index < 14
              ? AppColors.primaryColorMS1
              : Color.fromARGB(68, 168, 175, 240);
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              width: 3.3.w,
              height: barHeights[index].h,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class TextExpandedwidget extends StatelessWidget {
  const TextExpandedwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
              height: 1.6,
            ),
            children: [
              TextSpan(
                text:
                    'This is the sum of all that Saba Hafezi remembers from the day her mother and twin sister flew away forever, maybe to America, maybe to somewhere even farther out of reach. If you asked her to recall it, she would cobble all the pieces together as ',
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  decoration: BoxDecoration(
                    color: AppColors.highlightBackground,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    'muddled memories within memories',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text:
                    ' , two balmy Gilan days torn out of sequence, floating somewhere in her eleventh summer, and glued back together like this:',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class hours extends StatelessWidget {
  const hours({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("00:42:13",
              style:
                  TextStyle(fontSize: 10.sp, color: AppColors.secondaryText2)),
          Text("02:49:23",
              style:
                  TextStyle(fontSize: 10.sp, color: AppColors.secondaryText2)),
        ],
      ),
    );
  }
}

// প্লেয়ার কন্ট্রোল বাটনগুলোর জন্য একটি উইজেট
class PlayerControls extends StatelessWidget {
  const PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.format_list_bulleted,
            color: AppColors.iconColor,
            size: 20.sp,
          ),
          onPressed: () {},
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.fast_rewind,
            color: AppColors.primaryColorMS1,
            size: 20.sp,
          ),
          onPressed: () {},
        ),
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.primaryColorMS1,
            boxShadow: [
              BoxShadow(
                color: Color(0x445C6AF0),
                blurRadius: 10,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.pause, color: Colors.white, size: 28.sp),
            onPressed: () {},
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.fast_forward,
            color: AppColors.primaryColorMS1,
            size: 20.sp,
          ),
          onPressed: () {},
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.nights_stay_outlined,
            color: AppColors.iconColor,
            size: 20.sp,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
