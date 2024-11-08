// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_tabs_cubit.dart';

class HomeTabsState extends Equatable {
  const HomeTabsState({
    this.selectedPageIndex = 0,
  });

  final int selectedPageIndex;

  @override
  List<Object> get props => [selectedPageIndex];

  HomeTabsState copyWith({
    int? selectedPageIndex,
  }) {
    return HomeTabsState(
      selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
    );
  }
}

final class HomeTabsInitial extends HomeTabsState {}
