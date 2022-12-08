import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ApplicantFormBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  final email = TextFieldBloc<String>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars,
    ],
  );

  final contact = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );

  final whatsapp = TextFieldBloc<String>(
    validators: [FieldBlocValidators.required],
  );

  final whatsappCheck = BooleanFieldBloc();

  final firstName = TextFieldBloc();

  final lastName = TextFieldBloc();

  final gender = SelectFieldBloc(
    items: ['Male', 'Female'],
  );

  final birthDate = InputFieldBloc<DateTime?, Object>(
    initialValue: null,
    validators: [FieldBlocValidators.required],
  );

  final github = TextFieldBloc();

  final twitter = TextFieldBloc();

  final facebook = TextFieldBloc();

  ApplicantFormBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [username, email, password, contact, whatsapp, whatsappCheck],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [firstName, lastName, gender, birthDate],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [github, twitter, facebook],
    );
  }


  @override
  void onSubmitting() async {
    switch(state.currentStep) {
      case 0:
        await Future.delayed(const Duration(milliseconds: 500));
        if (_emailAlreadyTaken("")) {
          email.addFieldError('That email is already taken');
          emitFailure();
        } else {
          emitSuccess();
        }
        break;
      case 1:
        emitSuccess();
        break;
      case 2:
        await Future.delayed(const Duration(milliseconds: 500));
        emitSuccess();

    }
  }

  bool _emailAlreadyTaken(String email) {
    return false;
  }

}