import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/routes.dart';
import 'package:flutter_assignment/app/theme.dart';
import 'package:flutter_assignment/providers/theme_provider.dart';
import 'package:flutter_assignment/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  MaterialApp build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      initialRoute: Routes.home,
      onGenerateRoute: generatedRoutes,
      navigatorKey: Utils.navigatorKey,
    );
  }
}
