part of 'contact_me_bloc.dart';

class ContactMeState extends Equatable {
  final DataFetchStatus contactAddStatus;
  final ContactDetails? contactDetails;
  final String? errorMessage;

  const ContactMeState(
      {this.contactAddStatus = DataFetchStatus.idle,
      this.contactDetails,
      this.errorMessage});

  @override
  List<Object?> get props => [
        contactAddStatus,
        contactDetails,
        errorMessage,
      ];

  ContactMeState copyWith({
    DataFetchStatus? contactAddStatus,
    ContactDetails? contactDetails,
    String? errorMessage,
  }) {
    return ContactMeState(
      contactAddStatus: contactAddStatus ?? this.contactAddStatus,
      contactDetails: contactDetails ?? this.contactDetails,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
