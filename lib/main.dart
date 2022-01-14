import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader_app/pages/home_page.dart';
import 'package:qr_reader_app/pages/map_page.dart';
import 'package:qr_reader_app/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UiProvider>(create: (_) => UiProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'map': (_) => const MapPage()
        },
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        ),
      ),
    );
  }

}
