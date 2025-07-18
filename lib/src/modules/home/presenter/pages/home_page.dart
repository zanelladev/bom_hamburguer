import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../controllers/categories_controller.dart';
import '../controllers/categories_state.dart';

class HomePage extends StatefulWidget {
  final CategoriesController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.controller.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ValueListenableBuilder(
            valueListenable: widget.controller,
            builder: (context, state, child) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is CategoriesErrorState) {
                return Center(
                  child: Text(
                    state.error.message,
                    style: context.texts.paragraphMedium.copyWith(color: Colors.red),
                  ),
                );
              }

              if (state.isEmpty) {
                return Center(
                  child: Text(
                    'No categories available',
                    style: context.texts.paragraphMedium,
                  ),
                );
              }

              if (state is CategoriesLoadedState) {
                return Column(
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
                                    onTap: () => widget.controller.toggleItemSelection(item.id),
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
                );
              }

              return SizedBox();
            }),
      ),
    );
  }
}
