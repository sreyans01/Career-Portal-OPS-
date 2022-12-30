import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:ops_portal/network/form_client.dart';

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

  final skype = TextFieldBloc();

  final linkedIn = TextFieldBloc();

  final profileImageUrl = TextFieldBloc(validators: []);

  final resumeUrl = TextFieldBloc(validators: []);

  ApplicantFormBloc() {
    addFieldBlocs(step: 0, fieldBlocs: [profileImageUrl, resumeUrl]);
    addFieldBlocs(
      step: 1,
      fieldBlocs: [username, email, password, contact, whatsapp, whatsappCheck],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [firstName, lastName, gender, birthDate],
    );
    addFieldBlocs(
      step: 3,
      fieldBlocs: [github, skype, linkedIn],
    );
  }

  @override
  void onSubmitting() async {
    switch (state.currentStep) {
      case 0:
        //TODO: Add check for profileImage/resume uploaded or not. Have removed it due to api issues
        emitSuccess();
        break;
      case 1:
        await Future.delayed(const Duration(milliseconds: 500));
        if (_emailAlreadyTaken("")) {
          email.addFieldError('That email is already taken');
          emitFailure();
        } else {
          emitSuccess();
        }
        break;
      case 2:
        emitSuccess();
        break;
      case 3:
        await Future.delayed(const Duration(milliseconds: 500));
        emitSuccess();
    }
  }

  /**
   * Checks if the user exists or not, either by email or by username
   */
  bool _emailAlreadyTaken(String email) {
    //TODO:(Not yet implemented)
    return false;
  }

  /**
   * Get all users/applicants list
   * @return - A future object of List<Applicant> which stores the applicants data in a list.
   */
  Future<List<Applicant>> getApplicantDetails() async {
    List<Applicant> applicants = await FormClient(Dio())
        .getAllApplicantDetails()
        .catchError((e) => throw e)
        .then((value) => value);
    return applicants;
  }
}
