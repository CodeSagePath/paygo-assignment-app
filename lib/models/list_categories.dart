import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String categoryname;
  final String numberofcategory;

  const CategoryTile({
    Key? key,
    required this.icon,
    required this.categoryname,
    required this.numberofcategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.cyan[100],
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.cyan,
                      child: Icon(icon, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Text(
                        categoryname,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      //subtitle
                      Text(
                        numberofcategory,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}
