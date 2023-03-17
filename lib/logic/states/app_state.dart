import 'package:flutter_structure/logic/responses/app_response.dart';
import 'package:flutter_structure/utils/enums.dart';

class AppState {

  CustomState loadingState;
  AppResponse? response;

  AppState({this.loadingState = CustomState.loading, this.response});


  AppState copy() {
    AppState copy = AppState(loadingState: loadingState, response: response);

    return copy;
  }

}