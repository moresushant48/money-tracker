import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/screens/homepage/cubit/domain_cubit.dart';
import 'package:money_tracker/utilities/widgets.dart';

openDomainDialog(BuildContext context) {
  var domainFormKey = GlobalKey<FormState>();
  TextEditingController domainController = TextEditingController();

  onSubmit(String domain) {
    if (domainFormKey.currentState!.validate()) {
      Navigator.pop(context);
      BlocProvider.of<DomainCubit>(context).addDomain(domain);
    }
  }

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (x) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42.0),
            topRight: Radius.circular(42.0),
          ),
        ),
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Form(
            key: domainFormKey,
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "Add Domain",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  UtilityWidgets().textFormField(
                    context,
                    controller: domainController,
                    validators: (String? str) {
                      if (str!.isEmpty) {
                        return "Domain can't be empty.";
                      } else
                        return null;
                    },
                    hintText: "Enter Domain Name",
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //
                      UtilityWidgets().button(context, text: "Cancel",
                          onPressed: () {
                        Navigator.pop(context);
                      }),
                      UtilityWidgets().button(context,
                          text: "Submit", filled: true, onPressed: () {
                        onSubmit(domainController.text.trim());
                      }),
                      //
                    ],
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
