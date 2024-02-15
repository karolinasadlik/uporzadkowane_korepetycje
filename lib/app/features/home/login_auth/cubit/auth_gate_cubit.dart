import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'auth_gate_state.dart';

class AuthGateCubit extends Cubit<AuthGateState> {
  AuthGateCubit() : super(AuthGateState());
}
