import 'package:structure/logic/responses/app_response.dart';
import 'package:structure/logic/states/default_state.dart';

class AppState extends DefaultState<AppResponse> {

  AppState({super.response, super.isLoading = true,});

  @override
  AppState copy() {
    AppState copy = AppState(response: response, isLoading: isLoading,);

    return copy;
  }

}