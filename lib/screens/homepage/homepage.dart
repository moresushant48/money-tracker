import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:money_tracker/screens/homepage/cubit/domain_cubit.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card_shimmer.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_modal.dart';
import 'package:money_tracker/screens/phone_auth/cubit/phone_auth_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: BlocListener<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneAuthLogoutSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/splash", (route) => false);
            }
          },
          child: LayoutBuilder(
            builder: (context, constraints) => RefreshIndicator(
              onRefresh: () =>
                  BlocProvider.of<DomainCubit>(context).fetchDomains(),
              child: SingleChildScrollView(
                primary: true,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<PhoneAuthCubit>(context)
                                        .logout();
                                  },
                                  icon: Icon(
                                    Icons.logout_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Container(
                          width: double.infinity,
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
                                  style: TextStyle(fontSize: 24.0),
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
                                    return state.data.length > 0
                                        ? ListView.builder(
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
                                          )
                                        : Column(
                                            children: [
                                              Lottie.network(
                                                "https://assets8.lottiefiles.com/packages/lf20_awc77jfz.json",
                                              ),
                                              Text(
                                                "No domains found.",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              )
                                            ],
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openDomainDialog(context);
          },
          child: Icon(
            Icons.add_outlined,
          ),
        ),
      ),
    );
  }
}
