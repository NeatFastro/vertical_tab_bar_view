import 'package:example/api.dart';
import 'package:flutter/material.dart';

import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        accentColor: Colors.redAccent,
      ),
      home: Banner(
        message: 'Example',
        location: BannerLocation.topEnd,
        child: MyHomePage(title: 'Vertical Tab Bar Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final Api api = Api();
  List<Category> categories = [];

  TabController? _tabController;

  fetchAllCategories() {
    // _tabController?.dispose();
    api.getCategories().then((value) {
      setState(() {
        categories.addAll(value);
        _tabController = TabController(length: value.length, vsync: this);
      });
    });
  }

  @override
  void initState() {
    fetchAllCategories();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: _tabController == null
            ? null
            : TabBar(
                controller: _tabController,
                labelColor: Colors.redAccent,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: [
                  for (Category category in categories) Tab(text: category.name)
                ],
              ),
      ),
      body: _tabController == null
          ? Center(child: CircularProgressIndicator())
          : VerticalTabBarView(
              controller: _tabController,
              children: [
                for (Category category in categories)
                  TabView(category: category)
              ],
            ),
    );
  }
}

class TabView extends StatefulWidget {
  const TabView({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final Api api = Api();
  final List<Product> _products = [];

  fetchProducts(String category) {
    api.getProductsByCategory(category).then((value) {
      setState(() {
        _products.addAll(value);
      });
    });
  }

  @override
  void initState() {
    fetchProducts(widget.category.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.category.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
          ),
          for (Product product in _products)
            ListTile(
              title: Text(product.name),
              subtitle: Text(product.category),
              onTap: () {},
            ),
          // for (int i = 0; i < 20; i++)
          //   ListTile(
          //     title: Text('Product title $i'),
          //   )
        ],
      ),
    );
  }
}
