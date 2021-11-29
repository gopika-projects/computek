import 'package:adarsh/UI/login/login_view.dart';

import '/constants/app_constants.dart';
import '/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<Object> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (_) => SplashView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      // case RoutePaths.OTP:
      //   return MaterialPageRoute(builder: (_) => VerifyOtpView());
      // case RoutePaths.Register:
      //   return MaterialPageRoute(builder: (_) => RegisterView());
      // case RoutePaths.City:
      //   return MaterialPageRoute(builder: (_) => CityView());
      // case RoutePaths.SubServiceView:
      //   return MaterialPageRoute(
      //       builder: (_) => SubServiceView(
      //             service: settings.arguments as ServiceModel,
      //           ));
      // case RoutePaths.Dashboard:
      //   return MaterialPageRoute(builder: (_) => DashboardView());
      // case RoutePaths.Booking:
      //   return MaterialPageRoute(
      //     builder: (_) => BookingView(
      //       service: settings.arguments as ServiceModel,
      //     ),
      //   );
      // case RoutePaths.Notification:
      //   return MaterialPageRoute(builder: (_) => NotificationView());
      // case RoutePaths.BookingDetails:
      //   return MaterialPageRoute(
      //     builder: (_) => BookingDetailsView(
      //       bookingHistory: settings.arguments as BookingHistory,
      //     ),
      //   );
      // case RoutePaths.Address:
      //   return MaterialPageRoute(
      //     builder: (_) => AddressView(isPicker: settings.arguments as bool),
      //   );
      // case RoutePaths.LocationPicker:
      //   return MaterialPageRoute(
      //     builder: (_) => LocationPickerView(
      //       latLng: settings.arguments as LatLng?,
      //     ),
      //   );
      // case RoutePaths.Checkout:
      //   return MaterialPageRoute(builder: (_) => CheckoutView());
      // case RoutePaths.Profile:
      //   return MaterialPageRoute(builder: (_) => ProfileView());
      // case RoutePaths.Promocode:
      //   return MaterialPageRoute(builder: (_) => PromocodeView());
      // case RoutePaths.About:
      //   return MaterialPageRoute(builder: (_) => AboutView());
      // case RoutePaths.Terms:
      //   return MaterialPageRoute(builder: (_) => TermsView());
      // case RoutePaths.PrivacyPolicy:
      //   return MaterialPageRoute(builder: (_) => PrivacyView());
      // case RoutePaths.Offline:
      //   return MaterialPageRoute(builder: (_) => OfflineView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for page ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class FadeRoute extends PageRouteBuilder<Object> {
  final Widget page;
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
