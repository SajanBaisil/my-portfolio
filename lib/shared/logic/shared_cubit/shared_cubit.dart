import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_portfolio_flutter/shared/utils/enums.dart';

part 'shared_state.dart';

class SharedCubit extends Cubit<SharedState> {
  SharedCubit() : super(const SharedState());

  Future<void> setSelectedSection(
      {required SelectedSection selectedSection}) async {
    emit(
      state.copyWith(
        selectedSection: selectedSection,
      ),
    );
  }
}
