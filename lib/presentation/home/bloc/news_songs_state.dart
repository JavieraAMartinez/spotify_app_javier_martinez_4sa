import 'package:spotify_app_javier_martinez_4sa/domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewSongsLoading extends NewsSongsState {}

class NewSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;

  NewSongsLoaded({required this.songs});
}

class NewSongsLoadFailure extends NewsSongsState {}
