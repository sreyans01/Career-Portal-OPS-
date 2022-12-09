import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:ops_portal/network/dummy_client.dart';
import 'package:dio/dio.dart';
import 'package:ops_portal/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

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

  final hasUploadedProfileImage = BooleanFieldBloc();

  final hasUploadedResume = BooleanFieldBloc();

  final profileImage = TextFieldBloc();

  final resume = TextFieldBloc(validators: [FieldBlocValidators.required]);

  ApplicantFormBloc() {
    addFieldBlocs(step: 0, fieldBlocs: [
      hasUploadedProfileImage,
      hasUploadedResume,
      profileImage,
      resume
    ]);
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
    Log.i("KKKKKK", "init");
    switch (state.currentStep) {
      case 0:
        await Future.delayed(const Duration(milliseconds: 500));
        Log.i("KKKKKK", "object");
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

  bool _emailAlreadyTaken(String email) {
    return false;
  }

  void updateUserDummyData() async {
    DummyData data = DummyData(
        iId: 1,
        userId: 10425,
        firstName: "Sreyans",
        lastName: "Bohara",
        profileURL: "",
        resumeURL: "",
        phoneNo: "4545758996",
        whatsappNo: "4545968755",
        skypeId: "sreyans01",
        email: "sbohara@autelrobotics.com",
        location: "bangalore",
        currentSalary: 1000,
        expectedSalary: 2000,
        remarks: "I love coding!");
    var dio = await Dio();
    dio.options.contentType = "multipart/form-data";
    Log.i("JJJJJJJJJ", "data before = " + data.toJson().toString());
    DummyClient(dio).updateUserDataDummy(data).catchError((e) {
      print("JJJJJJJJ error " + e.toString());
    }).whenComplete(() {
      print("JJJJJJJJ completed");
    });
  }

  void updateUserDummyData2() async {
    DummyData2 data = DummyData2(name: "sreyans", salary: "12000", age: "23");

    var dio = await Dio();
    Log.i("JJJJJJJJJ", "data before = " + data.toJson().toString());
    DummyClient(dio, baseUrl: "https://dummy.restapiexample.com/api/v1")
        .updateUserDataDummy2(data)
        .catchError((e) {
      print("JJJJJJJJ error " + e.toString());
    }).whenComplete(() {
      print("JJJJJJJJ completed");
    });
  }

  Future<File?> pickFile({FileType fileType = FileType.any}) async {
    //Request for permission if not requested
    File? file;
    // Status 1 means permission granted
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: fileType);
    if (result != null && result.files.single.path != null) {
      file = File(result.files.single.path!);
    }
    return file;
  }
}
