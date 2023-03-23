import 'package:lyabs_dev/presentation/components/app_button.dart';
import 'package:lyabs_dev/presentation/components/box_dialog.dart';
import 'package:lyabs_dev/presentation/components/confirm_dialog.dart';
import 'package:lyabs_dev/utils/my_material.dart';

class AppDialog extends StatelessWidget {

  final String title;
  final String description;
  final DialogType type;
  final Function()? onButtonPressed;

  final BuildContext context;

  const AppDialog({Key? key, required this.title, required this.description, required this.type, this.onButtonPressed,
    required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            iconPath,
            height: 120,
            color: colorPrimary,
          ),
          Text(
            title,
            style: const TextStyle(
                color: colorPrimary,
                fontSize: textSizeLargeMedium,
                fontWeight: FontWeight.w900),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: colorPrimary,
              fontSize: textSizeLargeMedium,
            ),
          ),
          const SizedBox(height: 8,),
          AppButton(
            context: context,
            text: textOnButton,
            onPressed: () {
              if (onButtonPressed != null) {
                onButtonPressed!();
              }
              Navigator.of(context).pop();
            },
            paddingHorizontal: 30,
          ),
        ],
      ),
    );
  }

  String get iconPath {
    switch (type) {
      case DialogType.error:
        return PathIcons.error;
      case DialogType.success:
        return PathIcons.success;
      case DialogType.info:
        return PathIcons.info;
      case DialogType.warning:
        return PathIcons.warning;
    }
  }

  String get textOnButton {
    switch (type) {
      case DialogType.error:
        return AppLocalizations.of(context)!.tryAgain;
      case DialogType.success:
        return AppLocalizations.of(context)!.done;
      case DialogType.info:
      case DialogType.warning:
        return AppLocalizations.of(context)!.ok;
    }
  }

  static Future showConfirmDialog(BuildContext context, String title) async {
    return showDialog(
        context: context,
        barrierColor: colorBlack.withOpacity(0.7),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BoxDialog(
              height: 200,
              child: ConfirmDialog(title: title),
          );
        }
    );
  }

}