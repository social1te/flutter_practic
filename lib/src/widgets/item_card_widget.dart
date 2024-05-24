import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/repository/constants/colors.dart';
import 'package:practice_with_zub/src/repository/local_storage/cart.dart';

import '../repository/local_storage/boxes.dart';

class ItemCardWidget extends StatefulWidget {
  const ItemCardWidget({super.key, required this.name, required this.price});

  final String name;
  final int price;

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

void addItemToCart(Cart item) {
  final existingItemIndex = cartBox.values
      .toList()
      .indexWhere((cartItem) => cartItem.name == item.name);

  if (existingItemIndex != -1) {
    final existingItem = cartBox.getAt(existingItemIndex) as Cart;
    existingItem.quantity += item.quantity;
    cartBox.putAt(existingItemIndex, existingItem);
  } else {
    cartBox.add(item);
  }
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> _showBottomSheet(context),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: AppColors.raisinBlack,
                    borderRadius: BorderRadius.circular(12)),
              ),
              Text(
                widget.name,
                style: TextStyle(
                    color: AppColors.darkCharcoal, fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Text(
                widget.price.toString() + '₽',
                style: TextStyle(
                    color: AppColors.darkCharcoal, fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                widget.name,
                style: TextStyle(
                    color: AppColors.raisinBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.raisinBlack,
                          borderRadius: BorderRadius.circular(12)),
                      height: 350,
                      width: 350,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.raisinBlack,
                        fixedSize: Size(350, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      final newItem =
                          Cart(name: widget.name, price: widget.price);
                      addItemToCart(newItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Товар ' + widget.name + ' добавлен в корзину',
                            style: TextStyle(color: AppColors.cultured),
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Добавить в корзину',
                      style: TextStyle(color: AppColors.cultured),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
