part of 'insert_bloc.dart';

abstract class InsertEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InsertData extends InsertEvent {
  final String fullName;
  final String email;
  final String password;
  final int gender;
  final String dob;

  InsertData(this.fullName, this.email, this.password, this.gender, this.dob);
}