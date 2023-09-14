import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:url_launcher/url_launcher.dart';


class MapScreen extends StatefulWidget{

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{

  final _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _Fondo(),
            _Titulo(),
            _Mapa(),
          ],
        )
    );
  }

  Widget _Mapa(){

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Positioned(
      top: height/4.5,
      left: width/20,
      child: Container(
        width: width*0.9, //350
        height: height*0.75, //500
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(-5.30763584513582, -78.89685632219921),
              zoom: 17,
            ),
            nonRotatedChildren: [
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap to ®2023 Proyectos Sistemas Embebidos e Internet de las Cosas   INICTEL-UNI',
                    onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                  ),
                ],
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: LatLng(-5.308488206446803, -78.89749002810319),
                    radius: 20,
                    useRadiusInMeter: true,
                  ),
                ],
              ),
              /*PolygonLayer(
                polygons: [
                  Polygon(
                      points: [
                        LatLng(-5.308205111654353, -78.89777166005386),
                        LatLng(-5.308538949839256, -78.89725399370641),
                        LatLng(-5.3086377659073305, -78.89766973610982)
                      ],
                      color: Colors.orange.withOpacity(0.6),
                      isFilled: true
                  )
                ],
              ),*/
              MarkerLayer(
                markers: [
                  Marker(
                      point: LatLng(-5.308488206446803, -78.89749002810319),
                      width: 20,
                      height: 20,
                      builder: (context) => FlutterLogo(),
                  )
                ],
              ),
            ],
          ),
        )
      )
    );
  }

  Widget _Titulo(){

    var width = MediaQuery.of(context).size.width;

    return Positioned(
        top: 120,
        left: width/10,
        child: Text(
          'Mapa Ubicación de Proyecto',
          style: TextStyle(
              color: Colors.black,
              fontWeight:  FontWeight.bold,
              fontSize: 24),
        )
    );
  }

  Widget _Fondo(){
    return Stack(
      children: [
        // Fondo de la aplicación
        Image.asset(
          'images/fondocafe1.png',
          fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
          width: double.infinity, // Ancho de la imagen igual al ancho de la pantalla
          height: double.infinity, // Alto de la imagen igual al alto de la pantalla
        ),
      ],
    );
  }

}