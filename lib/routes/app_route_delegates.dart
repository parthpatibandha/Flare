import 'package:beamer/beamer.dart';
import 'package:camera/camera.dart';
import 'package:flare/core/utils/logger.dart';
import 'package:flare/features/camerafiles/gallery_screen.dart';
import 'package:flare/features/camerafiles/take_picture_screen.dart';
import 'package:flare/features/firebase/firebase_notification_screen.dart';
import 'package:flare/features/graphql/graphql_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare/HomeScreen.dart';
import 'package:flare/core/widgets/page_not_found.dart';
import 'package:flare/features/blocstate/view/album_view.dart';
import 'package:flare/features/browser/browser_screen.dart';
import 'package:flare/features/localizations/localization_screen.dart';
import 'package:flare/features/locations/location_screen.dart';
import 'package:flare/features/uicomponent/app_bar_screen.dart';
import 'package:flare/features/uicomponent/bottom_nav_bar_screen.dart';
import 'package:flare/features/uicomponent/buttons_screen.dart';
import 'package:flare/features/uicomponent/card_and_chip_screen.dart';
import 'package:flare/features/uicomponent/dialog_screen.dart';
import 'package:flare/features/uicomponent/drawer_screen.dart';
import 'package:flare/features/uicomponent/tabbar_screen.dart';
import 'package:flare/features/uicomponent/text_inputfield_screen.dart';
import 'package:flare/routes/app_route_names.dart';

///RoutesDelegator classes handle all navigation throughout the app.
class RoutesDelegator {
  final routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(
        routes: {
          "/" : (context, state, data) => HomeScreen(),
          AppRoutes.home: (context, state, data) => HomeScreen(),
          AppRoutes.uiComponentAppBar: (context, state, data) => AppBarScreen(),
          AppRoutes.uiComponentBottomNavigationBar: (context, state, data) => BottomNavBarScreen(),
          AppRoutes.uiComponentTextFormField: (context, state, data) => TextAndInputFieldScreen(),
          AppRoutes.uiComponentButton: (context, state, data) => ButtonsScreen(),
          AppRoutes.uiComponentDrawer: (context, state, data) => DrawerScreen(),
          AppRoutes.uiComponentTabBar: (context, state, data) => TabbarScreen(),
          AppRoutes.uiComponentDialogs: (context, state, data) => DialogScreen(),
          AppRoutes.uiComponentCards: (context, state, data) => CardAndChipScreen(),
          AppRoutes.bloc: (context, state, data) => const AlbumScreen(),
          AppRoutes.localizations: (context, state, data) => CustomLocalizationScreen(),
          AppRoutes.location: (context, state, data) => LocationScreen(),
          AppRoutes.browser: (context, state, data) => BrowserScreen(),
          AppRoutes.graphQL: (context, state, data) => GraphQLScreen(),
          AppRoutes.cameraFiles: (context, state, data) {
            String? path = "";
            if (data != null && data is String) {
              path = data;
            }
            if (path != null && path.isNotEmpty) {
              Logger.d("Gallery beamer file path : $path");
              return GalleryScreen(
                imagePath: path,
              );
            } else {
              return GalleryScreen(
                imagePath: "",
              );
            }
          },
          AppRoutes.takePicture: (context, state, data) => TakePictureScreen(
                camera: data as CameraDescription,
              ),
          AppRoutes.firebaseNotification: (context, state, data) => FirebaseNotificationScreen(),
        },
      ),
      notFoundPage: BeamPage(child: NotFoundPage()));
}
