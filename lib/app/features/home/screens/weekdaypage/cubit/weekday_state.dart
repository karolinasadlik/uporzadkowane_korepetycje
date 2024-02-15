part of 'weekday_cubit.dart';

@immutable
class WeekdayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessege;

  const WeekdayState({
    required this.documents,
    required this.isLoading,
    required this.errorMessege,
  });
}
