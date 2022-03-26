import 'package:flutter/material.dart';
import 'package:money_tracker/utilities/shimmer.dart';

class DomainCardShimmer extends StatelessWidget {
  const DomainCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerView(
      child: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) => Card(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12.0, top: 12.0),
            color: Colors.white,
            height: 60,
          ),
        ),
      ),
    );
  }
}
