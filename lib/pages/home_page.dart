import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader_app/widgets/custom_navigationbar.dart';
import 'package:qr_reader_app/pages/directions_page.dart';
import 'package:qr_reader_app/pages/map_history_page.dart';
import 'package:qr_reader_app/providers/db_provider.dart';
import 'package:qr_reader_app/providers/ui_provider.dart';
import 'package:qr_reader_app/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const _HomeBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}

class _HomeBody extends StatelessWidget {

  const _HomeBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    DBProvider.db.database;

    switch (currentIndex) {
      case 0:
        return const MapHistoryPage();
      case 1:
        return const DirectionsPage();
      default:
        return const MapHistoryPage();
    }
  }

}
