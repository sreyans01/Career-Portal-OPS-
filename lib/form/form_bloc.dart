import 'dart:ffi';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:ops_portal/form/form_bloc.dart';

part 'form_state.dart';

enum FormEvent { increment, decrement }

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormState(counterValue: 0));

  @override
  Stream<FormState> mapEventToState(FormEvent event) async* {
    switch (event) {
      case FormEvent.increment:
        incrementCounter();
        break;
      case FormEvent.decrement:
        yield FormState(counterValue: state.counterValue - 1);
        break;
    }
  }

  Stream<void> incrementCounter() async* {
    yield FormState(counterValue: state.counterValue + 1);
  }
}