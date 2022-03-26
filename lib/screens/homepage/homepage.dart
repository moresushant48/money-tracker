import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/screens/homepage/cubit/domain_cubit.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card_shimmer.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_modal.dart';
import 'package:money_tracker/utilities/widgets.dart';

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
        child: RefreshIndicator(
          onRefresh: () => BlocProvider.of<DomainCubit>(context).fetchDomains(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              BlocConsumer<DomainCubit, DomainState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is DomainFetching) {
                    // view shimmer when domains are being fetched
                    return DomainCardShimmer();
                    //
                  } else if (state is DomainFetched) {
                    // List out domains when fetched.
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (context, index) {
                        return DomainCard(
                          domain: state.data[index],
                        );
                      },
                    );
                    //
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDomainDialog(context);
        },
        child: Icon(
          Icons.add_outlined,
        ),
      ),
    );
  }
}
