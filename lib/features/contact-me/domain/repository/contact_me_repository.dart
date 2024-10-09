import 'package:my_portfolio_flutter/features/contact-me/domain/model/contact_model.dart';

abstract class ContactMeRepository {
  const ContactMeRepository();

  Future<bool> addContact({
    required ContactDetails contactDetails,
  });
}
