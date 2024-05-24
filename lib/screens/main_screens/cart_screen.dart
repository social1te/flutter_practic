import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/repository/local_storage/boxes.dart';
import 'package:practice_with_zub/src/repository/local_storage/cart.dart';
import 'package:practice_with_zub/src/widgets/item_in_cart_widget.dart';
import '../../src/repository/constants/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      final item = cartBox.getAt(index) as Cart;
      item.quantity = newQuantity;
      cartBox.putAt(index, item);
    });
  }

  void _deleteItem(int index) {
    setState(() {
      cartBox.deleteAt(index);
    });
  }

  double _calculateTotal() {
    double total = 0;
    for (var i = 0; i < cartBox.length; i++) {
      final cart = cartBox.getAt(i) as Cart;
      total += cart.price * cart.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final total = _calculateTotal();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline),
          )
        ],
        backgroundColor: Colors.transparent,
        title: Text(
          'Корзина',
          style: TextStyle(
              color: AppColors.raisinBlack,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartBox.length,
                itemBuilder: (context, index) {
                  final cart = cartBox.getAt(index) as Cart;
                  return ItemInCartWidget(
                    name: cart.name,
                    price: cart.price.toString(),
                    initialQuantity: cart.quantity,
                    onUpdateQuantity: (newQuantity) => _updateQuantity(index, newQuantity),
                    onTap: () => _deleteItem(index),
                  );
                },
              ),
            ),
            if (cartBox.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Общая сумма: $total₽',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.raisinBlack,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Добавьте действие для кнопки
                      },
                      child: Text('Перейти к оформлению заказа', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.raisinBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        fixedSize: Size(350, 55),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
