part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ListGetData extends ListEvent {
  final int page;
  final int offset;

  ListGetData(this.page, this.offset);
}
