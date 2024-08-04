import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessTileData {
  final String businessName;
  final String businessDescription;
  final String businessAddress;
  final double price;
  final String imageAssetPath;

  BusinessTileData({
    required this.businessName,
    required this.businessDescription,
    required this.businessAddress,
    required this.price,
    required this.imageAssetPath,
  });

  factory BusinessTileData.fromFirestore(Map<String, dynamic> data) {
    return BusinessTileData(
      businessName: data['businessName'] ?? 'Test',
      businessDescription: data['businessDescription'] ?? 'Test',
      businessAddress: data['businessAddress'] ?? 'Test',
      price: data['rating']?.toDouble() ?? 0.0,
      imageAssetPath: data['imageUrl'] ?? '',
    );
  }

  // Static list to hold business data
  static List<BusinessTileData> businessList = [];

  // Fetch data from Firestore and populate businessList
  static Future<void> fetchBusinessData() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('businesses').get();
      businessList = snapshot.docs
          .map((doc) => BusinessTileData.fromFirestore(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching business data: $e');
    }
  }
}