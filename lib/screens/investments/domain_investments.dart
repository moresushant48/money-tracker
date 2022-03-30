import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:money_tracker/screens/homepage/widgets/domain_card_shimmer.dart';
import 'package:money_tracker/screens/investments/cubit/investment_cubit.dart';

class Investments extends StatelessWidget {
  static const route = "/investments";

  final String domain;
  Investments({Key? key, this.domain = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(domain),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator(
          onRefresh: () => BlocProvider.of<InvestmentCubit>(context)
              .fetchInvestments(domain),
          child: SingleChildScrollView(
            primary: true,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        //
                        SizedBox(
                          height: 32,
                        ),

                        //
                        BlocConsumer<InvestmentCubit, InvestmentState>(
                          bloc: InvestmentCubit(domain),
                          listener: (context, state) {
                            if (state is InvestmentInsertSuccess) {
                              BlocProvider.of<InvestmentCubit>(context)
                                  .fetchInvestments(domain);
                            }
                          },
                          builder: (context, state) {
                            if (state is InvestmentFetching) {
                              // view shimmer when domains are being fetched
                              return DomainCardShimmer();
                              //
                            } else if (state is InvestmentFetched) {
                              // List out domains when fetched.
                              return state.investments.length > 0
                                  ? ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount: state.investments.length,
                                      padding: const EdgeInsets.all(16.0),
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(state
                                              .investments[index].amount
                                              .toString()),
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
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<InvestmentCubit>(context)
              .addInvestment(domain, 234.5);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
