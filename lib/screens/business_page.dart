import 'package:flutter/material.dart';
import 'package:paygo_app/constants/colors.dart';
import 'package:paygo_app/models/business_list_for_page.dart';
import 'package:paygo_app/widgets/app_bar.dart';
import 'package:paygo_app/widgets/business_tiles.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  int _selectedIndex = 0;
  String _selectedCategory = 'Gym';
  final List<String> _categories = [
    'Gym',
    'Swimming',
    'Cricket',
    'Yoga',
    'Basketball',
    'Badminton'
  ];

  @override
  void initState() {
    super.initState();
    _fetchBusinessData();
  }

  Future<void> _fetchBusinessData() async {
    await BusinessTileData.fetchBusinessData();
    if (mounted) {
      setState(() {});
    }
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.white,
      body: FutureBuilder<void>(
        future: _fetchBusinessData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          List<BusinessTileData> businessList = BusinessTileData.businessList;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _categories.map((category) {
                        bool isSelected = _selectedCategory == category;
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color:
                                    isSelected ? Colors.purple : Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    children: [
                      ListView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04),
                        itemCount: businessList.length,
                        itemBuilder: (context, index) {
                          BusinessTileData business = businessList[index];
                          return GestureDetector(
                            onTap: () {},
                            child: BusinessTile(
                              business: business,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
