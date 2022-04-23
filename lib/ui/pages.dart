import 'package:another_flushbar/flushbar.dart';
import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:maimaid_technical_project/api/api.dart';
import 'package:maimaid_technical_project/bloc/insert_bloc/insert_bloc.dart';
import 'package:maimaid_technical_project/bloc/list/list_bloc.dart';
import 'package:maimaid_technical_project/bloc/page/page_bloc.dart';
import 'package:maimaid_technical_project/bloc/view_update_bloc/view_update_bloc.dart';
import 'dart:convert';

part 'wrapper.dart';
part 'read_page.dart';
part 'view_update_page.dart';
part 'insert_page.dart';