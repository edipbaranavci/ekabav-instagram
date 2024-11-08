import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../core/components/button/custom_circle_icon_button.dart';

class CircleStoryWidget extends StatelessWidget {
  const CircleStoryWidget({
    super.key,
    required this.photoUrl,
    required this.title,
    this.isMainProfile = false,
    this.isLooked = true,
    this.onAddTap,
    this.onTap,
  });

  final String photoUrl;
  final String title;
  final bool isMainProfile;
  final bool isLooked;
  final void Function()? onAddTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low * .2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.sized.highValue,
            width: context.sized.highValue,
            child: Stack(
              children: [
                buildPhoto(context),
                isMainProfile ? buildAddButton() : const SizedBox.shrink(),
              ],
            ),
          ),
          context.sized.emptySizedHeightBoxLow,
          buildTitle(context),
        ],
      ),
    );
  }

  Text buildTitle(BuildContext context) {
    return Text(
      title,
      style: context.general.textTheme.bodyMedium?.copyWith(
        fontWeight: !isLooked ? FontWeight.normal : FontWeight.w300,
      ),
    );
  }

  Positioned buildAddButton() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: CustomCircleIconButton(
        iconData: Icons.add,
        onTap: onAddTap,
      ),
    );
  }

  Positioned buildPhoto(BuildContext context) {
    return Positioned.fill(
      child: buildMiddleBorder(context),
    );
  }

  Widget buildMiddleBorder(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: context.border.highBorderRadius,
      child: Container(
        padding: context.padding.low * .3,
        decoration: BoxDecoration(
          border: isMainProfile
              ? null
              : Border.all(
                  color: isLooked
                      ? const Color.fromARGB(255, 219, 219, 219)
                      : Colors.red,
                  width: context.sized.lowValue * .3,
                ),
          shape: BoxShape.circle,
        ),
        child: buildCirclePhoto(),
      ),
    );
  }

  Widget buildCirclePhoto() {
    return CircleAvatar(
      backgroundImage: NetworkImage(photoUrl),
    );
  }
}
