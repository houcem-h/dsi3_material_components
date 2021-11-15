import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Icon _heartIcon = const Icon(Icons.favorite_border, color: Colors.white);
  bool _checkLike = false;
  int _selectedIndex = 0;
  String _display = "0: Home view";

  void _likeThis() {
    setState(() {
      if(_checkLike) {
        _heartIcon = const Icon(Icons.favorite_border, color: Colors.white);
        _checkLike = false;
      } else {
        _heartIcon = const Icon(Icons.favorite, color: Colors.white);
        _checkLike = true;
      }
    });
  }

  void _clickedItem(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0: {
          _display = "$_selectedIndex: Home view";
        }
        break;
        case 1: {
          _display = "$_selectedIndex: Account view";
        }
        break;
        case 2: {
          _display = "$_selectedIndex: Settings view";
        }
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
              onPressed: _likeThis,
              icon: _heartIcon
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _display,
              style: const TextStyle(color: Colors.indigoAccent, fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        backgroundColor: Colors.indigoAccent,
        child: _heartIcon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.white),
              title: Text('Account', style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white))
          ),
        ],
        backgroundColor: Colors.indigoAccent,
        currentIndex: _selectedIndex,
        onTap: _clickedItem,
      )
    );
  }
}
