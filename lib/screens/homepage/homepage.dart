import 'package:flutter/material.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return DomainCard(
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_outlined,
        ),
      ),
    );
  }
}
