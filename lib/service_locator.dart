import 'package:get_it/get_it.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_app_javier_martinez_4sa/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/repository/auth/auth.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/usecases/auth/signup.dart';

import 'domain/usecases/auth/sigin.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
