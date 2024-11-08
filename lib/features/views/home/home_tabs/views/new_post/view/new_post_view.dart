import 'package:ekabav_instagram/features/views/home/home_tabs/views/new_post/cubit/new_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewPostCubit>(
      create: (context) => NewPostCubit(),
      child: const _NewPostView(),
    );
  }
}

class _NewPostView extends StatelessWidget {
  const _NewPostView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('NewPostView'),
        ],
      ),
    );
  }
}
