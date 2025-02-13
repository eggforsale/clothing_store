import 'package:flutter/material.dart';
import 'package:clothing_store/utils/clothing_tile.dart';
import 'package:clothing_store/utils/clotheslist.dart';
import 'package:clothing_store/utils/dialog_functions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stocksController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  List<Clotheslist> clothingItems = [
    Clotheslist(
      name: 'Plain Black', 
      size: 'Small, Medium, Large', 
      price: 10, 
      image: 'assets/images/plainblack.png', 
      stocks: 1),

    Clotheslist(
      name: 'Plain Blue', 
      size: 'Small, Medium, Large', 
      price: 10, 
      image: 'assets/images/plainblue.png', 
      stocks: 5),

    Clotheslist(
      name: 'Plain Yellow', 
      size: 'Small, Medium, Large', 
      price: 10, 
      image: 'assets/images/plainyellow.png', 
      stocks: 8),

    Clotheslist(
      name: 'Plain White', 
      size: 'Small, Medium, Large', 
      price: 10, 
      image: 'assets/images/plainwhite.png', 
      stocks: 8),

    Clotheslist(
      name: 'White Polo', 
      size: 'Small, Medium, Large', 
      price: 20, 
      image: 'assets/images/whitepolo.png', 
      stocks: 8),
  ];

  int cartItemCount = 0;
  
  int clothingItemstocksCount = 0;

  void addClothingItem() {
    showAddClothingItemDialog(
      context,
      _nameController,
      _sizeController,
      _priceController,
      _stocksController,
      _imageController,
      () {
        setState(() {
          clothingItems.add(Clotheslist(
            name: _nameController.text,
            size: _sizeController.text,
            price: int.parse(_priceController.text),
            stocks: int.parse(_stocksController.text),
            image: _imageController.text,
          ));
        });
        _nameController.clear();
        _sizeController.clear();
        _priceController.clear();
        _stocksController.clear();
        _imageController.clear();
        Navigator.pop(context);
      },
      () {
        _nameController.clear();
        _sizeController.clear();
        _priceController.clear();
        _stocksController.clear();
        _imageController.clear();
        Navigator.pop(context);
      },
    );
  }

  void deleteClothingItem(int index) {
    setState(() {
      clothingItems.removeAt(index);
    });
  }

  void addToCart(int index) {
    setState(() {
      cartItemCount++;
      if (clothingItems[index].stocks > 0) {
      clothingItems[index].stocks--;
    }
      _addressController.clear();
      _sizeController.clear();
      _contactController.clear();
      
    });
    Navigator.pop(context);
  }

  void cancelOrder() {
    setState(() {
      _addressController.clear();
      _sizeController.clear();
      _contactController.clear();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Clothing Store', style: TextStyle(
          color: Colors.white,
           fontSize: 40,
            fontWeight: FontWeight.bold,
             fontFamily: 'October Wish'
             ),),
        backgroundColor: Colors.black,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '$cartItemCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          return ClothingTile(
            clothingItem: clothingItems[index],
            delete: () => deleteClothingItem(index),
            imageclick: () => showAddToCartDialog(context, _addressController, _sizeController, _contactController, () => addToCart(index), cancelOrder),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addClothingItem,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}