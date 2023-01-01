import 'package:flutter/cupertino.dart';
import 'package:flare/core/utils/string_constants.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(StringConstants.screenNotImplemented),
      ),
    );
  }
}
