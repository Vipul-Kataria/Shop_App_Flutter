import 'package:flutter/material.dart';
import 'package:shop_app_flutter/cart_page.dart';

import 'package:shop_app_flutter/product_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = ["All", "Addidas", "Nike", "Bata", "Campus"];
  late String selectedFilters;
  int currentPage = 0;
  List<Widget> pages=[ProductList(),CartPage()];

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.amberAccent,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30),
            label: '',
          ),
        ],
      ),
    );
  }
}
