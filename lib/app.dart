import 'package:dsproject/cubit/Login/login_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/bloc_providers.dart';
import 'core/navigation/custom_navigation.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.isUpdated = false});
  final bool isUpdated;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(builder: (_, localeState) {
        return listOfBlocProviders(
          MaterialApp(
            title: 'Dentalore',
            debugShowCheckedModeBanner: false,
            navigatorKey: CustomNavigator.navigatorState,
            onGenerateRoute: CustomNavigator.onCreateRoute,
            navigatorObservers: [
              CustomNavigator.routeObserver,
            ],
            builder: (context, child) {
              return child!;
            },
          ),
        );
      }),
    );
  }
}
