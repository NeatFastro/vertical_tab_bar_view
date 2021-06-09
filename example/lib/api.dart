class Api {
  Future<List<Category>> getCategories() async {
    return Future.delayed(
      Duration(milliseconds: 100),
      () {
        return Category.allCategories;
      },
    );
    // return Future.value(Category.allCategories);
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    return Future.delayed(
      Duration(milliseconds: 100),
      () {
        return Product.allProducts
            .where((p) => p.category == category)
            .toList();
      },
    );
  }
}

class Category {
  final String id;
  final String name;

  const Category({
    required this.id,
    required this.name,
  });

  static const List<Category> allCategories = const [
    Category(id: '0', name: 'Fruits'),
    Category(id: '2', name: 'Veggies'),
    Category(id: '3', name: 'Meat'),
    Category(id: '4', name: 'Diary'),
    Category(id: '5', name: 'Snacks'),
  ];
}

class Product {
  final String id;
  final String name;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.category,
  });

  static const List<Product> allProducts = const [
    Product(id: '0', name: 'Apple', category: 'Fruits'),
    Product(id: '2', name: 'Banana', category: 'Fruits'),
    Product(id: '3', name: 'Mango', category: 'Fruits'),
    Product(id: '4', name: 'Pine apple', category: 'Fruits'),
    Product(id: '5', name: 'Orange', category: 'Fruits'),
    Product(id: '6', name: 'Egg plant', category: 'Veggies'),
    Product(id: '7', name: 'Cucumber', category: 'Veggies'),
    Product(id: '8', name: 'Carrot', category: 'Veggies'),
    Product(id: '9', name: 'Bell Pepper', category: 'Veggies'),
    Product(id: '10', name: 'Brocculi', category: 'Veggies'),
    Product(id: '12', name: 'Out milk', category: 'Diary'),
    Product(id: '13', name: 'Soy milk', category: 'Diary'),
    Product(id: '15', name: 'Goat milk', category: 'Diary'),
    Product(id: '15', name: 'Cow milk', category: 'Diary'),
    Product(id: '15', name: 'Camel milk', category: 'Diary'),
    Product(id: '15', name: 'Buffalo milk', category: 'Diary'),
    Product(id: '15', name: 'Hen milk', category: 'Diary'),
    Product(id: '16', name: 'Kebob', category: 'Meat'),
    Product(id: '17', name: 'Steak', category: 'Meat'),
    Product(id: '18', name: 'Alien', category: 'Meat'),
    Product(id: '19', name: 'Roger smith', category: 'Meat'),
    Product(id: '20', name: 'Meat Balls Z', category: 'Meat'),
    Product(id: '21', name: 'KitKat', category: 'Snacks'),
  ];
}
