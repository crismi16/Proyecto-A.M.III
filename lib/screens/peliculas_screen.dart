import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PeliculasScreen extends StatelessWidget {
  PeliculasScreen({super.key});
  
  final String userName = "Cristian";
  final List<String> nuevasPeliculas = [
    'https://lumiere-a.akamaihd.net/v1/images/tidalwave_payoff_poster_las_0a47c6a2.jpeg?region=0%2C0%2C770%2C1100',
    'https://scontent.fuio21-1.fna.fbcdn.net/v/t39.30808-6/441874130_1012087590302772_2694573208180629275_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeER-R1qn0S0njbdvVS_tjsp2fyf-RzI2ozZ_J_5HMjajB0gu6Uuch6kRf_QHDr_HdgJCJHe7hsRJwtBlak2hMHX&_nc_ohc=RfzzK0Mk-F8Q7kNvgFBh5Lx&_nc_zt=23&_nc_ht=scontent.fuio21-1.fna&_nc_gid=AXkAsGPBCaNoJ8UEfj2rQK5&oh=00_AYB6cizJpigWGkgoHjAmANNzzAmk8Blt0dQB8USliMxyTA&oe=676ACC93',
    'https://hips.hearstapps.com/hmg-prod/images/joker-2-poster-660d1344c56e8.jpeg?resize=980:*',
    'https://dx35vtwkllhj9.cloudfront.net/universalstudios/the-wild-robot/images/regions/pe/updates1/onesheet-synopsis.jpg',
    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAHSXOtd8LVqdGSWl3pTfZnF5fE4AjlQToqj_AR1MAEAhR1QaC59R4hYR7YlZ_WC_bTsacteVUloa7ifHiq0fC7mvaEetxyLAYRGH3BM7IZ3wXFIKeUmUdlvSBJo8N9acG_MsRC3Zbw4kk6EllPYzGGfQTjjniWIWPP8QL3NhC1-IPYtDQryWL2p8mkw/s4075/ALIENROM2024001_Movie.jpg',
    'https://static.wikia.nocookie.net/doblaje/images/8/8e/C%C3%B3digo_traje_rojo_-_Poster.png/revision/latest/scale-to-width-down/1000?cb=20240923141717&path-prefix=es',
  ];
  final List<String> recomendadas = [
    'https://dx35vtwkllhj9.cloudfront.net/universalstudios/the-wild-robot/images/regions/pe/updates1/onesheet-synopsis.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUrWVzivGmZbZv4-5c1LyAlyUgjPqva5Bsyw&s',
    'https://static.wikia.nocookie.net/doblaje/images/3/3c/12PS1Cartel.png/revision/latest?cb=20190528042605&path-prefix=es',
    'https://musicart.xboxlive.com/7/9f8e0900-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080',
    'https://m.media-amazon.com/images/I/71qd+kIgYeL.jpg',
    'https://lumiere-a.akamaihd.net/v1/images/tidalwave_payoff_poster_las_0a47c6a2.jpeg?region=0%2C0%2C770%2C1100',
  ];
  final List<String> cienciaficcion = [
    'https://pics.filmaffinity.com/guardians_of_the_galaxy-595487268-mmed.jpg',
    'https://i.pinimg.com/564x/f7/4e/0b/f74e0bb6fecfdbffc320e38f793853d1.jpg',
    'https://larepublica.cronosmedia.glr.pe/migration/images/MUZF3WRWLNGOFA7ZBQYDQ3LDTU.jpg',
    'https://pics.filmaffinity.com/Spider_Man_No_Way_Home-642739124-large.jpg',
    'https://i.pinimg.com/736x/26/04/7a/26047a439ca5d3d82b2d982f9eb2f124.jpg',
    'https://www.universalpictures-latam.com/tl_files/content/movies/fast9/posters/01.jpg',
  ];
  final List<String> accion = [
    'https://4.bp.blogspot.com/-mWsjininwLA/TpdYTB3rwbI/AAAAAAAAAK8/oGF40L_CtCU/s1600/Ip-Man-DVD-sleeve.jpg?w=144',
    'https://static.wikia.nocookie.net/doblaje/images/2/26/IP_MAN_2_poster_hd_.jpg/revision/latest?cb=20231113210815&path-prefix=es',
    'https://www.aceprensa.com/wp-content/uploads/2007/01/rocky-balboa.jpg',
    'https://i.pinimg.com/originals/c4/5b/92/c45b92a4f577dca169166f1572bdd8cc.jpg',
    'https://pics.filmaffinity.com/RRR-976587130-large.jpg',
    'https://es.web.img3.acsta.net/pictures/13/12/09/15/58/209437.jpg',
  ];
  final List<String> comedia = [
    'https://m.media-amazon.com/images/M/MV5BMjEzNzE5MDAxMl5BMl5BanBnXkFtZTgwNjcxOTE2OTE@._V1_.jpg',
    'https://static.wikia.nocookie.net/yatoroba/images/8/87/50_primeras_citas-205168261-large.jpg/revision/latest?cb=20231210234451&path-prefix=es',
    'https://m.media-amazon.com/images/M/MV5BMjMzNDQ5NjkzMF5BMl5BanBnXkFtZTgwMDA1OTk5MjE@._V1_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUrWVzivGmZbZv4-5c1LyAlyUgjPqva5Bsyw&s',
    'https://m.media-amazon.com/images/S/pv-target-images/4b177b20eb82ef719719e6dce09d3dce7b59bd1e1b47cbf659e71a9c23886170.jpg',
    'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/422544/422544.jpg',
  ];
  final List<String> terror = [
    'https://es.web.img3.acsta.net/pictures/14/05/07/09/01/306626.jpg',
    'https://es.web.img3.acsta.net/pictures/210/381/21038147_20130909131948722.jpg',
    'https://i.pinimg.com/originals/53/08/54/530854a71f857b925da197e402956041.jpg',
    'https://pics.filmaffinity.com/Rings-796722362-large.jpg',
    'https://m.media-amazon.com/images/S/pv-target-images/3cecd095b6275b1a300d0f274a83c861be09f00998b24a98c5afb4c15f403c19.jpg',
    'https://pics.filmaffinity.com/Hereditary-659865612-large.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                '¡MundoCine!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 254, 251),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Hola, $userName',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27C4D9),
                ),
              ),
              SizedBox(height: 20),
              _buildCarouselSection(
                'Películas Nuevas',
                nuevasPeliculas,
                screenWidth * 1.32,
              ),
              SizedBox(height: 20),
              _buildCarouselSection(
                'Recomendados',
                recomendadas,
                screenWidth * 0.5,
              ),
              SizedBox(height: 20),
              _buildCarouselSection(
                'Ciencia Ficción',
                cienciaficcion,
                screenWidth * 0.5,
              ),
              SizedBox(height: 20),
              _buildCarouselSection(
                'Acción',
                accion,
                screenWidth * 0.5,
              ),
              SizedBox(height: 20),
              _buildCarouselSection(
                'Comedia',
                comedia,
                screenWidth * 0.5,
              ),
              SizedBox(height: 20),
              _buildCarouselSection(
                'Terror',
                terror,
                screenWidth * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselSection(String title, List<String> images, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _buildCarouselItem(images[index], height);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(String imageUrl, double height) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: height,
              width: height * 0.7,
              color: Colors.grey,
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
