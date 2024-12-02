import 'package:dartz/dartz.dart';

// Declaración abstracta del repositorio de canciones.
abstract class SongsRepository {
  // Método para obtener las canciones más recientes.
  // Devuelve un `Future` que contiene un `Either`, representando éxito (Right) o error (Left).
  Future<Either> getNewSongs();

  // Método para obtener las playlists.
  // Al igual que el anterior, utiliza un `Future` con un `Either` para manejar los resultados.
  Future<Either> getPlaylist();
}
