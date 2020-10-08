import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 400.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 0.5,
                child: Image(
                  height: 400.0,
                  //width: 100.0,
                  image: AssetImage('assets/burger.jpg'),
                  fit: BoxFit.fill,
                ),
              ),*/

              Expanded(
                flex: 3,
                child: FractionallySizedBox(
                  alignment: Alignment.topCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      child: Image(
                        image: AssetImage('assets/burger.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.red,
                  child: Text('Товар добавлен в корзину', style: TextStyle(color: Colors.black),),
                ),
              )

            ],
          ),
          margin: EdgeInsets.only(bottom: 0),
/*          decoration: BoxDecoration(
            color: Colors.white,

          ),*/
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
