import '../../../utils/my_material.dart';

class ErrorPage extends StatelessWidget {
  final String title, description;
  final Function()? onTry;

  const ErrorPage({super.key, required this.title, required this.description, this.onTry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height, minWidth: MediaQuery.of(context).size.width),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: colorError, fontSize: textSizeNormal, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: colorError,
                      fontSize: textSizeSmall,
                    ),
                  ),
                Image(
                    filterQuality: FilterQuality.high,
                    image: AssetImage(
                      PathImage.notFound,
                    ),
                  ),
                  Visibility(
                    visible: onTry != null,
                    child: AppButtonWidget(
                      context: context,
                      text: AppLocalizations.of(context)!.tryAgain,
                      onPressed: (onTry != null) ? onTry! : () {},
                      paddingHorizontal: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
