import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../cubit/home_tabs_cubit.dart';
import 'camera/view/camera_view.dart';
import 'home/view/home_view.dart';
import 'messages/view/messages_view.dart';
import 'new_post/view/new_post_view.dart';
import 'profile/view/profile_view.dart';
import 'reels/view/reels_view.dart';
import 'search/view/search_view.dart';

class HomeTabsView extends StatelessWidget {
  const HomeTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTabsCubit>(
      create: (context) => HomeTabsCubit(),
      child: const _HomeTabsView(),
    );
  }
}

class _HomeTabsView extends StatelessWidget {
  const _HomeTabsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BlocBuilder<HomeTabsCubit, HomeTabsState>(
      builder: (context, state) {
        final cubit = context.read<HomeTabsCubit>();
        return BottomNavigationBar(
            elevation: 0,
            onTap: (newIndex) {
              cubit.changeSelectedPageIndex(newIndex);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: context.sized.mediumValue,
            selectedItemColor: Colors.black,
            currentIndex: state.selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: 'add',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.rectangleList),
                label: 'reels',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
              ),
            ]);
      },
    );
  }

  Widget buildBody() {
    return BlocBuilder<HomeTabsCubit, HomeTabsState>(
      builder: (context, state) {
        final cubit = context.read<HomeTabsCubit>();
        return PageView(
          controller: cubit.pageController,
          physics: (state.selectedPageIndex == 0)
              ? null
              : const NeverScrollableScrollPhysics(),
          children: [
            const CameraView(),
            Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: state.selectedPageIndex,
                    children: [
                      HomeView(
                        messagePageChangeFunction: () =>
                            cubit.switchToMessagesPage(),
                        cameraPageChangeFunction: () =>
                            cubit.switchToCameraPage(),
                      ),
                      SearchView(),
                      NewPostView(),
                      ReelsView(),
                      ProfileView(),
                    ],
                  ),
                ),
                buildBottomNavigationBar(),
              ],
            ),
            const MessagesView(),
          ],
        );
      },
    );
  }
}
