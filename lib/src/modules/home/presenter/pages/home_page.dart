import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];

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

                              return InkWell(
                                onTap: () => controller.toggleItemSelection(item.id),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: context.texts.paragraphMedium,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                item.description ?? '',
                                                style: context.texts.paragraphSmall.copyWith(
                                                  color: AppColors.neutral500,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '\$ ${item.price.toStringAsFixed(2)}',
                                                style: context.texts.paragraphMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 56,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            color: item.isSelected ? AppColors.neutral200 : AppColors.neutral700,
                                            borderRadius: BorderRadius.circular(8),
                                            image: item.imageUrl != null
                                                ? DecorationImage(
                                                    image: NetworkImage(item.imageUrl!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(color: Colors.grey),
                                  ],
                                ),
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
      },
    );
  }
}
