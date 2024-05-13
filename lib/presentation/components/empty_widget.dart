import '../../utils/my_material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          PathAnimation.emptyBox,
          height: 200,
          repeat: false,
          fit: BoxFit.fill,
        ),
        SizedBox(height: paddingLarge.r),
        Text(AppLocalizations.of(context)!.empty,
            style: const TextStyle(color: colorError, fontSize: textSizeNormal, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
