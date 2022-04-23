import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maimaid_technical_project/bloc/list/list_bloc.dart';

import 'package:maimaid_technical_project/bloc/page/page_bloc.dart';
import 'package:maimaid_technical_project/bloc/view_update_bloc/view_update_bloc.dart';
import 'package:maimaid_technical_project/ui/pages.dart';

import 'bloc/insert_bloc/insert_bloc.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PageBloc(context)),
          BlocProvider(create: (context) => ListBloc()),
          BlocProvider(create: (context) => ViewUpdateBloc()),
          BlocProvider(create: (context) => InsertBloc())
        ],
        child: MaterialApp(
          home: Wrapper()
        ));
  }
}
