import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/repository/constants/colors.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
    required this.discout,
    required this.name,
    required this.description,
    required this.tag,
  });

  final int discout;
  final String name;
  final String description;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed('/details_screen', arguments: tag),
      child: Hero(
        tag: tag,
        child: Card(
          child: Container(
            height: 220,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: AppColors.raisinBlack,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 10), // Отступ между контейнерами
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '-$discout%',
                            style: TextStyle(fontSize: 32, color: Colors.black),
                          ),
                          Divider(),
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(fontSize: 24, color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Text(
                              description,
                              maxLines: 3,
                              overflow: TextOverflow.visible,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
