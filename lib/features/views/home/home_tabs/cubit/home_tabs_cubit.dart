import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tabs_state.dart';

class HomeTabsCubit extends Cubit<HomeTabsState> {
  HomeTabsCubit() : super(HomeTabsInitial());

  final PageController pageController = PageController(initialPage: 1);

  void switchToMessagesPage() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void switchToCameraPage() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void changeSelectedPageIndex(int newIndex) {
    emit(state.copyWith(selectedPageIndex: newIndex));
  }
}
