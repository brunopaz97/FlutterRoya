import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:analisis_roya/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key,
  required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDraweIndex = 0;

  @override
  Widget build(BuildContext context) {

    return NavigationDrawer(
      selectedIndex: navDraweIndex,
      onDestinationSelected: (value){

        setState(() {
          navDraweIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children:[
        const Padding(
          padding: EdgeInsets.fromLTRB(28,20,16,10),
          child: Text('Main'),
          ),
        
        ...appMenuItems.map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title)),
        )        
      ]
      );
  }
}