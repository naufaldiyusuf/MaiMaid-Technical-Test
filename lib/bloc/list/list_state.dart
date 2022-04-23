part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListLoading extends ListState {}

class ListSuccess extends ListState {
  final List<ReadResponseDataRows> list;
  final int page;

  ListSuccess(this.list, this.page);
}

class ListFailed extends ListState {
  final String message;

  ListFailed(this.message);
}

class ListInitial extends ListState {}