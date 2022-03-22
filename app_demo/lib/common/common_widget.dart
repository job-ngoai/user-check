import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget animationItemWidget(
    {required int? postion, required Widget? child, Duration? delay}) {
  return AnimationLimiter(
    child: AnimationConfiguration.staggeredList(
      delay: delay ?? const Duration(milliseconds: 100),
      position: postion!,
      child: SlideAnimation(
          horizontalOffset: 44, child: FadeInAnimation(child: child!)),
    ),
  );
}
