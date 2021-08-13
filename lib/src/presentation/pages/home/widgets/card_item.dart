import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project_latam/src/domain/models/item/item.dart';
import 'package:project_latam/src/presentation/widgets/accordion.dart';
import 'dart:math';

import 'package:project_latam/src/presentation/widgets/counter.dart';

class CardItem extends StatelessWidget {
  final Item item;

  const CardItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMaterialModalBottomSheet(
        context: context,
        enableDrag: false,
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            backwardsCompatibility: false,
            elevation: 0,
            leading: IconButton(
              icon: Icon(CupertinoIcons.chevron_left),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () => () {},
              ),
              IconButton(
                icon: Icon(CupertinoIcons.heart),
                onPressed: () => () {},
              ),
              IconButton(
                icon: Icon(CupertinoIcons.cart),
                onPressed: () => () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15,
              ),
              child: Column(
                children: [
                  Center(
                    child: FadeInImage(
                      image: NetworkImage(item.thumbnail),
                      placeholder: AssetImage(
                        'assets/images/loading.gif',
                      ),
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                  Container(
                    color: Color(0xffF6F6F6),
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  item.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Counter(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${NumberFormat("#,##0", "es_CO").format(item.price)}',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5B17AA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        DefaultTextStyle(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 35,
                              bottom: 10,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.car,
                                  color: Color(0xff169841),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Envío Gratis',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          style: TextStyle(
                            color: Color(0xff169841),
                          ),
                        ),
                        Container(
                          child: Text(
                              'Recíbelo del 22 al 26 de julio en Medellín'),
                        ),
                        Accordion(
                          title: 'Detalles del producto',
                          content:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        ),
                        Accordion(
                          title: 'Reseñas del producto',
                          content:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          showContent: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: MediaQuery.of(context).size.height / 13.5,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FloatingActionButton.extended(
              label: Text('Comprar ahora'),
              backgroundColor: Color(0xff5B17AA),
              onPressed: () {},
              isExtended: true,
              elevation: 0,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
      child: Card(
        elevation: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: FadeInImage(
                      image: NetworkImage(item.thumbnail),
                      placeholder: AssetImage(
                        'assets/images/loading.gif',
                      ),
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: Random().nextDouble() * 5,
                        minRating: 1,
                        itemSize: 10,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) => print(rating),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${NumberFormat("#,##0", "es_CO").format(item.price)}',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5B17AA),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
