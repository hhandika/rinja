import 'package:rinja/providers/settings.dart';
import 'package:rinja/screens/home/home.dart';
import 'package:rinja/screens/more/components/settings.dart';
import 'package:rinja/src/rust/frb_generated.dart';
import 'package:rinja/styles/theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await RustLib.init();

  runApp(ProviderScope(
      overrides: [settingProvider.overrideWithValue(prefs)],
      child: const RinjaApp()));
}

class RinjaApp extends ConsumerWidget {
  const RinjaApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp.router(
        title: 'RINJA Species ID',
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: RinjaTheme.lightTheme(lightColorScheme),
        darkTheme: RinjaTheme.darkTheme(darkColorScheme),
        themeMode: ref.watch(themeSettingProvider).when(
              data: (theme) => theme,
              loading: () => ThemeMode.system,
              error: (error, stackTrace) => ThemeMode.system,
            ),
      );
    });
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RinjaHome(),
      routes: [
        GoRoute(
          path: 'appearance',
          builder: (context, state) => const AppearanceScreen(),
        ),
      ],
    ),
  ],
);
