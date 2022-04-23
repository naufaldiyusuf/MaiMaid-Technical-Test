import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:maimaid_technical_project/api/api.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';

part 'insert_event.dart';
part 'insert_state.dart';

class InsertBloc extends Bloc<InsertEvent, InsertState> {
  InsertBloc() : super(InsertInitial()) {
    on<InsertData>(_updateData);
  }


  void _updateData(InsertData event, Emitter<InsertState> emit) async {
    emit((InsertLoading()));

    try {
      final response = await http.post(
          Uri.parse(ConstantUrl.BASEURL + ConstantUrl.CREATEURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "fullname": "${event.fullName}",
          "email": "${event.email}",
          "password": "${event.password}",
          "gender": "${event.gender}",
          "dob": "${event.dob}"
        }),
      );

      WriteResponse? responseData = WriteResponse.fromJson(jsonDecode(response.body));

      if (responseData.status!.code == 200) {
        emit(InsertSuccess());
      } else {
        emit(InsertFailed(responseData.status!.message!));
      }
    } catch(e) {
      print(e);
      emit(InsertFailed(e.toString()));
    }
  }
}