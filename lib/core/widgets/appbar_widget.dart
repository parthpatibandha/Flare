import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flare/core/style/color_constants.dart';
import 'package:flare/core/utils/app_constants.dart';

/// AppBarWidget - use for show toolbar or header
/// @param [message] : The appbar title
/// @param [leading] : The left side icon
/// @param [actionList] : The right side icon list or action buttons
class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  String message;
  Widget? leading;
  List<Widget>? actionList = List.empty(growable: true);

  AppBarWidget({required this.message, this.actionList, this.leading})
      : super(key: Key(message));

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(widget.message),
          leading: widget.leading,
          actions: widget.actionList,
          toolbarHeight: AppConstants.appBarHeight,
          backgroundColor: ColorConstants.primary,
          shadowColor: ColorConstants.gray20,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorConstants.primary,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        )
      ],
    );
  }
}
