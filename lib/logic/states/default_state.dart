
abstract class DefaultState<Response> {

  bool isLoading;
  Response? response;

  DefaultState({this.isLoading = true, this.response});

  /// Creates a copy of this [DefaultState].
  ///
  /// It is necessary to create a copy of the state to avoid
  /// getting the same instance of the state in the Bloc.
  DefaultState copy();

}