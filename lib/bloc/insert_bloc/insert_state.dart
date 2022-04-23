part of 'insert_bloc.dart';

abstract class InsertState extends Equatable {
  @override
  List<Object> get props => [];
}

class InsertFailed extends InsertState {
  final String message;

  InsertFailed(this.message);
}

class InsertSuccess extends InsertState {}

class InsertLoading extends InsertState {}

class InsertInitial extends InsertState {}