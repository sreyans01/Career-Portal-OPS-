import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:ops_portal/form/applicant/applicant_form_bloc.dart';

FormBlocStep SocialStep(ApplicantFormBloc applicantFormBloc) {
  return FormBlocStep(
    title: const Text('Social'),
    content: Column(
      children: <Widget>[
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.github,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Github',
            prefixIcon: Icon(Icons.sentiment_satisfied),
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.twitter,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Twitter',
            prefixIcon: Icon(Icons.sentiment_satisfied),
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.facebook,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Facebook',
            prefixIcon: Icon(Icons.sentiment_satisfied),
          ),
        ),
      ],
    ),
  );
}
