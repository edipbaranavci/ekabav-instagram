import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit() : super(ReelsInitial());
}
