import 'package:flutter/material.dart';
import 'package:paygo_app/constants/colors.dart';
import 'package:paygo_app/models/business_list_for_page.dart'; 

class BusinessTile extends StatelessWidget {
  final BusinessTileData business;

  const BusinessTile({
    Key? key,
    required this.business,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.01,
        bottom: screenHeight * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.appbackgroundColor,
            width: screenWidth,
            child: Stack(
              children: [
                Container(
                  color: AppColors.appbackgroundColor,
                  height: screenHeight * 0.3,
                  width: screenWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      business.imageAssetPath,
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenHeight * 0.3,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.18,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.02,
                            left: screenWidth * 0.03,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                business.businessName,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.07,
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                business.businessDescription, // Displaying description
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black.withOpacity(0.7),
                                    size: screenWidth * 0.04,
                                  ),
                                  Text(
                                    business.businessAddress,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenWidth * 0.025,
                            bottom: screenHeight * 0.005,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: IconButton(
                              onPressed: () {
                                // Add your action here
                              },
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              color: Colors.black,
                              iconSize: screenWidth * 0.07,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
