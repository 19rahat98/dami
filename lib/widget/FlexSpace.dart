import 'package:dami/providers/CatalogsProvider.dart';
import 'package:dami/providers/ProductProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlexibleSpaceWidget extends StatefulWidget {
  const FlexibleSpaceWidget({Key key}) : super(key: key);

  @override
  _FlexibleSpaceWidgetState createState() => _FlexibleSpaceWidgetState();
}

class _FlexibleSpaceWidgetState extends State<FlexibleSpaceWidget> {
  int currentId = 0;
  bool loading = false;
  String activeTab = 'catalogs';

  Widget getStatusMessage(String message) {
    return SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
  }


  void sendProductId(productId) async{
    setState(() {});
    await Provider.of<ProductProvider>(context, listen: false).setIdProduct(productId);
  }




  @override
  Widget build(BuildContext context) {
    final productsList = Provider.of<ProductProvider>(context);
    final catalogsList = Provider.of<CatalogsProvider>(context).listCatalogs;

    return Container(
      padding: EdgeInsets.only(top: 50.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      //height: 1000,
      child: ListView.builder(
        itemCount: catalogsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final catalogName = catalogsList[index];
          return SizedBox (
            width: 100.0,
            //height: 20.0,
            child: FlatButton (
              onPressed:(){
                currentId = catalogName.id;
                sendProductId(currentId);
                productsList.init();
              },
              //color: Colors.green,
              padding: EdgeInsets.all ( 8.0 ),
              child: Text (
                catalogName.name,
                style: TextStyle (
                    color: Color ( 0xff750498 ),
                    fontWeight: FontWeight.w500,
                    fontSize: 18 ),
              ),
              shape: RoundedRectangleBorder (
                borderRadius: BorderRadius.circular ( 50.0 ),
                side: BorderSide (
                  color: Color ( 0xff750498 ),
                  width: 2,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
