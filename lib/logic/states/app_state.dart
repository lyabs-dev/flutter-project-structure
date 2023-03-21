import 'package:lyabs_dev/logic/responses/app_response.dart';
import 'package:lyabs_dev/utils/enums.dart';

class AppState {

  CustomState loadingState;
  AppResponse? response;

  AppState({this.loadingState = CustomState.loading, this.response});


  AppState copy() {
    AppState copy = AppState(loadingState: loadingState, response: response);

    return copy;
  }

}