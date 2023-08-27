import 'package:beamer/beamer.dart';
import 'package:flare/HomeScreen.dart';
import 'package:flare/core/utils/app_constants.dart';
import 'package:flare/core/utils/string_constants.dart';
import 'package:flutter/material.dart';

class ChapterWidget extends StatefulWidget {
  final Chapter chapter;

  const ChapterWidget({required this.chapter}) : super(key: const Key(StringConstants.keyChapter));

  @override
  _ChapterWidgetState createState() {
    return _ChapterWidgetState();
  }
}

class _ChapterWidgetState extends State<ChapterWidget> {
  var isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (isSelected == true) ? const Color(0xFFEEEEEE) : Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppConstants.twelve, horizontal: AppConstants.eight),
          child: Text(widget.chapter.name),
        ),
        onTap: () {
          setState(() {
            isSelected = true;
          });
          setState(() {
            Future.delayed(const Duration(milliseconds: 200), () {
              context.beamToNamed(widget.chapter.route, data: widget.chapter);
              setState(() {
                isSelected = false;
              });
            });
          });
        },
      ),
    );
  }
}
