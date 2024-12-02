import 'package:spotify_app_javier_martinez_4sa/domain/entities/song/song.dart';

// Definición abstracta para el estado de la Playlist.
abstract class PlayListState {}

// Estado que indica que la carga de la playlist está en progreso.
class PlaylistLoading extends PlayListState {}

// Estado que indica que la playlist ha sido cargada exitosamente.
// Este estado contiene una lista de canciones (SongEntity).
class PlaylistLoaded extends PlayListState {
  // Lista de canciones obtenidas, representadas por objetos SongEntity.
  final List<SongEntity> songs;

  // Constructor que recibe la lista de canciones y la inicializa.
  PlaylistLoaded({required this.songs});
}

// Estado que indica que ha habido un error al cargar la playlist.
class PlaylistLoadFailure extends PlayListState {}
