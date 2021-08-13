import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_latam/src/presentation/pages/catalogue/catalogue_screen.dart';
import 'package:project_latam/src/presentation/pages/home/home_screen.dart';
import 'package:project_latam/src/presentation/providers/bottomNavigationBar/btmNavBar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  var currentTab = [
    HomeScreen(),
    CatalogueScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.currentIndex = index;
          },
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(6),
                child: Icon(CupertinoIcons.home),
              ),
              label: 'INICIO',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(6),
                child: Icon(CupertinoIcons.search),
              ),
              label: 'CATÁLOGO',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(6),
                child: Icon(CupertinoIcons.heart),
              ),
              label: 'FAVORITOS',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(6),
                child: Icon(CupertinoIcons.cart),
              ),
              label: 'CARRITO',
            ),
          ],
        ),
      ),
    );
  }
}
