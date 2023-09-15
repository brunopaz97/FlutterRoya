import 'package:go_router/go_router.dart';
import 'package:analisis_roya/presentation/screens/screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
 
  GoRoute(
    path: '/',
    name: ResumenScreen.name,
    builder: (context, state) => const ResumenScreen(),
  ),
  GoRoute(
    path: '/estacion',
    name: EstacionScreen.name,
    builder: (context, state) => const EstacionScreen(),
  ),
  GoRoute(
    path: '/registro',
    name: RegistroScreen.name,
    builder: (context, state) => const RegistroScreen(),
  ),
  GoRoute(
    path: '/mapa',
    name: MapaScreen.name,
    builder: (context, state) => const MapaScreen(),
  ),
  GoRoute(
    path: '/analitica',
    name: AnaliticaScreen.name,
    builder: (context, state) => const AnaliticaScreen(),
  ),
  GoRoute(
    path: '/detector',
    name: Detector.name,
    builder: (context, state) => const Detector(),
  ),
  
]);