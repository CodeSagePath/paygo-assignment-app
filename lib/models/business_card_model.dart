import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<BusinessTileData>> fetchBusinessData() async {
  final snapshot = await FirebaseFirestore.instance.collection('businesses').get();
  return snapshot.docs.map((doc) => BusinessTileData.fromFirestore(doc.data())).toList();
}

class BusinessTileData {
  String businessName;
  String businessAddress;
  double distance;
  String price;

  BusinessTileData({
    required this.businessName,
    required this.businessAddress,
    required this.distance,
    required this.price,
  });

  factory BusinessTileData.fromFirestore(Map<String, dynamic> data) {
    return BusinessTileData(
      businessName: data['businessName'] ?? '',
      businessAddress: data['businessAddress'] ?? '',
      distance: data['distance']?.toDouble() ?? 0.0,
      price: data['price'] ?? '',
    );
  }
}
