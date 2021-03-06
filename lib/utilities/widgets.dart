import 'package:flutter/material.dart';

class UtilityWidgets {
  Widget textFormField(
    BuildContext context, {
    controller,
    validators,
    inputFormatters,
    TextInputType textInputType = TextInputType.text,
    String hintText = "",
  }) {
    return TextFormField(
      controller: controller,
      validator: validators,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      decoration: InputDecoration(
          hintText: hintText,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(42.0))),
    );
  }

  Widget button(BuildContext context,
      {String text = "",
      bool outlined = false,
      bool filled = false,
      double width = 120,
      onPressed}) {
    return InkWell(
      borderRadius: BorderRadius.circular(42.0),
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        width: width,
        decoration: BoxDecoration(
          color: filled ? Theme.of(context).primaryColor : null,
          border: outlined
              ? Border.all(color: Theme.of(context).primaryColor)
              : null,
          borderRadius: BorderRadius.circular(42.0),
        ),
        child: TextButton(
          onPressed: null,
          child: Text(
            "$text",
            style: TextStyle(
              fontSize: 16.0,
              color: filled ? Colors.white : Theme.of(context).primaryColor,
            ),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}
