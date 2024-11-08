import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../core/components/button/custom_icon_button.dart';
import '../../../../../../../special/circle_story_widget.dart';
import '../cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView(
      {super.key,
      required this.messagePageChangeFunction,
      required this.cameraPageChangeFunction});

  final void Function() messagePageChangeFunction;
  final void Function() cameraPageChangeFunction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: _HomeView(
        messagePageChangeFunction,
        cameraPageChangeFunction,
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  final void Function() messagePageChangeFunction;
  final void Function() cameraPageChangeFunction;
  const _HomeView(
      this.messagePageChangeFunction, this.cameraPageChangeFunction);

  @override
  Widget build(BuildContext context) {
    final nameList = [
      'Ahmet',
      'Mehmet',
      'Durmuş',
      'Zekeriya',
      'Veli',
      'Mustafa',
      'Umut',
      'Hasan',
      'Hüseyin',
      'Mert',
    ];
    final photoUrl = 'https://randomuser.me/api/portraits/men/';
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleStoryWidget(
                  photoUrl: '${photoUrl}99.jpg',
                  title: 'Hikayen',
                  isMainProfile: true,
                  onAddTap: cameraPageChangeFunction,
                  onTap: () {},
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    10,
                    (index) {
                      return CircleStoryWidget(
                        photoUrl: '$photoUrl$index.jpg',
                        title: nameList[index],
                        isMainProfile: false,
                        isLooked: ((index % 2) == 0),
                        onTap: () {
                          print(nameList[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Senin için',
            style: context.general.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          context.sized.emptySizedWidthBoxLow,
          CustomIconButton(
            iconData: FontAwesomeIcons.chevronDown,
            size: context.sized.normalValue,
            onTap: () {},
          ),
        ],
      ),
      actions: [
        CustomIconButton(
          iconData: Icons.favorite_border,
          onTap: () {},
        ),
        context.sized.emptySizedWidthBoxLow,
        CustomIconButton(
          iconData: FontAwesomeIcons.facebookMessenger,
          onTap: messagePageChangeFunction,
        ),
        context.sized.emptySizedWidthBoxLow,
      ],
    );
  }
}
