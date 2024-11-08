import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_post_state.dart';

class NewPostCubit extends Cubit<NewPostState> {
  NewPostCubit() : super(NewPostInitial());
}
