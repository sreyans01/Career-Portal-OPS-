import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:ops_portal/form/applicant/applicant_form_bloc.dart';

FormBlocStep PersonalStep(ApplicantFormBloc applicantFormBloc) {
  return FormBlocStep(
    title: const Text('Personal'),
    content: Column(
      children: <Widget>[
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.firstName,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'First Name',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextFieldBlocBuilder(
          textFieldBloc: applicantFormBloc.lastName,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Last Name',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        RadioButtonGroupFieldBlocBuilder<String>(
          selectFieldBloc: applicantFormBloc.gender,
          itemBuilder: (context, value) => FieldItem(
            child: Text(value),
          ),
          decoration: const InputDecoration(
            labelText: 'Gender',
            prefixIcon: SizedBox(),
          ),
        ),
        DateTimeFieldBlocBuilder(
          dateTimeFieldBloc: applicantFormBloc.birthDate,
          firstDate: DateTime(1900),
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          format: DateFormat('yyyy-MM-dd'),
          decoration: const InputDecoration(
            labelText: 'Date of Birth',
            prefixIcon: Icon(Icons.cake),
          ),
        ),
      ],
    ),
  );
}
