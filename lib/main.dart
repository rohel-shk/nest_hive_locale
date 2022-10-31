import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navigation_test/features/users/model/user.dart';
import 'package:navigation_test/generated/codegen_loader.g.dart';
import 'package:navigation_test/router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  final applicationDir=await getApplicationDocumentsDirectory();
 Hive.init(applicationDir.path);
 Hive.registerAdapter(UserAdapter());
  runApp(EasyLocalization(
    path: 'assets/translations',
      supportedLocales:  [
        Locale('en'),
        Locale('ne')
      ],
      startLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute:(RouteSettings routeSettings)=> Routers.generateRoute(routeSettings),
      initialRoute: Routers.mainScreen,
    );
  }
}
