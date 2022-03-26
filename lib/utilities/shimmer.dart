import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  final Widget child;
  ShimmerView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: child,
        baseColor: Color(0xffE6E8EB),
        highlightColor: Color(0xffF9F9FB));
  }
}
