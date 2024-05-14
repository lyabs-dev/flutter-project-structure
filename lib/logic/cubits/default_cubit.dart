import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure/logic/responses/app_response.dart';
import 'package:structure/logic/states/default_state.dart';
import 'package:structure/utils/enums.dart';

abstract class DefaultCubit<T extends DefaultState> extends Cubit<T> {

  DefaultCubit(super.initialState) {
    initData();
  }

  void initData();

  Future<void> showMessage({AppCode? code, MessageType type = MessageType.toast}) async {
    await Future.delayed(const Duration(milliseconds: 200));

    if (code != null) {
      state.response = AppResponse(code: code, messageType: type);
    }

    state.isLoading = false;
  }

}