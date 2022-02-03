import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:qr_reader_app/models/scan_model.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if (scan.tipo == 'http') {
    if (!await launch(url)) throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
