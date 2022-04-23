part of 'view_update_bloc.dart';

abstract class ViewUpdateState extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewDetailSuccess extends ViewUpdateState {
  final ViewResponseData list;

  ViewDetailSuccess(this.list);
}

class ViewUpdateFailed extends ViewUpdateState {
  final String message;

  ViewUpdateFailed(this.message);
}

class UpdateDataSuccess extends ViewUpdateState {}

class ViewUpdateLoading extends ViewUpdateState {}

class ViewUpdateInitial extends ViewUpdateState {}