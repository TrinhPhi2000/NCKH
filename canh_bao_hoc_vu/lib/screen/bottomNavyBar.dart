// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class BottomNavyBar extends StatefulWidget {
  const BottomNavyBar({Key? key}) : super(key: key);

  @override
  _BottomNavyBarState createState() => _BottomNavyBarState();
}

class _BottomNavyBarState extends State<BottomNavyBar> {
  int selectedIndex = 0;
  Color backgroudColor = Colors.white;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home),Text("Trang chủ ", style: TextStyle(fontWeight: FontWeight.bold)),),
    NavigationItem(Icon(Icons.notifications), Text("Thông báo", style: TextStyle(fontWeight: FontWeight.bold))),
    NavigationItem(Icon(Icons.settings), Text("Cá nhân", style: TextStyle(fontWeight: FontWeight.bold)))
  ];
  Widget _buildItem(NavigationItem item, bool isSelected){
    return Container(
      padding: EdgeInsets.all(7),
      height: 40,
      width: isSelected ? 150 : 50,
      decoration: isSelected ? BoxDecoration(
        color: Color.fromRGBO(218, 222, 234, 100),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ) : null ,
      child: Row(
        children:  <Widget>[
          IconTheme(
              data: IconThemeData(
                color: isSelected ? Color.fromRGBO(35, 175, 125, 100) : Colors.black,
                size: 26,
              ),
              child: item.icon
          ), isSelected ? Padding(
            padding: const EdgeInsets.only(left: 7),
            child:DefaultTextStyle.merge(
                style: TextStyle(
                  color:  Color.fromRGBO(35, 175, 125, 100),
                  //backgroudColor
                ),
                child: item.title
            ),
          ) : Container()
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item){
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  NavigationItem(this.icon, this.title);
}
