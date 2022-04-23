part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoToListPage extends PageEvent {}

class GoToCreatePage extends PageEvent {}

class GoToDetailUpdatePage extends PageEvent {
  final int id;

  GoToDetailUpdatePage(this.id);
}