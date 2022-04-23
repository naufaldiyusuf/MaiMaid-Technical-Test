import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maimaid_technical_project/api/api.dart';
import 'package:maimaid_technical_project/constant.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    on<ListGetData>(_fetchData);
  }

  void _fetchData(ListGetData event, Emitter<ListState> emit) async {
    emit(ListLoading());

    try {
      ReadResponse response = await ReadService.getReadData(
          ConstantUrl.BASEURL + ConstantUrl.READURL,
          event.page,
          event.offset);

      if (response.status != null && response.status!.code == 200) {
        emit(ListSuccess(response.data!.rows!, event.page + 1));
      } else {
        emit(ListFailed(response.status!.message!));
      }
    } catch(e) {
      print(e);
      emit(ListFailed(e.toString()));
    }
  }
}