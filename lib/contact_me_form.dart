import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_presenter/bloc/contact_me_form/contact_me_form_cubit.dart';

class ContactMeForm extends StatelessWidget {
  const ContactMeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            'Please submit these details and I\'ll get back to you ASAP',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Padding(padding: EdgeInsets.only(top: 12)),
          _EmailField(),
          Padding(padding: EdgeInsets.only(top: 12)),
          _DescriptionField(),
          Padding(padding: EdgeInsets.only(top: 12)),
          _SubmitButton(),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactMeFormCubit>();
    return BlocBuilder<ContactMeFormCubit, ContactMeFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: cubit.state.email.value,
          onChanged: (value) => cubit.updateEmail(value),
          decoration: InputDecoration(
            labelText: 'Email address',
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(),
            errorText: state.email.errorText,
          ),
        );
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactMeFormCubit>();
    return BlocBuilder<ContactMeFormCubit, ContactMeFormState>(
      builder: (context, state) {
        return TextFormField(
          maxLines: 4,
          initialValue: cubit.state.description.value,
          onChanged: (value) => cubit.updateDescription(value),
          decoration: InputDecoration(
            labelText: 'Describe your problem',
            fillColor: Colors.white,
            filled: true,
            errorText: state.description.errorText,
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactMeFormCubit>();
    return BlocBuilder<ContactMeFormCubit, ContactMeFormState>(
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(),
          );
        }
        return ElevatedButton(
          onPressed:
              state.status.isValidated ? () => cubit.submitRequest() : null,
          child: const Text('Send'),
        );
      },
    );
  }
}
