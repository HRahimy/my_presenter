import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:my_presenter/models/email_field.dart';
import 'package:my_presenter/models/message_field.dart';

part 'contact_me_form_state.dart';

class ContactMeFormCubit extends Cubit<ContactMeFormState> {
  ContactMeFormCubit({
    required FirebaseFirestore firestore,
  })  : _firestore = firestore,
        super(const ContactMeFormState());

  final FirebaseFirestore _firestore;

  void openForm() => emit(const ContactMeFormState(opened: true));

  void updateEmail(String newEmail) {
    final email = EmailField.dirty(newEmail);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.description,
      ]),
    ));
  }

  void updateDescription(String newDescription) {
    final description = MessageField.dirty(newDescription);
    emit(state.copyWith(
      description: description,
      status: Formz.validate([
        state.email,
        description,
      ]),
    ));
  }

  Future<void> submitRequest() async {
    emit(state.copyWith(
      status: FormzStatus.submissionInProgress,
    ));
    try {
      CollectionReference contactRequests =
          _firestore.collection('contactRequests');
      await contactRequests.add({
        'email': state.email.value,
        'description': state.description.value,
        'createdOn': DateTime.now().toIso8601String(),
      });

      emit(state.copyWith(
        opened: false,
        status: FormzStatus.submissionSuccess,
        error: '',
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        error: _.toString(),
      ));
    }
  }
}
