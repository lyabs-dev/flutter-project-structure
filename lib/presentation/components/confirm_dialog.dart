import 'package:lyabs_dev/presentation/components/app_button.dart';
import 'package:lyabs_dev/utils/my_material.dart';

class ConfirmDialog extends StatelessWidget {

  final String title;
  const ConfirmDialog({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15), topLeft: Radius.circular(15))),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.confirm,
                style: const TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: textSizeNormal),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: const TextStyle(
                color: colorPrimary,
                fontWeight: FontWeight.w500,
                fontSize: textSizeLargeMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  context: context,
                  text: AppLocalizations.of(context)!.no,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                SizedBox(
                  width: getShortSize(10, context),
                ),
                AppButton(
                  context: context,
                  text: AppLocalizations.of(context)!.yes,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
