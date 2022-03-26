import 'package:flutter/material.dart';
import 'package:money_tracker/models/domain.dart';
import '../../../utilities/utility_service.dart';

class DomainCard extends StatelessWidget {
  final DomainModel domain;
  DomainCard({Key? key, required this.domain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.only(bottom: 12.0, top: 12.0),
      child: ListTile(
        title: Text(
          domain.name.toCapitalized(),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
