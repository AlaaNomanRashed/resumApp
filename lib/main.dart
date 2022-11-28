import 'package:flutter/material.dart';
import 'package:resum_app_project/Providers/cv_provider.dart';
import 'package:resum_app_project/Shared%20Preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resum_app_project/views/screens/resum_main_screen.dart';
import 'Providers/lang_provider.dart';
import 'database/db_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Shared Preferences
  await SharedPreferencesController().initSharedPreferences();
  // Database
  await DatabaseSettings().databaseInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CvProvider>(
          create: (context) => CvProvider(),
        ),
        ChangeNotifierProvider<LangProviders>(
          create: (context) => LangProviders(),
        ),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResumMainScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: Locale(Provider.of<LangProviders>(context).lang_),
    );
  }
}
