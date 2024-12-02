import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app_javier_martinez_4sa/common/helpers/is_dark_mode.dart';
import 'package:spotify_app_javier_martinez_4sa/core/configs/theme/app_colors.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/home/widgets/news_songs.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/home/widgets/play_list.dart';

import '../../../common/Widgets/appbar/app_bar.dart';
import '../../../core/configs/assets/app_vectors.dart';

// HomePage es una clase que extiende StatefulWidget, lo que significa que es una pantalla que tiene estado en Flutter.
// Los widgets con estado tienen la capacidad de redibujar su interfaz de usuario cuando cambia su estado.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// _HomePageState es el estado correspondiente a la clase HomePage.
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Se declara un controlador de pestañas (TabController), que manejará las pestañas en la parte superior de la pantalla.
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Inicializamos el TabController con 4 pestañas y vinculamos este widget como el ticker (vsync) para las animaciones.
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold proporciona una estructura básica de diseño para la pantalla, con AppBar, body, etc.
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true, // Oculta el botón de retroceso en la AppBar.
        title: SvgPicture.asset(
          AppVectors.logo, // Muestra un logo en formato SVG.
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView permite que el contenido sea desplazable si es más grande que la pantalla.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Los widgets dentro de esta columna se colocan de manera vertical.
          children: [
            _homeTopCard(), // Método que devuelve una tarjeta superior en la pantalla principal.
            _tabs(), // Muestra las pestañas (TabBar) debajo de la tarjeta superior.
            SizedBox(
              height:
                  260, // Define la altura del contenedor que contendrá las vistas de las pestañas.
              child: TabBarView(
                controller:
                    _tabController, // Se vincula el TabController para cambiar entre las pestañas.
                children: [
                  const NewsSongs(), // La primera pestaña muestra las canciones nuevas.
                  Container(), // Segunda pestaña vacía.
                  Container(), // Tercera pestaña vacía.
                  Container(), // Cuarta pestaña vacía.
                ],
              ),
            ),
            const PlayList(), // Muestra la sección de Playlist debajo de las pestañas.
          ],
        ),
      ),
    );
  }

  // Este método genera una tarjeta superior con una imagen y un ícono.
  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140, // Define la altura de la tarjeta superior.
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              // Usa una imagen SVG para el fondo de la tarjeta.
              child: SvgPicture.asset('assets/vectors/home_top_card.svg'),
            ),
            Align(
              alignment: Alignment.bottomRight,
              // Coloca una imagen del artista en la esquina inferior derecha.
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset('assets/images/home_artist.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Este método genera la barra de pestañas en la parte superior.
  Widget _tabs() {
    return TabBar(
      controller:
          _tabController, // Asocia el TabController para gestionar las pestañas.
      labelColor: context.isDarkMode
          ? Colors.white
          : Colors
              .black, // El color de la etiqueta depende del tema oscuro o claro.
      indicatorColor:
          AppColors.primary, // El color del indicador de la pestaña activa.
      padding: const EdgeInsets.symmetric(
          vertical: 40, horizontal: 10), // Añade relleno a las pestañas.
      tabs: const [
        Text(
          "News", // Pestaña 1: Noticias.
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          "Videos", // Pestaña 2: Videos.
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          "Artistas", // Pestaña 3: Artistas.
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          "Podcast", // Pestaña 4: Podcast.
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}
