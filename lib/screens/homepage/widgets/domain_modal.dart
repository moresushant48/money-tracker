import 'package:flutter/material.dart';
import 'package:money_tracker/utilities/widgets.dart';

openDomainDialog(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (x) {
        TextEditingController domainController = TextEditingController();
        return Container(
          height: 320,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(42.0),
              topRight: Radius.circular(42.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
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
                  hintText: "Enter Domain Name",
                ),
                SizedBox(
                  height: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //
                    UtilityWidgets()
                        .button(context, text: "Cancel", onPressed: () {}),
                    UtilityWidgets().button(context,
                        text: "Submit", filled: true, onPressed: () {}),
                    //
                  ],
                ),
                SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ),
        );
      });
}
