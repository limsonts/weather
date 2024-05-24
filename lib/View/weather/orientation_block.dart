import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum OrientationState { portrait, landscape }

class OrientationCubit extends Cubit<OrientationState> {
  OrientationCubit() : super(OrientationState.portrait);

  void updateOrientation(OrientationState state) => emit(state);
}