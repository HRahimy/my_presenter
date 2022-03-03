part of 'contact_me_form_cubit.dart';

class ContactMeFormState extends Equatable {
  const ContactMeFormState({
    this.opened = false,
    this.email = const EmailField.pure(),
    this.description = const MessageField.pure(),
    this.status = FormzStatus.pure,
    this.error = '',
  });

  final bool opened;
  final EmailField email;
  final MessageField description;
  final FormzStatus status;
  final String error;

  ContactMeFormState copyWith({
    bool? opened,
    EmailField? email,
    MessageField? description,
    FormzStatus? status,
    String? error,
  }) {
    return ContactMeFormState(
      opened: opened ?? this.opened,
      email: email ?? this.email,
      description: description ?? this.description,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        opened,
        email,
        description,
        status,
        error,
      ];
}
