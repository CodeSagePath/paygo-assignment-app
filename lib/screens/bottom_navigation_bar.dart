import 'package:flutter/material.dart';
import 'package:paygo_app/constants/colors.dart';
import 'package:paygo_app/models/category.dart';
import 'package:paygo_app/widgets/app_bar.dart';
import 'business_page.dart';
import 'home_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  late final Category category;
  late final List<Widget> pages;
  @override
  void initState() {
    super.initState();
    category = categoryList[0]; // Initialize category
    pages = [
      const Home(),
      const BusinessPage(),
    ];
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  Widget _buildBottomBarItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.purple : Colors.grey,
              size: 24.0,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.purple : Colors.grey,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildBottomBarItem(Icons.home, 'Home', 0),
              _buildBottomBarItem(Icons.pie_chart, 'Chart', 1),
              _buildBottomBarItem(Icons.auto_graph, 'Stats', 2),
              _buildBottomBarItem(Icons.account_circle, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }
}