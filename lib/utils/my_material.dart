library widget;

export 'package:flutter/material.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:lottie/lottie.dart';

//components
export 'package:structure/presentation/components/app_button.dart';
export 'package:structure/presentation/components/app_dialog.dart';
export 'package:structure/presentation/components/page_container.dart';

//utils
export 'package:structure/utils/path_assets.dart';
export 'package:structure/utils/constants.dart';
export 'package:structure/utils/size_config.dart';
export 'package:structure/utils/enums.dart';

//data
export 'package:structure/data/models/settings_item.dart';
export 'package:structure/data/repositories/settings_repository.dart';

//logic
export 'package:structure/logic/cubits/settings_cubit.dart';
export 'package:structure/logic/states/settings_state.dart';

//presentation
export 'package:structure/presentation/router/app_router.dart';
export 'package:structure/presentation/styles/styles.dart';
export 'package:structure/presentation/screens/home/home.dart';