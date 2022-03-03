import 'package:formz/formz.dart';

enum MessageFieldValidationError { empty }

class MessageField extends FormzInput<String, MessageFieldValidationError> {
  const MessageField.pure() : super.pure('');

  const MessageField.dirty([String value = '']) : super.dirty(value);

  @override
  MessageFieldValidationError? validator(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : MessageFieldValidationError.empty;
  }
}
