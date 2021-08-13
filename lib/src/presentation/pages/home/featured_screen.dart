import 'package:flutter/material.dart';
import 'package:project_latam/src/presentation/pages/home/widgets/card_item.dart';
import 'package:project_latam/src/presentation/providers/item/item_provider.dart';
import 'package:project_latam/src/domain/models/item/item.dart';
import 'package:provider/provider.dart';

class FeaturedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<ItemProvider>(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Image.asset(
                "assets/images/banner-principal-mobile.jpg",
              ),
            ),
            _buildCarousel(context),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'PRODUCTOS MÁS BUSCADOS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  FutureBuilder<List<Item>>(
                    future: itemProvider.viewItems(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final items = snapshot.data;
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, i) => CardItem(
                              item: items[i],
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Image.asset(
                              'assets/images/loading.gif',
                              fit: BoxFit.cover,
                              height: 50,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        right: 5,
        bottom: 25,
        left: 5,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return _buildCarouselItem(context, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/banner_featured_$itemIndex.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
