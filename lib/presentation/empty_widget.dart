import '../utils/my_material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height, minWidth: MediaQuery.of(context).size.width),
            child: IntrinsicHeight(
              child: Column(
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
              ),
            )));
  }
}
