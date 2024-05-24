import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/repository/constants/colors.dart';

class ItemInCartWidget extends StatefulWidget {
  const ItemInCartWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.initialQuantity,
    required this.onUpdateQuantity,
    required this.onTap,
  }) : super(key: key);

  final String price;
  final String name;
  final int initialQuantity;
  final Function(int) onUpdateQuantity; // Callback function to update quantity
  final VoidCallback onTap;

  @override
  _ItemInCartWidgetState createState() => _ItemInCartWidgetState();
}

class _ItemInCartWidgetState extends State<ItemInCartWidget> {
  late int _quantity;
  late double _totalPrice;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
    _totalPrice = double.parse(widget.price) * _quantity;
  }

  void _updateTotalPrice() {
    setState(() {
      _totalPrice = double.parse(widget.price) * _quantity;
    });
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _updateTotalPrice();
      widget.onUpdateQuantity(_quantity); // Call callback function with updated quantity
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        _updateTotalPrice();
        widget.onUpdateQuantity(_quantity); // Call callback function with updated quantity
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 10), // Add spacing between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: widget.onTap,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '$_totalPrice₽',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.raisinBlack,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
                              backgroundColor: AppColors.raisinBlack,
                              elevation: 0,
                            ),
                            onPressed: _decrementQuantity,
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(
                            '$_quantity',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              backgroundColor: AppColors.raisinBlack,
                              elevation: 0,
                            ),
                            onPressed: _incrementQuantity,
                            child: Center(
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
