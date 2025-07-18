import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dsproject/core/helper/hivr_helper.dart';
import 'package:dsproject/core/navigation/custom_navigation.dart';
import 'package:dsproject/core/network/network_api.dart';
import 'package:dsproject/core/service/dio_helper.dart';
import 'package:dsproject/core/utils/appToast.dart';
import 'package:dsproject/cubit/Login/login_cubit.dart';
import 'package:dsproject/models/workListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'workList_state.dart';

class WorkListCubit extends Cubit<WorkListState> {
  WorkListCubit() : super(WorkListInitial());

  final _api = DioHelper.instance;

  static WorkListCubit get(BuildContext context) => BlocProvider.of<WorkListCubit>(context);
  List<WorkListModel> WorkListList = [];

  void getWorkList({
    required BuildContext context, // <--- make sure this is here
    StartDate = "",
    EndDate = "",
    DepartmentId = "",
    DepartmentClinicId = "",
    ProviderId = "",
    ChairId = "",
    SearchTxt = "",
    StatusList = const [],
    StudentAssignedStatus = "",
    PageSize = 20,
    PageIndex = 0,
  }) async {
    try {
      emit(WorkListLoading());
      var token = HiveHelper.getToken();
      List<String> selectedStatus = ["Checked In", "Unconfirmed", "Confirmed", "In Progress"];

      await _api
          .postData("${Api.workList}",
              body: {
                "StartDate": "",
                "EndDate": "",
                "DepartmentId": "",
                "DepartmentClinicId": "",
                "ProviderId": "",
                "ChairId": "",
                "SearchTxt": "",
                "StudentAssignedStatus": "",
                "StatusList": selectedStatus,
                "PageSize": 10,
                "PageIndex": 0,
              },
              token: token)
          .then((value) {
        final data = value.data["VisitsList"];
        if (value.statusCode == 200) {
          for (var n in data) {
            WorkListList!.add(WorkListModel.fromJson(n));
          }
          emit(WorkListSuccess());
        }
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
          }
        } else {
          AppToast.showSnackBar(currentContext!, 'unexpected_error_occurred');
        }
      } else {
        AppToast.showSnackBar(currentContext!, 'unexpected_error_occurred');
      }
      emit(WorkListFailure('unexpected_error_occurred'));
    }
  }
}
