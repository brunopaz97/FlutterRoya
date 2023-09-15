import 'package:flutter/material.dart';
import 'package:analisis_roya/presentation/widgets/side_menu.dart';

const cards = <Map<String, dynamic>>[
    {'elevation': 5.0, 'label': 'Elevation 5', 'estacion': 'MONITOREO ACTUAL "PROSPERIDAD I"'},
    {'elevation': 5.0, 'label': 'Elevation 5', 'estacion': 'MONITOREO ACTUAL "PROSPERIDAD II"'},
    {'elevation': 5.0, 'label': 'Elevation 5', 'estacion': 'MONITOREO ACTUAL "PROSPERIDAD III"'},
    {'elevation': 5.0, 'label': 'Elevation 5', 'estacion': 'MONITOREO ACTUAL "MIRADOR I"'},
    {'elevation': 5.0, 'label': 'Elevation 5', 'estacion': 'MONITOREO ACTUAL "MIRADOR II"'},
];

class ResumenScreen extends StatelessWidget {
  static const String name = 'resumen_screen';
  const ResumenScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Resumen de estaciones'),
      ),
      body: const _ResumenView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }

}

class _ResumenView extends StatelessWidget {
  const _ResumenView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardType(label: card['label'], elevation: card['elevation'], estacion: card['estacion'],)),
        ],
      ),
    );
  }
}

class _CardType extends StatelessWidget {
  final String label;
  final double elevation;
  final String estacion;
  const _CardType({required this.label, required this.elevation, required this.estacion});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Card(
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: SizedBox(
              width: 500,
              child: Column(
                children: [            
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert_outlined),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    title: Text(estacion, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ),
                  const ListTile(
                    leading: Icon(Icons.device_thermostat_outlined),
                    title: Text('Temperatura'),
                    subtitle: Text('25° C')
                  ),
                  const ListTile(
                    leading: Icon(Icons.water_drop_outlined),
                    title: Text('Humedad'),
                    subtitle: Text('90%')
                  ),
                  const ListTile(
                    leading: Icon(Icons.wind_power_outlined),
                    title: Text('Velocidad del viento'),
                    subtitle: Text('15.00 km/h')
                  ),
                  const ListTile(
                    leading: Icon(Icons.cloudy_snowing),
                    title: Text('Precipitación'),
                    subtitle: Text('230.00 mm')
                  ),
                  const ListTile(
                    leading: Icon(Icons.atm_outlined),
                    title: Text('Presión atmosférica'),
                    subtitle: Text('810.00 mb')
                  ),
                  const ListTile(
                    leading: Icon(Icons.light_mode_outlined),
                    title: Text('Radiación'),
                    subtitle: Text('1 W/m^2')
                  ),
                  const Divider(),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("15-09-2023 09:17:00"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}