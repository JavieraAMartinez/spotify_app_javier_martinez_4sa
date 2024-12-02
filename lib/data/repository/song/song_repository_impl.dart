import 'package:dartz/dartz.dart';
import 'package:spotify_app_javier_martinez_4sa/data/sources/song/song_firebase_service.dart';

import '../../../service_locator.dart';
import '../auth/song/song.dart';

// Implementación concreta del repositorio de canciones que interactúa con el servicio de Firebase.
class SongRepositoryImpl extends SongsRepository {
  // Implementación del método para obtener las canciones más recientes.
  @override
  Future<Either> getNewSongs() async {
    // Llama al servicio de Firebase para obtener las canciones más recientes.
    // Usa el Service Locator (sl) para acceder a la instancia del servicio.
    return await sl<SongFireBaseService>().getNewSongs();
  }

  // Implementación del método para obtener la playlist.
  @override
  Future<Either> getPlaylist() async {
    // Llama al servicio de Firebase para obtener las playlists.
    // También usa el Service Locator para acceder a la instancia del servicio.
    return await sl<SongFireBaseService>().getPlaylist();
  }
}
