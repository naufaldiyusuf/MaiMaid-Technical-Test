part of 'view_update_bloc.dart';

abstract class ViewUpdateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewDetailGetData extends ViewUpdateEvent {
  final int id;

  ViewDetailGetData(this.id);
}

class UpdateDetailData extends ViewUpdateEvent {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final int gender;
  final String dob;

  UpdateDetailData(this.id, this.fullName, this.email, this.password, this.gender, this.dob);
}