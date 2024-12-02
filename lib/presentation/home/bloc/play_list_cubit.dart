import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/home/bloc/play_list_state.dart';
import 'package:spotify_app_javier_martinez_4sa/service_locator.dart';

// PlayListCubit es una clase que maneja el estado de la Playlist usando el patrón Cubit.
class PlayListCubit extends Cubit<PlayListState> {
  // Constructor que inicializa el estado inicial como PlaylistLoading.
  PlayListCubit() : super(PlaylistLoading());

  // Método asincrónico para obtener la lista de la playlist.
  Future<void> getPlayList() async {
    // Se llama al caso de uso GetNewsSongsUseCase para obtener las canciones.
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    // Si la respuesta es un error (Left), se emite el estado PlaylistLoadFailure.
    returnedSongs.fold((l) {
      emit(PlaylistLoadFailure());
    }, (data) {
      // Si la respuesta es exitosa (Right), se emite el estado PlaylistLoaded
      // con la lista de canciones obtenida.
      emit(PlaylistLoaded(songs: data));
    });
  }
}
