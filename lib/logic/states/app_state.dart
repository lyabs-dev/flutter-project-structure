import 'package:flutter_structure/utils/enums.dart';

class AppState {

  CustomState loadingState;

  AppState({this.loadingState = CustomState.loading,});


  AppState copy() {
    AppState copy = AppState(loadingState: loadingState,);

    return copy;
  }

}