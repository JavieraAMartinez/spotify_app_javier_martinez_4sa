import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_app_javier_martinez_4sa/service_locator.dart';

// 'NewsSongsCubit' es una clase que extiende 'Cubit'. La clase 'Cubit' es parte de la librería 'flutter_bloc',
// y se utiliza para gestionar el estado de la aplicación de forma reactiva.
class NewsSongsCubit extends Cubit<NewsSongsState> {
  // Constructor de la clase que inicializa el estado a 'NewSongsLoading'.
  NewsSongsCubit() : super(NewSongsLoading());

  // El método 'getNewsSongs' se encarga de obtener las canciones nuevas.
  // Este es el método que se llama para actualizar el estado del cubit con los datos de las canciones.
  Future<void> getNewsSongs() async {
    // Llama al caso de uso 'GetNewsSongsUseCase' registrado en el contenedor de dependencias (GetIt).
    // Este caso de uso obtiene las canciones nuevas desde la fuente de datos (por ejemplo, una base de datos o API).
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    // La respuesta se maneja con un enfoque funcional utilizando 'fold'.
    // 'fold' toma dos funciones: una para manejar el caso de error (Left) y otra para manejar el caso exitoso (Right).
    returnedSongs.fold(
      // Si ocurrió un error (Left), se emite el estado 'NewSongsLoadFailure'.
      (l) {
        emit(NewSongsLoadFailure());
      },
      // Si la operación fue exitosa (Right), se emite el estado 'NewSongsLoaded' con las canciones obtenidas.
      (data) {
        emit(NewSongsLoaded(songs: data));
      },
    );
  }
}
