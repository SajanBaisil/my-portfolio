import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio_flutter/features/contact-me/domain/model/contact_model.dart';
import 'package:my_portfolio_flutter/features/contact-me/domain/repository/contact_me_repository.dart';

class ContactMeService implements ContactMeRepository {
  @override
  Future<bool> addContact({required ContactDetails? contactDetails}) async {
    try {
      await FirebaseFirestore.instance.collection('contacts').add({
        'first_name': contactDetails?.name,
        'last_name': contactDetails?.lastName,
        'email': contactDetails?.email,
        'phone': contactDetails?.phone,
        'message': contactDetails?.message,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      return false;
    }
    return true;
  }
}
