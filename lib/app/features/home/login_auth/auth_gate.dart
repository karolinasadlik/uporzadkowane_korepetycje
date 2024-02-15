import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/home_page_context.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:uporzadkowane_korepetycje/app/features/home/login_auth/cubit/auth_gate_cubit.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthGateCubit(),
      child: BlocBuilder<AuthGateCubit, AuthGateState>(
        builder: (context, state) {
        // if (!state.) {
        //           return SignInScreen(
        //             providers: [
        //               EmailAuthProvider(),
        //             ],
        //           );
        //         }

        //         return const HomePage();





          return StreamBuilder<auth.User?>(
              stream: auth.FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SignInScreen(
                    providers: [
                      EmailAuthProvider(),
                    ],
                  );
                }

                return const HomePage();
              });
        },
      ),
    );
  }
}
