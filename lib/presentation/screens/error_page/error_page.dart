import 'package:flutter_structure/presentation/components/app_button.dart';

import '../../../utils/my_material.dart';

class ErrorPage extends StatelessWidget {

  final String title, description;
  final Function()? onTry;

  const ErrorPage({Key? key, required this.title, required this.description,
    this.onTry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: SizeConfig.screenHeight,
                minWidth: SizeConfig.screenWidth),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: colorPrimary,
                      fontSize: textSizeNormal, fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: colorPrimary,
                      fontSize: textSizeSmall,
                    ),
                  ),
                  Image(
                    filterQuality: FilterQuality.high,
                    height: getProportionateScreenHeight(270),
                    width: getProportionateScreenWidth(270),
                    color: colorPrimary,
                    image: AssetImage(
                      PathImage.notFound,
                    ),
                  ),
                  Visibility(
                    visible: onTry != null,
                    child: AppButton(
                      AppLocalizations.of(context)!.tryAgain,
                      (onTry!= null)? onTry!: () {},
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