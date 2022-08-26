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

enum DialogType {Error, Success, Info, Confirm, Warning}