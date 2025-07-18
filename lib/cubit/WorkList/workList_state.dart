part of 'workList_cubit.dart';

@immutable
sealed class WorkListState {}

class WorkListInitial extends WorkListState {}

class WorkListLoading extends WorkListState {}

class WorkListSuccess extends WorkListState {}

class WorkListFailure extends WorkListState {
  final String message;

  WorkListFailure(this.message);
}
