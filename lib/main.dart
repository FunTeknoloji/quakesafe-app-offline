import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'features/alerts/presentation/alerts_page.dart';
import 'features/checklists/presentation/checklists_page.dart';
import 'features/mesh_chat/presentation/mesh_chat_page.dart';
import 'features/offline_map/presentation/offline_map_page.dart';
import 'shared/theme/app_theme.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupDependencies();

  runApp(const ProviderScope(child: QuakeSafeApp()));
}

Future<void> _setupDependencies() async {
  getIt
    ..registerLazySingleton<AppRouter>(AppRouter.new)
    ..registerLazySingleton<AppBootstrapService>(AppBootstrapService.new);

  await getIt<AppBootstrapService>().initialize();
}

class AppBootstrapService {
  Future<void> initialize() async {
    // TODO: Initialize local database, tile cache, and mesh SDK bootstrapping.
  }
}

class QuakeSafeApp extends StatelessWidget {
  const QuakeSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return MaterialApp(
      title: 'QuakeSafe Offline',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRouter.alerts,
      routes: router.routes,
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class AppRouter {
  static const alerts = '/alerts';
  static const offlineMap = '/offline-map';
  static const meshChat = '/mesh-chat';
  static const checklists = '/checklists';

  Map<String, WidgetBuilder> get routes => {
        alerts: (_) => const AlertsPage(),
        offlineMap: (_) => const OfflineMapPage(),
        meshChat: (_) => const MeshChatPage(),
        checklists: (_) => const ChecklistsPage(),
      };
}
