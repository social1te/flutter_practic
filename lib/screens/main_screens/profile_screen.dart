import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/widgets/order_history_card.dart';

import '../../src/repository/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: ()=> Navigator.of(context).pushNamed('/edit_profile_screen'),
            child: Text('Изм.',
                style: TextStyle(
                    color: AppColors.raisinBlack, fontWeight: FontWeight.bold)),
          )
        ],
        backgroundColor: Colors.transparent,
        title: Text(
          'Профиль',
          style: TextStyle(
              color: AppColors.raisinBlack, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 88,
                      backgroundColor: AppColors.raisinBlack,
                      child: Icon(
                        Icons.person_outlined,
                        size: 88,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Имя',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: AppColors.raisinBlack),
                          ),
                          Text(
                            'Фамилия',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: AppColors.raisinBlack),
                          ),
                          Text(
                            'Отчество',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: AppColors.raisinBlack),
                          ),
                          Text(
                            'example@gmail.com',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: AppColors.raisinBlack),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                endIndent: 20,
                indent: 20,
                color: AppColors.raisinBlack,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Скидка' + '\n' + 'до 25 мая',
                              style: TextStyle(fontWeight: FontWeight.w300, height: 1.2),
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              '15%',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'История заказов',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OrderHistoryCard(
                        price: 3499,
                        name: 'Шкаф-купе',
                        dateOfArrive: '13-23-23',
                        id: 12122321,
                      description: 'Тыры-пыры чета там шкаф ну нормальный в целом да',
                    ),
                    OrderHistoryCard(
                      price: 3499,
                      name: 'Шкаф-купе',
                      dateOfArrive: '13-23-23',
                      id: 12122321,
                      description: 'Тыры-пыры чета там шкаф ну нормальный в целом да',
                    ),
                    OrderHistoryCard(
                      price: 3499,
                      name: 'Шкаф-купе',
                      dateOfArrive: '13-23-23',
                      id: 12122321,
                      description: 'Тыры-пыры чета там шкаф ну нормальный в целом да',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
