import 'package:flutter/material.dart';
import 'package:analisis_roya/presentation/widgets/side_menu.dart';

const parametros = <Map<String, dynamic>>[
  {'seccion': 'Humedad vs Tiempo (minutos)', 'prmt1': '0.5092', 'prmt2': '5.2741','prmt3': '6.5289'},
  {'seccion': 'Temperatura vs Tiempo (minutos)', 'prmt1': '0.5664', 'prmt2': '1.1811','prmt3': '1.4880'},
];

class AnaliticaScreen extends StatelessWidget {
  static const String name = 'analitica_screen';
  const AnaliticaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analitica de datos'),
      ),
      body: const _AnaliticaView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _AnaliticaView extends StatelessWidget {
  const _AnaliticaView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...parametros.map((prmt) => _CardType(seccion: prmt['seccion'], prmt1: prmt['prmt1'], prmt2: prmt['prmt2'], prmt3: prmt['prmt3'])),
        ],
      )
    );
  }
}

class _CardType extends StatelessWidget {
  final String seccion;
  final String prmt1;
  final String prmt2;
  final String prmt3;
  const _CardType({required this.seccion, required this.prmt1, required this.prmt2, required this.prmt3});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: SizedBox(
              width: 500,
              //height: 810,
              child: Column(
                children: [
                  Text(seccion, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  const Divider(),
                  const Text('Regresión lineal', style: TextStyle(fontSize: 16)),
                  ListTile(
                    title: const Text('Coeficiente de correlación'),
                    subtitle:  Text(prmt1),
                  ),
                  ListTile(
                    title: const Text('Error Absoluto Medio (MAE)'),
                    subtitle: Text(prmt2),
                  ),
                  ListTile(
                    title: const Text('Raiz del Error Cuadrático Medio (RMSE)'),
                    subtitle: Text(prmt3),
                  ),
                  Image.network(
                    'https://alertaroya.ddns.net/static/grafica2.png',
                    width: 350,
                    fit: BoxFit.contain
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Text('Algoritmo M5P', style: TextStyle(fontSize: 16)),
                  ListTile(
                    title: const Text('Coeficiente de correlación'),
                    subtitle:  Text(prmt1),
                  ),
                  ListTile(
                    title: const Text('Error Absoluto Medio (MAE)'),
                    subtitle: Text(prmt2),
                  ),
                  ListTile(
                    title: const Text('Raiz del Error Cuadrático Medio (RMSE)'),
                    subtitle: Text(prmt3),
                  ),
                  Image.network(
                    'https://alertaroya.ddns.net/static/grafica3.png',
                    width: 350,
                    fit: BoxFit.contain
                  ),
                  const SizedBox(height: 10),
                ]
              )
            )
          )
        )
      ),
    );
  }
}