import 'package:flutter/material.dart';
import 'package:analisis_roya/config/controller/getlastprosp3_controller.dart';
import 'package:analisis_roya/config/controller/gethistoricprosp3_controller.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:analisis_roya/presentation/widgets/side_menu.dart';

class EstacionScreen extends StatefulWidget {
  static const String name = 'estacion_screen';
  const EstacionScreen({Key? key}) : super(key: key);

  @override
  State<EstacionScreen> createState() => _EstacionScreenState();
}

class _EstacionScreenState extends State<EstacionScreen> {
  final getLastProsp3Controller = Get.put(GetLastProsp3Controller());
  final getHistoricProsp3Controller = Get.put(GetHistoricProsp3Controller());

  final List<String> list = <String>['Temperatura', 'Humedad', 'Presión Atmosférica', 'Intensidad de Luz', 'Temp. de Suelo', 'Hum. de Suelo'];
  String dropdownValue = 'Temperatura';

  bool showTempWidgets = true;
  bool showHumidityWidgets = false;
  bool showPressWidgets = false;
  bool showLightWidgets = false;
  bool showTempSueloWidgets = false;
  bool showHumiditySueloWidgets = false;

  @override
  void initState() {
    getLastProsp3Controller.getDataFromApi();
    getHistoricProsp3Controller.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estaciones'),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: Obx(
        () => Scaffold(
          body: !getLastProsp3Controller.isLoading.value
              ? SafeArea(
                child: Stack(
                    children: [
                      _fondo(),
                      Padding(padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _titulo(),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: _comboBox(),
                            ),
                          ],
                        ),
                      ),
                      // Gauge y Datagrama de Temperatura
                      Visibility(
                        visible: showTempWidgets,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0,40,0,0),
                          child: Column(
                            children: [
                              const Spacer(flex: 5),
                              _gaugeTemp(),
                              SizedBox(
                                height:300,
                                child: _datagramaTemp(),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                  
                      // Gauge y Datagrama de Humedad
                      Visibility(
                        visible: showHumidityWidgets,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0,40,0,0),
                          child: Column(
                            children: [
                              const Spacer(flex: 5),
                              _gaugeHum(),
                              SizedBox(
                                height: 300,
                                child: _datagramaHum()),
                            ],
                          ),
                        ),
                      ),

                      Visibility(
                        visible: showPressWidgets,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0,40,0,0),
                          child: Column(
                            children: [
                              const Spacer(flex: 5),
                              _gaugePress(),
                              SizedBox(
                                height:300,
                                child: _datagramaPress(),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Visibility(
                        visible: showLightWidgets,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              const Spacer(flex: 5),
                              _gaugeLight(),
                              _datagramaLight(),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: showTempSueloWidgets,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              const Spacer(flex: 5),
                              _gaugeTempSuelo(),
                              _datagramaTempSuelo(),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: showHumiditySueloWidgets,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              const Spacer(flex: 5),
                              _gaugeHumSuelo(),
                              _datagramaHumSuelo(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _fondo() {
    return Opacity(
      opacity: 0.6,
      child: Image.asset(
        'assets/images/fondocafe1.png',
        fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
        width: double.infinity, // Ancho de la imagen igual al ancho de la pantalla
        height: double.infinity, // Alto de la imagen igual al alto de la pantalla
      ),
    );
  }

  Widget _gaugeTemp() {

    var tempsuelo = double.parse(
        getLastProsp3Controller.getDataModel.value.results.tempsuelo);

    return SizedBox(
      width: 200, // Ajusta el ancho del contenedor según tus necesidades
      height: 200, // Ajusta la altura del contenedor según tus necesidades
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 41,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 10,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 10,
                endValue: 15,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 15,
                endValue: 27,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 27,
                endValue: 32,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10,
              ),
              GaugeRange(
                startValue: 32,
                endValue: 41,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10,
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: tempsuelo,
                needleStartWidth: 1,
                needleEndWidth: 4,
                needleLength: 0.5,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  "${getLastProsp3Controller
                          .getDataModel.value.results.tempsuelo}°",
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _datagramaTemp() {
    final dataModel = getHistoricProsp3Controller.getDataModel.value;

    // Map the JSON data to a list of FlSpot for the chart
    final List<FlSpot> spots = dataModel.results
        .map((entry) => FlSpot(
              double.parse(entry.id),
              double.parse(entry.tempsuelo),
            ))
        .toList();

    final double maxValue = dataModel.results
        .map((entry) => double.parse(entry.tempsuelo))
        .reduce((max, value) => max > value ? max : value);

    final double minValue = dataModel.results
        .map((entry) => double.parse(entry.tempsuelo))
        .reduce((min, value) => min < value ? min : value);

    // Línea para el valor máximo de temperatura
    final List<FlSpot> maxTempLine = dataModel.results
        .map((entry) => FlSpot(
              double.parse(entry.id),
              maxValue,
            ))
        .toList();

    // Línea para el valor mínimo de temperatura
    final List<FlSpot> minTempLine = dataModel.results
        .map((entry) => FlSpot(
              double.parse(entry.id),
              minValue,
            ))
        .toList();

    return Positioned(
      child: SizedBox(
        height: 360,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: LineChart(
                  LineChartData(
                    titlesData: const FlTitlesData(show: false),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: spots.first.x,
                    maxX: spots.last.x,
                    minY: 10,
                    maxY: 35, // Ajusta según tus necesidades
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.black.withOpacity(0.6),
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true, color: Colors.black.withOpacity(0.3)),
                      ),
                      // Línea para el valor máximo de temperatura
                      LineChartBarData(
                        spots: maxTempLine,
                        isCurved:
                            false, // Puedes ajustar si la línea es curva o no
                        color: Colors.orange, // Color para la línea máxima
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),

                      // Línea para el valor mínimo de temperatura
                      LineChartBarData(
                        spots: minTempLine,
                        isCurved:
                            false, // Puedes ajustar si la línea es curva o no
                        color: Colors.indigo, // Color para la línea mínima
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gaugeHum() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var humsuelo = double.parse(
        getLastProsp3Controller.getDataModel.value.results.humsuelo);

    return Positioned(
      left: width / 4, // Posición izquierda del widget
      top: height / 3.8, // Posición superior del widget
      child: SizedBox(
        width: 200, // Ajusta el ancho del contenedor según tus necesidades
        height: 200, // Ajusta la altura del contenedor según tus necesidades
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 34,
              maximum: 105,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 34,
                  endValue: 45,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 45,
                  endValue: 60,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 60,
                  endValue: 75,
                  color: Colors.green,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 75,
                  endValue: 90,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 90,
                  endValue: 105,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: humsuelo,
                  needleStartWidth: 1,
                  needleEndWidth: 4,
                  needleLength: 0.5,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    "${getLastProsp3Controller
                            .getDataModel.value.results.humsuelo}%",
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _datagramaHum() {
    final dataModel = getHistoricProsp3Controller.getDataModel.value;

    // Map the JSON data to a list of FlSpot for the chart
    final List<FlSpot> spots = dataModel.results
        .map((entry) => FlSpot(
              double.parse(entry.id),
              double.parse(entry.humsuelo),
            ))
        .toList();

    final double maxValue = dataModel.results
        .map((entry) => double.parse(entry.humsuelo))
        .reduce((max, value) => max > value ? max : value);

    final double minValue = dataModel.results
        .map((entry) => double.parse(entry.humsuelo))
        .reduce((min, value) => min < value ? min : value);

    // Línea para el valor máximo de temperatura
    final List<FlSpot> maxTempLine = dataModel.results
        .map((entry) => FlSpot(
              double.parse(entry.id),
              maxValue,
            ))
        .toList();

    // Línea para el valor mínimo de temperatura
    final List<FlSpot> minTempLine = dataModel.results
        .map((entry) => FlSpot(
              double.parse(entry.id),
              minValue,
            ))
        .toList();

    return Positioned(
      child: SizedBox(
        height: 360,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: LineChart(
                  LineChartData(
                    titlesData: const FlTitlesData(show: false),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: spots.first.x,
                    maxX: spots.last.x,
                    minY: 10,
                    maxY: 100, // Ajusta según tus necesidades
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.black.withOpacity(0.6),
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true, color: Colors.black.withOpacity(0.3)),
                      ),
                      // Línea para el valor máximo de temperatura
                      LineChartBarData(
                        spots: maxTempLine,
                        isCurved:
                            false, // Puedes ajustar si la línea es curva o no
                        color: Colors.orange, // Color para la línea máxima
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 2.0, // Tamaño de los puntos
                              color: Colors.orange, // Color de los puntos
                              strokeWidth: 0, // Ancho del trazo de la línea
                              strokeColor:
                                  Colors.transparent, // Color del trazo
                            );
                          },
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),

                      // Línea para el valor mínimo de temperatura
                      LineChartBarData(
                        spots: minTempLine,
                        isCurved:
                            false, // Puedes ajustar si la línea es curva o no
                        color: Colors.indigo, // Color para la línea mínima
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 2.0, // Tamaño de los puntos
                              color: Colors.indigo, // Color de los puntos
                              strokeWidth: 0, // Ancho del trazo de la línea
                              strokeColor:
                                  Colors.transparent, // Color del trazo
                            );
                          },
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gaugePress(){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var press = double.parse(getLastProsp3Controller.getDataModel.value.results.press);

    return Positioned(
      left: width/3, // Posición izquierda del widget
      top: height/6, // Posición superior del widget
      child: Container(
        width: 200, // Ajusta el ancho del contenedor según tus necesidades
        height: 200, // Ajusta la altura del contenedor según tus necesidades
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 600,
              maximum: 1301,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 60,
                  endValue: 700,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 700,
                  endValue: 800,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 800,
                  endValue: 1100,
                  color: Colors.green,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 1100,
                  endValue: 1200,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 1200,
                  endValue: 1300,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: press,
                  needleStartWidth: 1,
                  needleEndWidth: 3,
                  needleLength: 0.5,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                    child: Text(
                      getLastProsp3Controller.getDataModel.value.results.press + "°",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _datagramaPress(){

    final dataModel = getHistoricProsp3Controller.getDataModel.value;

    // Map the JSON data to a list of FlSpot for the chart
    final List<FlSpot> spots = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      double.parse(entry.press),
    ))
        .toList();

    final double maxValue = dataModel.results
        .map((entry) => double.parse(entry.press))
        .reduce((max, value) => max > value ? max : value);

    final double minValue = dataModel.results
        .map((entry) => double.parse(entry.press))
        .reduce((min, value) => min < value ? min : value);

    // Línea para el valor máximo de temperatura
    final List<FlSpot> maxTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      maxValue,
    ))
        .toList();

    // Línea para el valor mínimo de temperatura
    final List<FlSpot> minTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      minValue,
    ))
        .toList();

    return Positioned(
      child: Container(
        height: 360,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: false),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: spots.first.x,
                    maxX: spots.last.x,
                    minY: 10,
                    maxY: 800, // Ajusta según tus necesidades
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.black.withOpacity(0.6),
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true,
                            color: Colors.black.withOpacity(0.3)
                        ),
                      ),
                      // Línea para el valor máximo de temperatura
                      LineChartBarData(
                        spots: maxTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.orange, // Color para la línea máxima
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),

                      // Línea para el valor mínimo de temperatura
                      LineChartBarData(
                        spots: minTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.indigo, // Color para la línea mínima
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gaugeLight(){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var light = double.parse(getLastProsp3Controller.getDataModel.value.results.luz);

    return Positioned(
      left: width/3, // Posición izquierda del widget
      top: height/6, // Posición superior del widget
      child: Container(
        width: 200, // Ajusta el ancho del contenedor según tus necesidades
        height: 200, // Ajusta la altura del contenedor según tus necesidades
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 60100,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 1000,
                  color: Colors.indigo,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 1000,
                  endValue: 15000,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 15000,
                  endValue: 60100,
                  color: Colors.yellowAccent,
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: light,
                  needleStartWidth: 1,
                  needleEndWidth: 4,
                  needleLength: 0.5,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                    child: Text(
                      getLastProsp3Controller.getDataModel.value.results.luz + "°",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _datagramaLight(){

    final dataModel = getHistoricProsp3Controller.getDataModel.value;

    // Map the JSON data to a list of FlSpot for the chart
    final List<FlSpot> spots = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      double.parse(entry.luz),
    ))
        .toList();

    final double maxValue = dataModel.results
        .map((entry) => double.parse(entry.luz))
        .reduce((max, value) => max > value ? max : value);

    final double minValue = dataModel.results
        .map((entry) => double.parse(entry.luz))
        .reduce((min, value) => min < value ? min : value);

    // Línea para el valor máximo de temperatura
    final List<FlSpot> maxTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      maxValue,
    ))
        .toList();

    // Línea para el valor mínimo de temperatura
    final List<FlSpot> minTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      minValue,
    ))
        .toList();

    return Positioned(
      child: Container(
        height: 360,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: false),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: spots.first.x,
                    maxX: spots.last.x,
                    minY: 0,
                    maxY: 65000, // Ajusta según tus necesidades
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.black.withOpacity(0.6),
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true,
                            color: Colors.black.withOpacity(0.3)
                        ),
                      ),
                      // Línea para el valor máximo de temperatura
                      LineChartBarData(
                        spots: maxTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.orange, // Color para la línea máxima
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),

                      // Línea para el valor mínimo de temperatura
                      LineChartBarData(
                        spots: minTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.indigo, // Color para la línea mínima
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gaugeTempSuelo(){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var tempsuelo = double.parse(getLastProsp3Controller.getDataModel.value.results.tempsuelo);

    return Positioned(
      left: width/3, // Posición izquierda del widget
      top: height/6, // Posición superior del widget
      child: Container(
        width: 200, // Ajusta el ancho del contenedor según tus necesidades
        height: 200, // Ajusta la altura del contenedor según tus necesidades
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 41,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 10,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 10,
                  endValue: 15,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 15,
                  endValue: 27,
                  color: Colors.green,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 27,
                  endValue: 32,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 32,
                  endValue: 41,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: tempsuelo,
                  needleStartWidth: 1,
                  needleEndWidth: 4,
                  needleLength: 0.5,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                    child: Text(
                      getLastProsp3Controller.getDataModel.value.results.tempsuelo + "°",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _datagramaTempSuelo(){

    final dataModel = getHistoricProsp3Controller.getDataModel.value;

    // Map the JSON data to a list of FlSpot for the chart
    final List<FlSpot> spots = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      double.parse(entry.tempsuelo),
    ))
        .toList();

    final double maxValue = dataModel.results
        .map((entry) => double.parse(entry.tempsuelo))
        .reduce((max, value) => max > value ? max : value);

    final double minValue = dataModel.results
        .map((entry) => double.parse(entry.tempsuelo))
        .reduce((min, value) => min < value ? min : value);

    // Línea para el valor máximo de temperatura
    final List<FlSpot> maxTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      maxValue,
    ))
        .toList();

    // Línea para el valor mínimo de temperatura
    final List<FlSpot> minTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      minValue,
    ))
        .toList();

    return Positioned(
      child: Container(
        height: 360,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: false),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: spots.first.x,
                    maxX: spots.last.x,
                    minY: 10,
                    maxY: 35, // Ajusta según tus necesidades
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.black.withOpacity(0.6),
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true,
                            color: Colors.black.withOpacity(0.3)
                        ),
                      ),
                      // Línea para el valor máximo de temperatura
                      LineChartBarData(
                        spots: maxTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.orange, // Color para la línea máxima
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),

                      // Línea para el valor mínimo de temperatura
                      LineChartBarData(
                        spots: minTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.indigo, // Color para la línea mínima
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gaugeHumSuelo(){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var humsuelo = double.parse(getLastProsp3Controller.getDataModel.value.results.humsuelo);

    return Positioned(
      left: width/4, // Posición izquierda del widget
      top: height/3.8, // Posición superior del widget
      child: Container(
        width: 200, // Ajusta el ancho del contenedor según tus necesidades
        height: 200, // Ajusta la altura del contenedor según tus necesidades
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 34,
              maximum: 105,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 34,
                  endValue: 45,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 45,
                  endValue: 60,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 60,
                  endValue: 75,
                  color: Colors.green,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 75,
                  endValue: 90,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 90,
                  endValue: 105,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: humsuelo,
                  needleStartWidth: 1,
                  needleEndWidth: 4,
                  needleLength: 0.5,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                    child: Text(
                      getLastProsp3Controller.getDataModel.value.results.humsuelo + "%",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _datagramaHumSuelo(){

    final dataModel = getHistoricProsp3Controller.getDataModel.value;

    // Map the JSON data to a list of FlSpot for the chart
    final List<FlSpot> spots = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      double.parse(entry.humsuelo),
    ))
        .toList();

    final double maxValue = dataModel.results
        .map((entry) => double.parse(entry.humsuelo))
        .reduce((max, value) => max > value ? max : value);

    final double minValue = dataModel.results
        .map((entry) => double.parse(entry.humsuelo))
        .reduce((min, value) => min < value ? min : value);

    // Línea para el valor máximo de temperatura
    final List<FlSpot> maxTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      maxValue,
    ))
        .toList();

    // Línea para el valor mínimo de temperatura
    final List<FlSpot> minTempLine = dataModel.results
        .map((entry) => FlSpot(
      double.parse(entry.id),
      minValue,
    ))
        .toList();

    return Positioned(
      child: Container(
        height: 360,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: false),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: spots.first.x,
                    maxX: spots.last.x,
                    minY: 10,
                    maxY: 100, // Ajusta según tus necesidades
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.black.withOpacity(0.6),
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true,
                            color: Colors.black.withOpacity(0.3)
                        ),
                      ),
                      // Línea para el valor máximo de temperatura
                      LineChartBarData(
                        spots: maxTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.orange, // Color para la línea máxima
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 2.0, // Tamaño de los puntos
                              color: Colors.orange, // Color de los puntos
                              strokeWidth: 0, // Ancho del trazo de la línea
                              strokeColor: Colors.transparent, // Color del trazo
                            );
                          },
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),

                      // Línea para el valor mínimo de temperatura
                      LineChartBarData(
                        spots: minTempLine,
                        isCurved: false, // Puedes ajustar si la línea es curva o no
                        color: Colors.indigo, // Color para la línea mínima
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 2.0, // Tamaño de los puntos
                              color: Colors.indigo, // Color de los puntos
                              strokeWidth: 0, // Ancho del trazo de la línea
                              strokeColor: Colors.transparent, // Color del trazo
                            );
                          },
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _comboBox() {
    //var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Positioned(
        top: height / 6,
        left: 40,
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: DropdownMenu<String>(
            initialSelection: dropdownValue,
            onSelected: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;

                // Actualiza la visibilidad de los widgets según la opción seleccionada
                if (dropdownValue == 'Temperatura') {
                  showTempWidgets = true;
                  showHumidityWidgets = false;
                  showPressWidgets = false;
                  showLightWidgets = false;
                  showTempSueloWidgets = false;
                  showHumiditySueloWidgets = false;
                } else if (dropdownValue == 'Humedad') {
                  showTempWidgets = false;
                  showHumidityWidgets = true;
                  showPressWidgets = false;
                  showLightWidgets = false;
                  showTempSueloWidgets = false;
                  showHumiditySueloWidgets = false;
                } else if (dropdownValue == 'Presión Atmosférica') {
                  showTempWidgets = false;
                  showHumidityWidgets = false;
                  showPressWidgets = true;
                  showLightWidgets = false;
                  showTempSueloWidgets = false;
                  showHumiditySueloWidgets = false;
                } else if (dropdownValue == 'Intensidad de Luz') {
                  showTempWidgets = false;
                  showHumidityWidgets = false;
                  showPressWidgets = false;
                  showLightWidgets = true;
                  showTempSueloWidgets = false;
                  showHumiditySueloWidgets = false;
                } else if (dropdownValue == 'Temp. de Suelo') {
                  showTempWidgets = false;
                  showHumidityWidgets = false;
                  showPressWidgets = false;
                  showLightWidgets = false;
                  showTempSueloWidgets = true;
                  showHumiditySueloWidgets = false;
                } else if (dropdownValue == 'Hum. de Suelo') {
                  showTempWidgets = false;
                  showHumidityWidgets = false;
                  showPressWidgets = false;
                  showLightWidgets = false;
                  showTempSueloWidgets = false;
                  showHumiditySueloWidgets = true;
                }
              });
            },
            dropdownMenuEntries:
                list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
        ));
  }

  Widget _titulo() {
    

    return Positioned(
        
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Estación Prosperidad 3',
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                ),
          ),
        ));
  }
}
