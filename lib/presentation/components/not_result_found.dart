import '../../utils/my_material.dart';

class NotResultFound extends StatelessWidget {
  const NotResultFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          PathAnimation.notResultFound,
          height: 200,
          repeat: false,
          fit: BoxFit.fill,
        ),
        SizedBox(height: paddingLarge.r),
        Text(AppLocalizations.of(context)!.noResultFound,
            style: const TextStyle(color: colorError, fontSize: textSizeNormal, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
