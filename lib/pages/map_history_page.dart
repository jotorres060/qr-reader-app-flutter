import 'package:flutter/material.dart';

import 'package:qr_reader_app/widgets/scan_tile.dart';

class MapHistoryPage extends StatelessWidget {

  const MapHistoryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTile(tipo: 'geo');
  }

}
