import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  BuildContext context;

  PageBloc(this.context) : super(PageInitial()) {
    on<GoToCreatePage>((event, emit) {
      emit(OnCreatePage());
    });

    on<GoToDetailUpdatePage>((event, emit) {
      emit(OnDetailUpdatePage(event.id));
    });

    on<GoToListPage>((event, emit) {
      emit(OnListPage());
    });
  }
}