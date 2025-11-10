import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

var appMenuItems = <MenuItem>[
  MenuItem(title: 'Inicio', subTitle: '', link: '/home', icon: Icons.home),
  MenuItem(
    title: 'Creditos',
    subTitle: '',
    link: '/credits',
    icon: Icons.people,
  ),
  MenuItem(
    title: 'Salir',
    subTitle: '',
    link: '/splash',
    icon: Icons.exit_to_app,
  ),
  MenuItem(
    title: 'Operaciones Basicas',
    subTitle: '',
    link: '/operation_basics',
    icon: Icons.calculate,
  ),
  MenuItem(
    title: 'Moneda',
    subTitle: '',
    link: '/currency_exchange',
    icon: Icons.calculate,
  ),
  MenuItem(
    title: 'Temperatura',
    subTitle: '',
    link: '/temperature_converter',
    icon: Icons.thermostat,
  ),
  MenuItem(
    title: 'Distancias',
    subTitle: '',
    link: '/distances',
    icon: Icons.location_on,
  ),
  MenuItem(
    title: 'Areas',
    subTitle: '',
    link: '/area_geometric_figures',
    icon: Icons.area_chart_outlined,
  ),
  MenuItem(
    title: 'Volumen',
    subTitle: '',
    link: '/volume',
    icon: Icons.view_column_rounded,
  ),
  MenuItem(
    title: 'Oprime el boton',
    subTitle: '',
    link: '/press_button',
    icon: Icons.radio_button_on,
  ),
  MenuItem(
    title: 'Botones de colores',
    subTitle: '',
    link: '/colors_buttons',
    icon: Icons.color_lens,
  ),
];
