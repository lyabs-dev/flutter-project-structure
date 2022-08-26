
import 'package:flutter_structure/presentation/components/circle_button.dart';
import 'package:flutter_structure/utils/my_material.dart';

class DialogConfirm extends StatelessWidget {
  final String title;
  const DialogConfirm({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: COLOR_PRIMARY,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.confirm,
              style: TextStyle(
                  color: COLOR_WHITE,
                  fontWeight: FontWeight.w600,
                  fontSize: TEXT_SIZE_NORMAL),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
           title,
            style: TextStyle(
                color: COLOR_PRIMARY,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_SIZE_LARGE_MEDIUM,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleButton(
                Icons.close,
                () {
                  Navigator.of(context).pop(false);
                },
                height: 35,
              ),
              SizedBox(
                width: getShortSize(10),
              ),
              CircleButton(
                Icons.done,
                () {
                  Navigator.of(context).pop(true);
                },
                height: 35,
              )
            ],
          ),
        )
      ],
    );
  }
}
