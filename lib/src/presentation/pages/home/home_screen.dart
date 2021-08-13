import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_latam/src/presentation/widgets/not_found_screen.dart';

import 'featured_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          title: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * 0.16,
          centerTitle: true,
          bottom: _getTabBar(),
        ),
        body: _getTabBarView(),
      ),
    );
  }

  _getTabBar() {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: Color(0xff000000),
        ),
        insets: EdgeInsets.symmetric(horizontal: 15),
      ),
      tabs: <Widget>[
        Tab(
          child: Text(
            'DESTACADOS',
          ),
        ),
        Tab(
          child: Text(
            'CATEGORÍAS',
          ),
        ),
        Tab(
          child: Text(
            'PARA ELLA',
          ),
        ),
      ],
    );
  }

  _getTabBarView() {
    return TabBarView(
      children: <Widget>[
        FeaturedScreen(),
        NotFoundScreen(),
        NotFoundScreen(),
      ],
    );
  }
}
