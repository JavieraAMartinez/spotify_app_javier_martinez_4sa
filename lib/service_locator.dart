import 'package:get_it/get_it.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/auth/song/song.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/song/song_repository_impl.dart';
import 'package:spotify_app_javier_martinez_4sa/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app_javier_martinez_4sa/data/sources/song/song_firebase_service.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/repository/auth/auth.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/usecases/auth/signup.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/usecases/song/get_play_list.dart';

import 'domain/usecases/auth/sigin.dart';

// 'sl' es una instancia del contenedor de dependencias GetIt.
// GetIt se utiliza para registrar y recuperar instancias de objetos que necesitan ser compartidos a lo largo de la aplicación.
final sl = GetIt.instance;

// Esta función inicializa las dependencias, registrando varias clases en GetIt.
// Este patrón es utilizado para la inyección de dependencias en Flutter, ayudando a gestionar las dependencias de manera eficiente.
Future<void> initializeDependencies() async {
  // Registra AuthFirebaseService como un singleton, lo que significa que siempre se usará la misma instancia de esta clase a lo largo de la app.
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Registra SongFireBaseService como un singleton.
  sl.registerSingleton<SongFireBaseService>(SongFireBaseServiceImpl());

  // Registra AuthRepository como un singleton.
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Registra SongsRepository como un singleton.
  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  // Registra SignupUseCase como un singleton.
  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  // Registra SigninUseCase como un singleton.
  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  // Registra GetNewsSongsUseCase como un singleton.
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());

  // Registra GetPlaylistUseCase como un singleton.
  sl.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());
}
