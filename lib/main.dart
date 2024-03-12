import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms/resources/routes/routes.dart';
import 'package:hrms/resources/theme/app_colors.dart';
import 'package:hrms/resources/translations/app_translations.dart';

Future<void> main() async {
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme:darkColorScheme,
        useMaterial3: true,
      ),
      themeMode:  ThemeMode.system,
      getPages: AppRoutes.appRoutes(),
      // Get.updateLocale(Locale('hi'));
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale, // Default locale
      fallbackLocale: Locale('en', 'US'), // Fallback locale
    );
  }
}
