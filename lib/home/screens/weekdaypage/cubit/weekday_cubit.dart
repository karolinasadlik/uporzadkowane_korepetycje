import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'weekday_state.dart';

class WeekdayCubit extends Cubit<WeekdayState> {
  WeekdayCubit()
      : super(
          const WeekdayState(
            documents: [],
            errorMessege: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const WeekdayState(
        documents: [],
        errorMessege: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('students')
        .snapshots()
        .listen((data) {
      emit(
        WeekdayState(
          documents: data.docs,
          isLoading: false,
          errorMessege: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          WeekdayState(
            documents: const [],
            isLoading: false,
            errorMessege: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
