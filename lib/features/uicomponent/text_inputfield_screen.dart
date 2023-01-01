import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flare/core/style/color_constants.dart';
import 'package:flare/core/style/styles.dart';
import 'package:flare/core/utils/logger.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flare/core/widgets/appbar_widget.dart';
import 'package:flare/features/uicomponent/widgets/custom_form_field_with_domainname.dart';
import 'package:flare/features/uicomponent/widgets/text_input_field_form_example.dart';
import 'package:flare/features/uicomponent/widgets/text_input_field_password_eye_example.dart';

class TextAndInputFieldScreen extends StatelessWidget {
  TextEditingController mycontroller = TextEditingController();
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        message: StringConstants.screenUiComponentText,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Texts
            Text("UI Component - Text", style: Styles.h3SemiBold),
            Text("Normal", style: Styles.h5Regular),
            Text("SemiBold", style: Styles.h5SemiBold),
            Text("Normal - Italic",
                style: Styles.h5Regular.merge(const TextStyle(fontStyle: FontStyle.italic))),
            Text("Gredient Text",
                style: TextStyle(
                    fontSize: Styles.fontSizeH2,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        Offset(0, 20),
                        Offset(150, 20),
                        <Color>[
                          Colors.red,
                          Colors.yellow,
                        ],
                      ))),
            RichText(
              text: TextSpan(
                text: 'Hello ',
                style: Styles.h5Regular.merge(const TextStyle(color: ColorConstants.gray50)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'bold',
                      style: Styles.h4SemiBold.merge(TextStyle(color: ColorConstants.gray50))),
                  TextSpan(
                      text: ' Text!',
                      style: Styles.h5Regular.merge(const TextStyle(color: ColorConstants.gray50))),
                ],
              ),
            ),
            RichText(
                text: TextSpan(
                    text: "Hello World",
                    style: Styles.h5Regular.merge(const TextStyle(color: ColorConstants.black)),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'Span Underline Text',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                  ),
                  TextSpan(
                      text: ' End the normal text',
                      style: Styles.h5Regular.merge(const TextStyle(color: ColorConstants.black))),
                ])),

            //Input fields
            SizedBox(height: 20),
            Text("UI Component - Input Fields", style: Styles.h3SemiBold),

            SizedBox(height: 20),

            Padding(
              key: Key(""),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  //Broadcom
                  CustomFormFieldWithDomainName(),
                  //Broadcom

                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'TextField - Outline Border',
                        labelText: "Label TextField"),
                    onChanged: (text) {
                      inputText = text;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty == true) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  TextInputFieldEyePasswordExample(),
                  Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            TextAutoValidateModeExample(),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
