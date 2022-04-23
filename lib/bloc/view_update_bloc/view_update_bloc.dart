import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:maimaid_technical_project/api/api.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';

part 'view_update_state.dart';
part 'view_update_event.dart';

class ViewUpdateBloc extends Bloc<ViewUpdateEvent, ViewUpdateState> {
  ViewUpdateBloc() : super(ViewUpdateInitial()) {
    on<ViewDetailGetData>(_fetchDataDetail);
    on<UpdateDetailData>(_updateData);
  }

  void _fetchDataDetail(ViewDetailGetData event, Emitter<ViewUpdateState> emit) async {
    emit((ViewUpdateLoading()));

    try {
      ViewResponse response = await ViewService.getViewData(
          ConstantUrl.BASEURL + ConstantUrl.VIEWURL,
          event.id
      );

      if (response.status != null && response.status!.code == 200) {
        emit(ViewDetailSuccess(response.data!));
      } else {
        emit(ViewUpdateFailed(response.status!.message!));
      }
    } catch(e) {
      print(e);
    }
  }

  void _updateData(UpdateDetailData event, Emitter<ViewUpdateState> emit) async {
    emit(ViewUpdateLoading());

    try {
      final response = await http.post(
          Uri.parse(ConstantUrl.BASEURL + ConstantUrl.UPDATEURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "id": "${event.id}",
          "fullname": "${event.fullName}",
          "email": "${event.email}",
          "password": "${event.password}",
          "gender": "${event.gender}",
          "dob": "${event.dob}"
        }),
      );

      UpdateResponse? responseData = UpdateResponse.fromJson(jsonDecode(response.body));

      if (responseData.status!.code == 200) {
        emit(UpdateDataSuccess());
      } else {
        emit(ViewUpdateFailed(responseData.status!.message!));
      }
    } catch(e) {
      print(e);
      emit(ViewUpdateFailed(e.toString()));

    }
  }
}