
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ecobadge/features/home/homescreen.dart';
import 'package:ecobadge/features/navigation/navigation.dart';
import 'package:ecobadge/features/profile/profile.dart';
import 'package:ecobadge/features/redeem/redeem.dart';
import 'package:ecobadge/router/router.dart';

final _rootNavigatorKey =GlobalKey<NavigatorState>();
final _shellNavigatorKey =GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // initialLocation: Routes.login.path,
  initialLocation: Routes.homescreen.path,
  routes: [
    ShellRoute(
      parentNavigatorKey: _rootNavigatorKey,
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        int index = 0;

        if(state.fullPath == Routes.homescreen.path){
          index=0;
        } else if(state.fullPath ==  Routes.redeem.path){
          index =1;
        } else if(state.fullPath == Routes.profile.path){
          index =2;
        }
        debugPrint("Index:$index");

        return CupertinoPage(
          child:NavDisp(
          selectedIndex: index, 
          child: child
        ));

      },

      routes: [
        GoRoute(
          path: Routes.homescreen.path,
          name: Routes.homescreen.name,
          
          pageBuilder:(context, state) => const CupertinoPage(child: HomeScreen()),
        ),
        GoRoute(
          path: Routes.redeem.path,
          name: Routes.redeem.name,
          pageBuilder:(context, state) => const CupertinoPage(child: Reedem()),
        ),
        GoRoute(
          path: Routes.profile.path,
          name: Routes.profile.name,
          pageBuilder:(context, state) => const CupertinoPage(child: Profile()),
        ),
        // GoRoute(
        //   path: Routes.login.path,
        //   name: Routes.login.name,
        //   pageBuilder:(context, state) => const CupertinoPage(child: LoginScreen()),
        // ),
        // GoRoute(
        //   path: Routes.register.path,
        //   name: Routes.register.name,
        //   pageBuilder:(context, state) => const CupertinoPage(child: SignupScreen()),
        // ),
      ]
    )
  ]
);