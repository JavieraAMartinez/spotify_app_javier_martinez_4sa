import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_app_javier_martinez_4sa/core/configs/theme/app_theme.dart';
import 'package:spotify_app_javier_martinez_4sa/firebase_options.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/splash/pages/splash.dart';

import 'service_locator.dart';

Future<void> main() async {
  // Asegura que los widgets y las vinculaciones de Flutter estén inicializados antes de cualquier configuración adicional.
  WidgetsFlutterBinding.ensureInitialized();

  // Configura el almacenamiento persistente para los BLoCs usando HydratedBloc.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage
            .webStorageDirectory // Si es web, usa el almacenamiento del navegador.
        : await getApplicationDocumentsDirectory(), // En otras plataformas, usa el directorio local.
  );

  // Inicializa Firebase con las configuraciones específicas para la plataforma actual.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inicializa las dependencias usando un gestor como GetIt.
  await initializeDependencies();

  // Inicia la ejecución de la aplicación con el widget principal.
  runApp(const MainApp());
}

// Clase principal de la aplicación.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Proporciona múltiples Bloc/Cubit a los widgets de la aplicación.
      providers: [
        BlocProvider(
            create: (_) =>
                ThemeCubit()), // Registra el ThemeCubit para manejar el tema.
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        // Escucha los cambios en el estado del ThemeCubit.
        builder: (context, mode) => MaterialApp(
          // Define el tema claro personalizado.
          theme: AppTheme.lightTheme,
          // Define el tema oscuro personalizado.
          darkTheme: AppTheme.darkTheme,
          // Selecciona dinámicamente el tema según el estado actual del ThemeCubit.
          themeMode: mode,
          // Oculta el banner de depuración en la esquina superior derecha.
          debugShowCheckedModeBanner: false,
          // Define la primera página que se muestra al iniciar la aplicación.
          home: const SplashPage(),
        ),
      ),
    );
  }
}
