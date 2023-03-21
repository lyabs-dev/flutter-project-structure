library widget;

export 'package:flutter/material.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

//components

//utils
export 'package:flutter_structure/utils/path_assets.dart';
export 'package:flutter_structure/utils/constants.dart';
export 'package:flutter_structure/utils/size_config.dart';
export 'package:flutter_structure/utils/enums.dart';

//data
export 'package:flutter_structure/data/models/settings_item.dart';
export 'package:flutter_structure/data/repositories/settings_repository.dart';

//logic
export 'package:flutter_structure/logic/cubits/settings_cubit.dart';
export 'package:flutter_structure/logic/states/settings_state.dart';

//presentation
export 'package:flutter_structure/presentation/router/app_router.dart';
export 'package:flutter_structure/presentation/styles/styles.dart';
export 'package:flutter_structure/presentation/screens/home/home.dart';