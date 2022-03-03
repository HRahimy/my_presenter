import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_presenter/bloc/contact_me_form/contact_me_form_cubit.dart';

class ContactMeForm extends StatelessWidget {
  const ContactMeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Please submit these details and I\'ll get back to you ASAP',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          const _EmailField(),
          const Padding(padding: EdgeInsets.only(top: 12)),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Describe your problem',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Send'),
          ),
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