import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:ops_portal/common/loading_dialog.dart';
import 'package:ops_portal/common/success_screen.dart';
import 'package:ops_portal/form/applicant/applicant_form_bloc.dart';

class ApplicantForm extends StatefulWidget {
  const ApplicantForm({Key? key}) : super(key: key);

  @override
  _ApplicantFormState createState() => _ApplicantFormState();
}


class _ApplicantFormState extends State<ApplicantForm> {
  var _type = StepperType.horizontal;
  bool isRequiredWhatsapp = true;

  void _toggleType() {
    setState(() {
      if (_type == StepperType.horizontal) {
        _type = StepperType.vertical;
      } else {
        _type = StepperType.horizontal;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplicantFormBloc(),
      child: Builder(
        builder: (context) {
          return Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('Autel'),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(_type == StepperType.horizontal
                          ? Icons.swap_vert
                          : Icons.swap_horiz),
                      onPressed: _toggleType)
                ],
              ),
              body: SafeArea(
                child: FormBlocListener<ApplicantFormBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSubmissionFailed: (context, state) => LoadingDialog.hide(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);

                    if (state.stepCompleted == state.lastStep) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const SuccessScreen()));
                    }
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                  },
                  child: StepperFormBlocBuilder<ApplicantFormBloc>(
                    formBloc: context.read<ApplicantFormBloc>(),
                    type: _type,
                    physics: const ClampingScrollPhysics(),
                    stepsBuilder: (formBloc) {
                      return [
                        _accountStep(formBloc!),
                        _personalStep(formBloc),
                        _socialStep(formBloc),
                      ];
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  FormBlocStep _accountStep(ApplicantFormBloc applicantFormBloc) {
    applicantFormBloc.whatsappCheck.stream.listen((event) {
      if (applicantFormBloc.whatsappCheck.state.value) {
        applicantFormBloc.removeFieldBloc(fieldBloc: applicantFormBloc.whatsapp, step: 0);
      } else {
        applicantFormBloc.addFieldBloc(fieldBloc: applicantFormBloc.whatsapp, step: 0);
      }
    });
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
          TextFieldBlocBuilder(
            textFieldBloc: applicantFormBloc.contact,
            keyboardType: TextInputType.phone,
            enableOnlyWhenFormBlocCanSubmit: true,
            decoration: const InputDecoration(
              labelText: 'Contact no.',
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          CheckboxFieldBlocBuilder(
              booleanFieldBloc: applicantFormBloc.whatsappCheck,
              padding: EdgeInsets.zero,
              body: Text("Whatsapp no. is same as contact no."),
          ),
          TextFieldBlocBuilder(
            textFieldBloc: applicantFormBloc.whatsapp,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Whatsapp no.',
              prefixIcon: Icon(Icons.whatsapp),
            ),
          ),
        ],
      ),
    );
  }

  FormBlocStep _personalStep(ApplicantFormBloc applicantFormBloc) {
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

  FormBlocStep _socialStep(ApplicantFormBloc applicantFormBloc) {
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


}