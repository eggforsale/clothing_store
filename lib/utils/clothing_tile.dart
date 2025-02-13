import 'package:flutter/material.dart';
import 'package:clothing_store/utils/clotheslist.dart';

class ClothingTile extends StatelessWidget {
  final Clotheslist clothingItem;
  final VoidCallback delete;
  final VoidCallback imageclick;

  const ClothingTile({super.key, required this.clothingItem, required this.delete, required this.imageclick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 27, 68, 45),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: imageclick,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(clothingItem.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  clothingItem.name,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontFamily: 'Machinery Script'
                  ),
                ),
                Text(
                  ' ${clothingItem.size}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontFamily: 'October Wish',
                  ),
                ),
                Text(
                  '\$${clothingItem.price}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontFamily: 'Fendesert Sans Stamp'
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.store, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      'Stock: ${clothingItem.stocks}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Wild Love'
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: delete,
            ),
          ],
        ),
      ),
    );
  }
}