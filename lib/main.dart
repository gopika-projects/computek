//import 'package:adarsh/UI/splash/splash_view.dart';
import 'package:adarsh/app/provider.dart';
import 'package:adarsh/app/router.dart';
import 'package:adarsh/constants/app_colors.dart';
import 'package:adarsh/constants/app_constants.dart';
import 'package:adarsh/constants/app_strings.dart';
import 'package:adarsh/services/navigation_service.dart';
import 'package:adarsh/widgets/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: AppStrings.appName,
          theme: ThemeData(
            primarySwatch: generateMaterialColor(Palette.primary),
            primaryColor: Palette.primary,
            accentColor: Palette.accent,
            scaffoldBackgroundColor: Palette.background,
            fontFamily: FontFamily.Barlow,
          ),
          builder: (context, child) {
            ScreenSize.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
              child: child!,
            );
          },
          initialRoute: RoutePaths.Splash,
          onGenerateRoute: PageRouter.generateRoute,
          navigatorKey: NavigationService.navigationKey,
        ),
      ),
    );
  }
}
