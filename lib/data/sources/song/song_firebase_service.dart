import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app_javier_martinez_4sa/data/models/auth/song/song.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/entities/song/song.dart';

// Definición de una clase abstracta para los servicios de canciones desde Firebase.
// Sirve como contrato para garantizar que todas las implementaciones contengan los métodos definidos.
abstract class SongFireBaseService {
  // Método abstracto para obtener las canciones más recientes.
  Future<Either> getNewSongs();

  // Método abstracto para obtener las playlists.
  Future<Either> getPlaylist();
}

// Implementación concreta de SongFireBaseService que interactúa con Firebase.
class SongFireBaseServiceImpl extends SongFireBaseService {
  // Implementación del método para obtener las canciones más recientes.
  @override
  Future<Either> getNewSongs() async {
    try {
      // Lista para almacenar las canciones que se obtienen de Firebase.
      List<SongEntity> songs = [];

      // Realiza una consulta a la colección "songs" en Firestore:
      // - Ordena las canciones por fecha de lanzamiento en orden descendente.
      // - Limita la consulta a las 3 canciones más recientes.
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .limit(3)
          .get();

      // Itera sobre los documentos obtenidos en la consulta.
      for (var element in data.docs) {
        // Convierte cada documento JSON en un modelo de canción (SongModel).
        var songModel = SongModel.fromJson(element.data());

        // Convierte el modelo de canción en una entidad (SongEntity) y la agrega a la lista.
        songs.add(songModel.toEntity());
      }

      // Retorna la lista de canciones en el lado derecho del resultado (usando `right`).
      return right(songs);
    } catch (e) {
      // Si ocurre un error, retorna un mensaje de error en el lado izquierdo del resultado (usando `Left`).
      return const Left("Ocurrio un error, por favor vuelve a intentarlo.");
    }
  }

  // Implementación del método para obtener la playlist.
  @override
  Future<Either> getPlaylist() async {
    try {
      // Lista para almacenar las canciones que forman la playlist.
      List<SongEntity> songs = [];

      // Consulta similar a `getNewSongs`, pero podría personalizarse según la lógica de la playlist.
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .limit(3)
          .get();

      // Procesa cada documento de la colección "songs".
      for (var element in data.docs) {
        // Convierte los datos JSON en un modelo de canción.
        var songModel = SongModel.fromJson(element.data());

        // Convierte el modelo en una entidad y la agrega a la lista.
        songs.add(songModel.toEntity());
      }

      // Retorna la lista de canciones de la playlist.
      return right(songs);
    } catch (e) {
      // En caso de error, retorna un mensaje indicando el fallo.
      return const Left("Ocurrio un error, por favor vuelve a intentarlo.");
    }
  }
}
