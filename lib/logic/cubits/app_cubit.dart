import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/data/tests/app_test.dart';
import 'package:flutter_structure/logic/states/app_state.dart';
import 'package:flutter_structure/utils/enums.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit(AppState initialState) : super(initialState) {
    intiData();
  }

  intiData() async {
    AppTest.run();
    state.loadingState = CustomState.LOADING;
    emit(state.copy());

    state.loadingState = CustomState.DONE;
    emit(state.copy());
  }

}