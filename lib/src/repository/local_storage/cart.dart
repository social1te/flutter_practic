import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart {
  Cart({
    required this.name, required this.price, this.quantity = 1}
      );

  @HiveField(0)
  String name;

  @HiveField(1)
  int price;

  @HiveField(2)
  int quantity;
}
