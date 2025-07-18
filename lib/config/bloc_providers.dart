// // ignore_for_file: lines_longer_than_80_chars

import 'package:dsproject/cubit/Login/login_cubit.dart';
import 'package:dsproject/cubit/WorkList/workList_cubit.dart';
import 'package:dsproject/features/screens/workList/workList_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider listOfBlocProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => WorkListCubit()),
    ],
    child: child,
  );
}
