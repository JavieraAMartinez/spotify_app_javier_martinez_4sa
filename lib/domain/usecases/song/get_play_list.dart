import 'package:dartz/dartz.dart';
import 'package:spotify_app_javier_martinez_4sa/core/usecase/usecase.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/auth/song/song.dart';
import 'package:spotify_app_javier_martinez_4sa/data/repository/song/song_repository_impl.dart';
import 'package:spotify_app_javier_martinez_4sa/service_locator.dart';

// 'GetPlaylistUseCase' es una clase que implementa la interfaz 'Usecase'.
// Esta clase se encarga de manejar la lógica de obtener una lista de canciones para la playlist.
class GetPlaylistUseCase implements Usecase<Either, dynamic> {
  // El método 'call' es llamado cuando se necesita ejecutar el caso de uso (en este caso, obtener la playlist).
  @override
  Future<Either> call({params}) async {
    // Llama al método 'getPlaylist' del repositorio de canciones (SongsRepository) registrado en el contenedor de dependencias.
    // 'getPlaylist' se encarga de obtener las canciones de la playlist.
    return await sl<SongsRepository>().getPlaylist();
  }
}
