import 'package:flutter/material.dart';
import 'package:money_tracker/utilities/shimmer.dart';

class DomainCardShimmer extends StatelessWidget {
  const DomainCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerView(
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          child: Container(
            color: Colors.white,
            height: 60,
          ),
        ),
      ),
    );
  }
}
