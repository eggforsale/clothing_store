import 'package:flutter/material.dart';

class AddToCartDialogBox extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController sizeController;
  final TextEditingController contactController;
  final VoidCallback addToCart;
  final VoidCallback cancelOrder;

  const AddToCartDialogBox({
    super.key,
    required this.addressController,
    required this.sizeController,
    required this.contactController,
    required this.addToCart,
    required this.cancelOrder,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add to Cart'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(hintText: 'Enter Address'),
            ),
            TextField(
              controller: sizeController,
              decoration: InputDecoration(hintText: 'Enter Size'),
            ),
            TextField(
              controller: contactController,
              decoration: InputDecoration(hintText: 'Enter Contact'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: cancelOrder,
          child: Text('Cancel Order'),
        ),
        TextButton(
          onPressed: addToCart,
          child: Text('Add to Cart'),
        ),
      ],
    );
  }
}

class AddClothingItemDialogBox extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController sizeController;
  final TextEditingController priceController;
  final TextEditingController stocksController;
  final TextEditingController imageController;
  final VoidCallback save;
  final VoidCallback cancel;

  const AddClothingItemDialogBox({
    super.key,
    required this.nameController,
    required this.sizeController,
    required this.priceController,
    required this.stocksController,
    required this.imageController,
    required this.save,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Clothing Item'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Enter Name'),
            ),
            TextField(
              controller: sizeController,
              decoration: InputDecoration(hintText: 'Enter Size'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(hintText: 'Enter Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: stocksController,
              decoration: InputDecoration(hintText: 'Enter Stocks'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(hintText: 'Enter Image Path'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: save,
          child: Text('Save'),
        ),
      ],
    );
  }
}