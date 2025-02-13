import 'package:flutter/material.dart';
import 'dialog_box.dart';

void showAddToCartDialog(BuildContext context, 
TextEditingController addressController, 
TextEditingController sizeController, 
TextEditingController contactController, 
VoidCallback onAddToCart, 
VoidCallback onCancelOrder) {
  showDialog(
    context: context,
    builder: (context) {
      return AddToCartDialogBox(
        addressController: addressController,
        sizeController: sizeController,
        contactController: contactController,
        addToCart: onAddToCart,
        cancelOrder: onCancelOrder,
      );
    },
  );
}

void showAddClothingItemDialog(BuildContext context, 
TextEditingController nameController, 
TextEditingController sizeController, 
TextEditingController priceController, 
TextEditingController stocksController, 
TextEditingController imageController, 
VoidCallback onSave, 
VoidCallback onCancel) {
  showDialog(
    context: context,
    builder: (context) {
      return AddClothingItemDialogBox(
        nameController: nameController,
        sizeController: sizeController,
        priceController: priceController,
        stocksController: stocksController,
        imageController: imageController,
        save: onSave,
        cancel: onCancel,
      );
    },
  );
}