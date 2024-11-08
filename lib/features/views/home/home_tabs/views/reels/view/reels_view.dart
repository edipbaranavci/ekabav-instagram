import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/reels_cubit.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReelsCubit>(
      create: (context) => ReelsCubit(),
      child: const _ReelsView(),
    );
  }
}

class _ReelsView extends StatelessWidget {
  const _ReelsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('ReelsView'),
        ],
      ),
    );
  }
}
