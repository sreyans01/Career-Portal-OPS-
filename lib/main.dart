import 'package:flutter/material.dart';
import 'package:ops_portal/form/applicant/applicant_form.dart';


void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  /**
   * Used to build the App main page.
   * Route starts from here.
   * @param context - BuildContext
   */
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApplicantForm(),
    );
  }
}










