class BusinessTileData {
  final String businessName;
  final String businessAddress;
  final String price;
  final String distance;
  final String imageAssetPath;

  BusinessTileData({
    required this.businessName,
    required this.businessAddress,
    required this.price,
    required this.distance,
    required this.imageAssetPath,
  });

  factory BusinessTileData.fromJson(Map<String, dynamic> json) {
    return BusinessTileData(
      businessName: data['business_name'] ?? 'Test',
      businessAddress: data['business_address'] ?? 'Test',
      price: (data['price']) ?? 'Test',
      distance: (data['distance']) ?? 'Test',
      imageAssetPath: data['imageUrl'] ?? 'https://firebasestorage.googleapis.com/v0/b/paygo-assignment-752fe.appspot.com/o/background2.jpeg?alt=media&token=04e91770-47b7-44cd-b856-1df179c50009',
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'businessAddress': businessAddress,
      'price': price,
      'distance': distance,
      'imageUrl': imageAssetPath,
    };
  }
}
