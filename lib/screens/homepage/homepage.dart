import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/screens/homepage/cubit/domain_cubit.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card_shimmer.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator(
          onRefresh: () => BlocProvider.of<DomainCubit>(context).fetchDomains(),
          child: SingleChildScrollView(
            primary: true,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42.0),
                          topRight: Radius.circular(42.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          //
                          SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Your Domains",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          //
                          BlocConsumer<DomainCubit, DomainState>(
                            listener: (context, state) {
                              if (state is DomainInsertSuccess) {
                                BlocProvider.of<DomainCubit>(context)
                                    .fetchDomains();
                              }
                            },
                            builder: (context, state) {
                              if (state is DomainFetching) {
                                // view shimmer when domains are being fetched
                                return DomainCardShimmer();
                                //
                              } else if (state is DomainFetched) {
                                // List out domains when fetched.
                                return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  primary: false,
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
                ],
              ),
            ),
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
