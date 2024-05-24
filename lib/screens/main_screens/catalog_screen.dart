import 'package:flutter/material.dart';
import 'package:practice_with_zub/src/widgets/categories_text_button.dart';
import 'package:practice_with_zub/src/widgets/discount_card.dart';
import 'package:practice_with_zub/src/widgets/input_widget.dart';
import '../../src/widgets/item_card_widget.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: InputWidget(hintText: 'Найдите мебель'),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Мебель',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoriesTextButton(text: 'Стулья'),
                    CategoriesTextButton(text: 'Гардеробы'),
                    CategoriesTextButton(text: 'Кресла'),
                    CategoriesTextButton(text: 'Лампы'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Скидки',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DiscountCard(
                      discout: 15,
                      name: 'Плетеное кресло',
                      description: 'Всего за 4999',
                      tag: 'discount1',
                    ),
                    DiscountCard(
                      discout: 15,
                      name: 'Стул',
                      description: 'Крутой',
                      tag: 'discount2',
                    ),
                    DiscountCard(
                      discout: 15,
                      name: 'Стул',
                      description: 'Крутой',
                      tag: 'discount3',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'В наличии',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.70,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ItemCardWidget(name: 'Кресло${index + 1}', price: 999);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
