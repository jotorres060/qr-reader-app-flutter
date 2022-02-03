import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader_app/providers/scan_list_provider.dart';
import 'package:qr_reader_app/utils/utils.dart';

class ScanTile extends StatelessWidget {

  final String tipo;

  const ScanTile({
    Key? key,
    required this.tipo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return Scaffold(
      body: ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (direction) {
            Provider.of<ScanListProvider>(context, listen: false).borrarPorId(scans[index].id);
          },
          child: ListTile(
            leading: Icon(
            tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
            color: Theme.of(context).primaryColor),
            title: Text(scans[index].valor),
            subtitle: Text('${ scans[index].id }'),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
            onTap: () {
              launchURL(context, scans[index]);
            },
          ),
        ),
      ),
    );
  }

}
