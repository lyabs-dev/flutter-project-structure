import '../../utils/my_material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          PathAnimation.searchEmpty,
          height: 200,
          repeat: true,
          fit: BoxFit.fill,
        ),
        SizedBox(height: paddingLarge.r),
        Text(AppLocalizations.of(context)!.noResultFound,
            style: const TextStyle(color: colorError, fontSize: textSizeNormal, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
