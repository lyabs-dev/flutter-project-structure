
enum CustomState {
  loading,
  done,
  error,
}

enum HttpMethod {
  post,
  get,
  put,
  delete
}

enum MessageType {
  dialog,
  toast,
}

enum DialogType {error, success, info, warning}

//this one help to know if the notification must be shown inside the app or it must directly open
// the page related to the notification
enum NotificationMode {inApp, external,}

enum NotificationType {

  none(code: '1'),
  ;

  final String code;

  const NotificationType({required this.code});

  static NotificationType? getType(String code) {
    List<NotificationType> items = NotificationType.values.where((element) => element.code == code).toList();

    if (items.isNotEmpty) {
      return items.first;
    }

    return null;
  }

}