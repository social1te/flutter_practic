import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/repository/constants/colors.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard(
      {super.key,
      required this.price,
      required this.name,
      required this.dateOfArrive,
      required this.id,
      required this.description});

  final int price;
  final String name;
  final String dateOfArrive;
  final int id;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 250,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: AppColors.raisinBlack,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Доставлено: ' + dateOfArrive,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  Text(
                    'ID: ' + id.toString(),
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        maxLines: 8,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Spacer(),
                    Text(
                      price.toString() + '₽',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
