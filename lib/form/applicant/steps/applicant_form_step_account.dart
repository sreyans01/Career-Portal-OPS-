import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:ops_portal/form/applicant/applicant_form_bloc.dart';

FormBlocStep AccountStep(ApplicantFormBloc applicantFormBloc) {
  return FormBlocStep(
    title: const Text('Account'),
    content: Column(
      children: <Widget>[
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.username,
          keyboardType: TextInputType.emailAddress,
          enableOnlyWhenFormBlocCanSubmit: true,
          decoration: const InputDecoration(
            labelText: 'Username',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.email,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.password,
          keyboardType: TextInputType.emailAddress,
          suffixButton: SuffixButton.obscureText,
          decoration: const InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    ),
  );
}