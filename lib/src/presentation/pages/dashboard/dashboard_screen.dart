import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_latam/src/presentation/pages/dashboard/btmNavBar_screen.dart';
import 'package:project_latam/src/presentation/providers/bottomNavigationBar/btmNavBar_provider.dart';
import 'package:project_latam/src/presentation/providers/item/item_provider.dart';
import 'package:project_latam/src/presentation/providers/item/item_search_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (_) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider<ItemProvider>(
          create: (_) => ItemProvider(),
        ),
        ChangeNotifierProvider<ItemSearchProvider>(
          create: (_) => ItemSearchProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: BottomNavigationBarScreen(),
      ),
    );
  }
}
