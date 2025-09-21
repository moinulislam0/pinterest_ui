import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinterest_ui/Mobile%20Ui/design1.dart';
import 'package:pinterest_ui/core/colors.dart';

class Design3 extends StatelessWidget {
  const Design3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar এর ব্যাকগ্রাউন্ড রঙ
        centerTitle: true,
        title: const Text(
          "Agenda Bulanan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 253, 250, 250),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          children: [
            //const Header(),
            const SizedBox(height: 10),
            const MonthSelector(),
            const SizedBox(height: 20),
            const CalendarView(),
            const SizedBox(height: 30),
            const AgendaItem(
              icon: Icons.assignment_outlined,
              iconBgColor: AppColors.homeworkIconBg,
              iconColor: AppColors.homeworkIcon,
              title: 'Pekerjaan Rumah',
              count: 2,
              countColor: AppColors.homeworkIcon,
            ),
            const SizedBox(height: 16),
            const AgendaItem(
              icon: Icons.group_outlined,
              iconBgColor: AppColors.groupWorkIconBg,
              iconColor: AppColors.groupWorkIcon,
              title: 'Kerja Kelompok',
              count: 1,
              countColor: AppColors.groupWorkIcon,
            ),
            const SizedBox(height: 16),
            const AgendaItem(
              icon: Icons.assignment_outlined,
              iconBgColor: AppColors.homeworkIconBg,
              iconColor: AppColors.eventYellow,
              title: 'Pekerjaan Rumah',
              count: 3,
              countColor: AppColors.eventYellow,
            ),
            const SizedBox(height: 16),
            const AgendaItem(
              icon: Icons.assignment_outlined,
              iconBgColor: AppColors.homeworkIconBg,
              iconColor: AppColors.eventYellow,
              title: 'Pekerjaan Rumah',
              count: 3,
              countColor: AppColors.eventYellow,
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Agenda Bulanan',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryText,
      ),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.d1CardbgColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: const Column(
        children: [DayHeaders(), SizedBox(height: 10), DateGrid()],
      ),
    );
  }
}

class MonthSelector extends StatelessWidget {
  const MonthSelector({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),

      decoration: BoxDecoration(
        color: AppColors.d1CardbgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.chevron_left, color: AppColors.secondaryText),
          Text(
            'Agustus 2020',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.homeworkIcon.withValues(alpha: .5),
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.secondaryText),
        ],
      ),
    );
  }
}

class DayHeaders extends StatelessWidget {
  const DayHeaders({super.key});
  @override
  Widget build(BuildContext context) {
    const days = ['SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB', 'MIN'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          days
              .map(
                (day) => Text(
                  day,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.calendarDayText,
                  ),
                ),
              )
              .toList(),
    );
  }
}

class DateGrid extends StatelessWidget {
  const DateGrid({super.key});

  static const List<Map<String, dynamic>> dates = [
    {'date': '28', 'active': false},
    {'date': '29', 'active': false},
    {'date': '30', 'active': false},
    {'date': '1', 'active': true},
    {'date': '2', 'active': true},
    {'date': '3', 'active': true},
    {'date': '4', 'active': true},
    {'date': '5', 'active': true, 'event': AppColors.eventBlue},
    {'date': '6', 'active': true},
    {'date': '7', 'active': true, 'event': AppColors.eventBlue},
    {'date': '8', 'active': true},
    {'date': '9', 'active': true},
    {'date': '10', 'active': true},
    {'date': '11', 'active': true},
    {'date': '12', 'active': true},
    {'date': '13', 'active': true},
    {'date': '14', 'active': true},
    {'date': '15', 'active': true},
    {'date': '16', 'active': true},
    {'date': '17', 'active': true},
    {'date': '18', 'active': true},
    {'date': '19', 'active': true},
    {'date': '20', 'active': true},
    {'date': '21', 'active': true},
    {'date': '22', 'active': true, 'event': AppColors.eventGreen},
    {'date': '23', 'active': true},
    {'date': '24', 'active': true},
    {'date': '25', 'active': true},
    {'date': '26', 'active': true},
    {'date': '27', 'active': true, 'event': AppColors.eventYellow},
    {'date': '28', 'active': true},
    {'date': '29', 'active': true},
    {'date': '30', 'active': true},
    {'date': '31', 'active': true},
    {'date': '1', 'active': false},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 12,
      ),
      itemCount: dates.length,
      itemBuilder: (context, index) {
        final dateInfo = dates[index];
        final bool hasEvent = dateInfo.containsKey('event');
        return Container(
          alignment: Alignment.center,
          decoration:
              hasEvent
                  ? BoxDecoration(
                    color: dateInfo['event'],
                    shape: BoxShape.circle,
                  )
                  : null,
          child: Text(
            dateInfo['date'],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color:
                  hasEvent
                      ? Colors.white
                      : (dateInfo['active']
                          ? AppColors.primaryText
                          : AppColors.calendarInactiveDate),
            ),
          ),
        );
      },
    );
  }
}

class AgendaItem extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final int count;
  final Color countColor;

  const AgendaItem({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.count,
    required this.countColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(179, 247, 244, 244),
          width: 1.5,
        ),
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: countColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
          ),
          const Spacer(),
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: countColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.bottomNavActiveBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.accentColor, size: 24),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    } else {
      return IconButton(
        onPressed: () {},
        icon: Icon(icon, color: AppColors.bottomNavInactiveIcon, size: 28),
      );
    }
  }
}
