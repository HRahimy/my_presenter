import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:my_presenter/models/email_field.dart';
import 'package:my_presenter/models/message_field.dart';

part 'contact_me_form_state.dart';

class ContactMeFormCubit extends Cubit<ContactMeFormState> {
  ContactMeFormCubit() : super(const ContactMeFormState());

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
}
