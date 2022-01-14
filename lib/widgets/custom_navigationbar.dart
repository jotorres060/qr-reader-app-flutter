import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader_app/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (index) => uiProvider.selectedMenuOpt = index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Map'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_outlined),
          label: 'Directions'
        )
      ]
    );
  }

}
