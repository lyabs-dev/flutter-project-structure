import 'package:awesome_dialog/awesome_dialog.dart';

enum CustomState {
  LOADING,
  DONE,
  ERROR,
}

enum HttpMethod {
  Post,
  Get,
  Put,
  Delete
}

enum MessageType {
  Dialog,
  Toast,
}

//responses codes to be sent from logic to presentation
enum ResponseCode {

  // info codes, starting with 1
  InFo(code: '1'),

  // success codes, starting with 2
  Success(code: '2'),

  // warning codes, starting with 3
  Warning(code: '3'),

  // error codes, stating with 4
  Error(code: '4')
  ;

  final String code;

  const ResponseCode({required this.code,});

  DialogType get type {

    if (code.startsWith('2')) {
      return DialogType.SUCCES;
    }

    if (code.startsWith('3')) {
      return DialogType.WARNING;
    }

    if (code.startsWith('4')) {
      return DialogType.ERROR;
    }

    return DialogType.INFO;
  }

}