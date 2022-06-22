import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/app_colors.dart';
import 'package:task/constants/app_sizes.dart';
import 'package:task/infrastructure/cubits/category/category_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key, required this.category, required this.title})
      : super(key: key);
  final String category;
  final String title;
  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<CategoryCubit>();
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultPadding),
      child: GestureDetector(
        onTap: () {
          cubit.get(category);
        },
        child: Container(
            padding: const EdgeInsets.all(AppSizes.defaultPadding),
            decoration: BoxDecoration(
                color: ThemeData.dark().cardColor,
                borderRadius: BorderRadius.circular(AppSizes.appBarRadius)),
            child: Text(
              title,
              style: const TextStyle(color: AppColors.white),
            )),
      ),
    );
  }
}
