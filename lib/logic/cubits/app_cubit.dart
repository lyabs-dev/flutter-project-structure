import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure/data/tests/app_test.dart';
import 'package:structure/logic/responses/app_response.dart';
import 'package:structure/logic/states/app_state.dart';
import 'package:structure/utils/enums.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit(super.initialState) {
    intiData();
  }

  intiData() async {
    AppTest.run();
    state.loadingState = CustomState.loading;
    emit(state.copy());

    state.loadingState = CustomState.done;
    emit(state.copy());
  }

  showMessage({AppCode? code, MessageType type = MessageType.toast}) async {
    await Future.delayed(const Duration(milliseconds: 200));

    if (code != null) {
      state.response = AppResponse(code: code, messageType: type);
    }

    state.loadingState = CustomState.done;
    emit(state.copy());
  }

  // Simple test which display a success dialog
  testShowDialog() async {
    await Future.delayed(const Duration(milliseconds: 700));
    showMessage(code: AppCode.success, type: MessageType.dialog);
  }

}