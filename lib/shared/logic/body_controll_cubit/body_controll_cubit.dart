import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'body_controll_state.dart';

class BodyControllCubit extends Cubit<BodyControllState> {
  BodyControllCubit() : super(const BodyControllState());

  Future<void> setIsExpanded() async {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }
}
