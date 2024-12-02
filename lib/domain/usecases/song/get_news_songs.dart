import 'package:dartz/dartz.dart';
import 'package:spotify_app_javier_martinez_4sa/core/usecase/usecase.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/auth/song/song.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/song/song_repository_impl.dart';
import 'package:spotify_app_javier_martinez_4sa/service_locator.dart';

// 'GetNewsSongsUseCase' es una clase que implementa la interfaz 'Usecase'.
// Esta clase se encarga de manejar la lógica de obtener una lista de canciones nuevas.
class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  // El método 'call' es llamado cuando se necesita ejecutar el caso de uso (en este caso, obtener las canciones nuevas).
  @override
  Future<Either> call({params}) async {
    // Llama al método 'getNewSongs' del repositorio de canciones (SongsRepository) registrado en el contenedor de dependencias.
    // 'getNewSongs' se encarga de obtener las canciones nuevas.
    return await sl<SongsRepository>().getNewSongs();
  }
}
