import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app_javier_martinez_4sa/common/helpers/is_dark_mode.dart';
import 'package:spotify_app_javier_martinez_4sa/core/configs/constants/app_urls.dart';
import 'package:spotify_app_javier_martinez_4sa/core/configs/theme/app_colors.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/entities/song/song.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/home/bloc/news_songs_cubit.dart';

import '../bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Se crea un `NewsSongsCubit` y se llama a su método `getNewsSongs` para cargar las canciones.
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200, // Altura del contenedor principal.
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            // Maneja los diferentes estados del cubit.

            if (state is NewSongsLoading) {
              // Mientras se cargan las canciones, se muestra un indicador de progreso.
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is NewSongsLoaded) {
              // Si las canciones se cargaron con éxito, se muestra la lista de canciones.
              return _songs(state.songs);
            }

            // En cualquier otro caso, se muestra un contenedor vacío.
            return Container();
          },
        ),
      ),
    );
  }

  // Método para construir la lista de canciones.
  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal, // ListView en dirección horizontal.
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160, // Ancho de cada tarjeta de canción.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(30), // Bordes redondeados.
                    image: DecorationImage(
                      fit: BoxFit.cover, // Imagen ajustada al contenedor.
                      image: NetworkImage(
                        // URL dinámica de la imagen de la canción.
                        '${AppUrls.firestorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppUrls.mediaAlt}',
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    // Botón de reproducción flotante en la esquina inferior derecha.
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(
                          10, 10, 0), // Ajuste de posición.
                      child: const Icon(Icons.play_arrow_rounded),
                      color: context.isDarkMode
                          ? const Color(0xff959595)
                          : const Color(0xff555555),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? AppColors.darkgrey
                            : const Color(0xffE6E6E6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 10), // Separación entre la imagen y el texto.

              // Título de la canción.
              Text(
                songs[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),

              // Nombre del artista.
              Text(
                songs[index].artist,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 5,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(width: 14), // Espaciado entre elementos.
      itemCount: songs.length, // Cantidad de canciones a mostrar.
    );
  }
}
