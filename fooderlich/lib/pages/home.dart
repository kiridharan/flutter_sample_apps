import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
      Container(color: Colors.red,),
      Container(color: Colors.green,),
      Container(color: Colors.blue,)
    ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12.0,
        title: Text('Fooderlich' ,
        style: Theme.of(context).textTheme.headline6,
        
        ),
      ),
 body: pages[_selectedIndex],
 bottomNavigationBar: BottomNavigationBar(
  // 5
  elevation: 12.0,
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  selectedItemColor:
    Theme.of(context).textSelectionTheme.selectionColor,
  // TODO: Set selected tab bar
  // 6
  items: <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      label: 'Card',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      label: 'Card2',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      label: 'Card3',
    ),
  ],
),
    );
  }
}