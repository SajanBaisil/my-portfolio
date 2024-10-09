import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_portfolio_flutter/features/contact-me/domain/model/contact_model.dart';
import 'package:my_portfolio_flutter/features/contact-me/domain/service/contact_me_service.dart';
import 'package:my_portfolio_flutter/shared/utils/data_fetch_status.dart';

part 'contact_me_event.dart';
part 'contact_me_state.dart';

class ContactMeBloc extends Bloc<ContactMeEvent, ContactMeState> {
  ContactMeBloc() : super(const ContactMeState()) {
    on<AddContactDetailsToCloud>(_onContactMe);
  }

  FutureOr<void> _onContactMe(
      AddContactDetailsToCloud event, Emitter<ContactMeState> emit) async {
    emit(state.copyWith(
      contactAddStatus: DataFetchStatus.waiting,
      contactDetails: event.contactDetails,
    ));
    await Future.delayed(const Duration(milliseconds: 3000));
    final response = await ContactMeService()
        .addContact(contactDetails: state.contactDetails);

    if (response) {
      emit(state.copyWith(
        contactAddStatus: DataFetchStatus.success,
      ));
    } else {
      emit(state.copyWith(
        contactAddStatus: DataFetchStatus.failed,
        errorMessage: 'Failed to submit details',
      ));
    }
  }
}
