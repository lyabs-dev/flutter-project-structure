import 'package:structure/logic/cubits/default_cubit.dart';
import 'package:structure/logic/responses/app_response.dart';
import 'package:structure/logic/states/app_state.dart';
import 'package:structure/utils/enums.dart';

class AppCubit extends DefaultCubit<AppState> {

  AppCubit(super.initialState);

  @override
  void initData() {
    state.isLoading = true;
    emit(state.copy());

    state.isLoading = false;
    emit(state.copy());
  }

  @override
  Future<void> showMessage({AppCode? code, MessageType type = MessageType.toast}) async {
    await super.showMessage(code: code, type: type);
    emit(state.copy());
  }

  // Simple test which display a success dialog
  testShowDialog() async {
    await Future.delayed(const Duration(milliseconds: 700));
    showMessage(code: AppCode.success, type: MessageType.dialog);
  }

}