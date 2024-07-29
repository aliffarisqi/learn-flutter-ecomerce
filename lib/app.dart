import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bindings/general_bindings.dart';
import 'utils/constants/colors.dart';
import 'utils/constants/text_string.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: BTexts.appName,
      themeMode: ThemeMode.system,
      theme: BAppTheme.lightTheme,
      darkTheme: BAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: BColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: BColors.white,
          ),
        ),
      ),
    );
  }
}
