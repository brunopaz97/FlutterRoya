import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Resumen de estaciones',
      subTitle: 'Información resumida de las estaciones',
      link: '/',
      icon: Icons.home_rounded),
  MenuItem(
      title: 'Estaciones',
      subTitle: 'Informacion detallada de las estaciones',
      link: '/estacion',
      icon: Icons.dew_point),
  MenuItem(
      title: 'Registro de datos',
      subTitle: 'Un contenedor estilizado',
      link: '/registro',
      icon: Icons.edit_document),
  MenuItem(
      title: 'Mapa interactivo',
      subTitle: 'Generales y controlados',
      link: '/mapa',
      icon: Icons.map_rounded),
  MenuItem(
      title: 'Analítica de datos',
      subTitle: 'Generales y controlados',
      link: '/analitica',
      icon: Icons.bar_chart_rounded),
  MenuItem(
      title: 'Análisis de la roya',
      subTitle: 'Generales y controlados',
      link: '/detector',
      icon: Icons.image_search_rounded),
];
