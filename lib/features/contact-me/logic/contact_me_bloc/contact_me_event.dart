part of 'contact_me_bloc.dart';

sealed class ContactMeEvent extends Equatable {
  const ContactMeEvent();

  @override
  List<Object?> get props => [];
}

class AddContactDetailsToCloud extends ContactMeEvent {
  const AddContactDetailsToCloud(this.contactDetails);
  final ContactDetails? contactDetails;

  @override
  List<Object?> get props => [contactDetails];
}
