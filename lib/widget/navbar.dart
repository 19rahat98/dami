
import 'package:dami/pages/basket_page.dart';
import 'package:dami/pages/first_page.dart';
import 'package:dami/pages/mainPage.dart';
import 'package:dami/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  Widget page = MainPage();
  int currentIndex = 0;


  whenBackButtonClicked() {
    if(currentIndex == 0){
      SystemNavigator.pop();
    }else{
      setState(() {
        currentIndex = 0;
        page = MainPage();
      });
    }

  }

  Widget customNavBar () {
    return Container(


      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10
            )
          ]
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey.withOpacity(.6),
        selectedFontSize: 16,
        unselectedFontSize: 16,


        onTap: (index) => setState(() {
          currentIndex = index;
          if(index == 0) {
            page = MainPage();
          }else if(index == 1){
            page = ShopPage();
          }else if(index == 2){
            page = FirstPage();
          }else if(index == 3){
            page = FirstPage();
          }else if(index == 4){
            page = BasketPage();
          }

        }),
        items: [
          BottomNavigationBarItem(
            title: Text('Главная'),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Магазин'),
            icon: Icon(
              Icons.loyalty,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Новости'),
            icon: Icon(
              Icons.format_list_bulleted,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Избранное'),
            icon: Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Корзина'),
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return whenBackButtonClicked();
      },
      child: Scaffold(
          bottomNavigationBar: customNavBar(),
          body: page),
    );
  }
}


