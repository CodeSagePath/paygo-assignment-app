import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingEffect extends StatelessWidget {
  const ShimmerLoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 236, 234, 234),
      highlightColor: const Color.fromRGBO(245, 245, 245, 1),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 199, 38, 38),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}