import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_latam/src/domain/models/item/item.dart';
import 'package:project_latam/src/presentation/pages/home/widgets/card_item.dart';
import 'package:project_latam/src/presentation/providers/item/item_search_provider.dart';
import 'package:project_latam/src/presentation/widgets/main_textFormField.dart';
import 'package:provider/provider.dart';

class CatalogueScreen extends StatefulWidget {
  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  late TextEditingController _controllerSearch;
  @override
  void initState() {
    super.initState();
    _controllerSearch = TextEditingController();
  }

  @override
  void dispose() {
    _controllerSearch.dispose();
    super.dispose();
  }

  _infoData({required BuildContext context}) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              child: SvgPicture.asset(
                'assets/images/undraw_empty.svg',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "Datos no encontrados...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<ItemSearchProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: MainTextFormField.textFormField(
          textInputAction: TextInputAction.search,
          controller: _controllerSearch,
          decoration: InputDecoration(
            fillColor: Color(0xffeeeeee),
            filled: true,
            hoverColor: Colors.black,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintText: 'Busca el producto aquí...',
            suffixIcon: Container(
              decoration: new BoxDecoration(
                color: Color(0xff6b6b6b).withOpacity(0.5),
              ),
              child: IconButton(
                onPressed: () => itemProvider.getItems(_controllerSearch.text),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onFieldSubmitted: (search) => itemProvider.getItems(search),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Item>>(
              future: itemProvider.viewItems(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data;
                  Widget viewItems;
                  if (items.length == 0) {
                    viewItems = _infoData(context: context);
                  } else {
                    viewItems = Container(
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
                  }
                  return viewItems;
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
    );
  }
}
