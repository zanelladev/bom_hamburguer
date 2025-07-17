import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class Category {
  final String name;
  final List<Item> items;

  const Category({required this.name, required this.items});
}

class Item {
  final String name;
  final double price;
  final String? description;
  final String? imageUrl;

  const Item({required this.name, required this.price, this.description, this.imageUrl});
}

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final categories = [
      const Category(
        name: 'Sandwich',
        items: [
          Item(name: 'X Burger', price: 5, description: 'A classic burger with lettuce and tomato.'),
          Item(name: 'X Egg', price: 4.5, description: 'A burger with a fried egg on top.'),
          Item(name: 'X Bacon', price: 7, description: 'A delicious burger with crispy bacon.'),
        ],
      ),
      const Category(
        name: 'Extras',
        items: [
          Item(name: 'Fries', price: 2, description: 'Crispy golden fries served with ketchup.'),
          Item(name: 'Soft drink', price: 2.5, description: 'A refreshing soft drink to complement your meal.'),
        ],
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.name, style: context.texts.headingH6.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      ListView.builder(
                        itemCount: category.items.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = category.items[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(item.name, style: context.texts.paragraphMedium),
                                        const SizedBox(height: 4),
                                        Text(
                                          item.description ?? '',
                                          style: context.texts.paragraphSmall.copyWith(color: AppColors.neutral500),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$ ${item.price.toStringAsFixed(2)}',
                                          style: context.texts.paragraphMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(color: Colors.grey),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
