import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dsproject/core/helper/hivr_helper.dart';
import 'package:dsproject/core/navigation/custom_navigation.dart';
import 'package:dsproject/core/navigation/routes.dart';
import 'package:dsproject/core/network/network_api.dart';
import 'package:dsproject/core/utils/Log_utils.dart';
import 'package:dsproject/core/utils/appToast.dart';
import 'package:dsproject/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(BuildContext context) => BlocProvider.of<LoginCubit>(context);

  UserModel? user;

  final Dio dio = Dio(
    BaseOptions(
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      receiveDataWhenStatusError: true,
    ),
  );

  void login(String username, String password) async {
    emit(LoginLoading());

    try {
      await dio.post(
        "${Api.login}",
        data: {
          "Username": username,
          "Password": password,
        },
      ).then((value) {
        final data = value.data;

        if (value.statusCode == 200) {
          user = UserModel.fromJson(data);

          HiveHelper.setToken(user?.token);
        }
        emit(LoginSuccess());
        CustomNavigator.push(Routes.WORKLIST_SCREEN, clean: true);
      });
    } catch (error) {
      if (error is DioException) {
        if (error.type == DioExceptionType.connectionTimeout) {
          AppToast.showSnackBar(currentContext!, 'connection_timed_out');
        } else if (error.type == DioExceptionType.badResponse) {
          if (error.response!.statusCode == 400) {
            AppToast.showSnackBar(currentContext!, error.response!.data["Message"]);
          } else if (error.response!.statusCode == 404) {
            AppToast.showSnackBar(currentContext!, 'api_not_found');
          } else {
            AppToast.showSnackBar(currentContext!, "${error.message ?? ''}  ${error.response!.statusMessage!}");
            Log.e("${error.message ?? ''}  ${error.response!.statusMessage!}");
          }
        } else {
          AppToast.showSnackBar(currentContext!, 'unexpected_error_occurred');
        }
      } else {
        AppToast.showSnackBar(currentContext!, 'unexpected_error_occurred');
      }
      emit(LoginFailure('unexpected_error_occurred'));
    }
  }
}
