import 'package:dami/providers/BasketProvider.dart';
import 'package:dami/providers/ProductProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    final basketProductsList =
        Provider.of<BasketProvider>(context).listProducts;
    return Scaffold(
      appBar: AppBar(
          elevation: 5.0,
          backgroundColor: Colors.white,
          title: Text(
            'Корзина',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w600,
                fontSize: 22),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: basketProductsList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final productName = basketProductsList[index];
                    return Row(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          child: Center(
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                //color: Colors.purple,
                                image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: NetworkImage(productName.images),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                child: Text(
                              productName.title,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.purple,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    color: Colors.purple,
                                  )),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                      //color: Colors.grey,
                                      border: Border.all(
                                        color: Colors.purple,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.purple,
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0),
                  //width: 200.0,
                  //height: 50.0,
                  child: Center(
                    child: Text('Доставка из'),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('sdsd'),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
