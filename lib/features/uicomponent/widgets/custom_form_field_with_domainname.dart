import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare/core/style/styles.dart';

class CustomFormFieldWithDomainName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 55,
            child: Container(
              padding: const EdgeInsets.only(left: 16, top: 0, right: 8, bottom: 0),
              width: double.infinity,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your email ID",
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                style: Styles.h5Regular,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Text("|", style: Styles.h2Regular.merge(TextStyle(color: Colors.grey))),
            ),
          ),
          Expanded(
            flex: 40,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Text("@domain.net", style: Styles.h5Regular),
            ),
          ),
        ],
      ),
    );
  }
}
