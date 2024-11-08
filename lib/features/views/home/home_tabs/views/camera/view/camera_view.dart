import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/camera_cubit.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraCubit>(
      create: (context) => CameraCubit(),
      child: const _CameraView(),
    );
  }
}

class _CameraView extends StatelessWidget {
  const _CameraView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photoAndVideo(),
        topActionsBuilder: (state) {
          return Padding(
            padding: context.padding.low,
            child: AwesomeTopActions(
              padding: EdgeInsets.zero,
              state: state,
              children: [
                Expanded(child: AwesomeFlashButton(state: state)),
                Expanded(child: AwesomeTopActions(state: state).children[1]),
              ],
            ),
          );
        },
        progressIndicator: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
