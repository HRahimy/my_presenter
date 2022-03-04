import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:formz/formz.dart';
import 'package:my_presenter/models/email_field.dart';
import 'package:my_presenter/models/message_field.dart';
import 'package:uuid/uuid.dart';

part 'contact_me_form_state.dart';

class ContactMeFormCubit extends Cubit<ContactMeFormState> {
  ContactMeFormCubit({
    required FirebaseDatabase database,
  })  : _database = database,
        super(const ContactMeFormState());
  final FirebaseDatabase _database;

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
      final String normalEmail =
          state.email.value.replaceAll(RegExp(r'\.'), '__');
      DatabaseReference ref =
          _database.ref('contactRequests/$normalEmail/${const Uuid().v4()}');
      await ref.set({
        "description": state.description.value,
        "createdOn": DateTime.now().toIso8601String(),
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
