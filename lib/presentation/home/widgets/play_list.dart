import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app_javier_martinez_4sa/common/helpers/is_dark_mode.dart';
import 'package:spotify_app_javier_martinez_4sa/core/configs/theme/app_colors.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/entities/song/song.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/home/bloc/play_list_cubit.dart';

import '../bloc/play_list_state.dart';

// PlayList es un widget Stateless que construye la interfaz de usuario para mostrar la lista de canciones.
class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider es usado para proveer el PlayListCubit al árbol de widgets
    // Esto permitirá a los widgets descendientes acceder a los estados de PlayListCubit.
    return BlocProvider(
      create: (_) => PlayListCubit()
        ..getPlayList(), // Se crea el cubit y se llama a getPlayList() para obtener las canciones
      child: BlocBuilder<PlayListCubit, PlayListState>(
        // BlocBuilder reconstruye el widget según los cambios de estado del cubit
        builder: (context, state) {
          // Si el estado es PlaylistLoading, muestra un indicador de carga mientras se obtienen los datos.
          if (state is PlaylistLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          // Si el estado es PlaylistLoaded, muestra la lista de canciones.
          if (state is PlaylistLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                children: [
                  // Un contenedor para mostrar el título y el texto 'Mas' al lado de la lista de canciones
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Playlist', // Título de la sección de playlist
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Mas',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(
                                0xffC6C6C6)), // Un botón o texto para indicar que hay más canciones disponibles
                      ),
                    ],
                  ),
                  _songs(state.songs)
                ],
              ),
            );
          }

          // Si no hay un estado válido, simplemente muestra un contenedor vacío.
          return Container();
        },
      ),
    );
  }

  // Esta función parece no ser utilizada en el código actual. Es un método privado que podría ser para mostrar las canciones, pero actualmente solo devuelve un contenedor vacío.
  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? AppColors.darkgrey
                            : const Color(0xffE6E6E6)),
                  )
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: songs.length);
  }
}
