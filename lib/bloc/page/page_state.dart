part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  @override
  List<Object> get props => [];
}

class PageInitial extends PageState {}

class OnCreatePage extends PageState {}

class OnDetailUpdatePage extends PageState {
  final int id;

  OnDetailUpdatePage(this.id);
}

class OnListPage extends PageState {}