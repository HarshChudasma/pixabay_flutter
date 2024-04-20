import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/constants/presentation_constants.dart';
import 'package:flutter/material.dart';

/// Common scaffold for all project

class MainScaffold extends StatelessWidget {
  final Widget widget;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final bool removeSafeAreaPadding;
  final double appBarHeight;
  final Color bgColor;
  final String? bgImage;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final double toolBarHeight;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? drawer;
  final bool isBodyHasSafeArea;
  final Future<bool> Function()? onWillPop;
  const MainScaffold({
    Key? key,
    required this.widget,
    this.bottomNavigationBar,
    this.removeSafeAreaPadding = false,
    this.appBarHeight = PresentationConstant.appBarHeightSixty,
    this.bgColor = AppColors.whiteColor,
    this.resizeToAvoidBottomInset = true,
    this.bgImage,
    this.floatingActionButton,
    this.appBar,
    this.toolBarHeight = kToolbarHeight,
    this.scaffoldKey,
    this.drawer,
    this.isBodyHasSafeArea = true,
    this.onWillPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Container(
        decoration: bgImage != null
            ? BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage!),
            fit: BoxFit.cover,
          ),
        )
            : const BoxDecoration(),
        child: Scaffold(
          backgroundColor:
          bgImage == null ? bgColor : AppColors.transparentColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: isBodyHasSafeArea ? SafeArea(child: widget) : widget,
          key: scaffoldKey,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          appBar: appBar != null
              ? PreferredSize(
            preferredSize: Size(
              double.infinity,
              toolBarHeight,
            ),
            child: appBar!,
          )
              : null,
          drawer: scaffoldKey != null && drawer != null ? drawer : null,
          // endDrawer:scaffoldKey != null? DrawerComponent():null,
        ),
      ),
    );
  }
}
