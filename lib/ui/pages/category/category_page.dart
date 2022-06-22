import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/categories.dart';
import 'package:task/infrastructure/cubits/category/category_cubit.dart';
import 'package:task/ui/widgets/custom_card_widget.dart';
import 'package:task/ui/widgets/custom_tab_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..get(AppCategories.electronics),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTabBar(
                    category: AppCategories.electronics,
                    title: AppLocalizations.of(context).electronics),
                CustomTabBar(
                    category: AppCategories.jewelery,
                    title: AppLocalizations.of(context).jewelery),
                CustomTabBar(
                    category: AppCategories.mens,
                    title: AppLocalizations.of(context).mens),
                CustomTabBar(
                    category: AppCategories.womens,
                    title: AppLocalizations.of(context).womens),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is CategoryFailure) {
                  return Center(child: Text(state.message));
                } else if (state is CategorySuccess) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.products.length,
                      itemBuilder: (c, inx) {
                        return CustomCardWidget(product: state.products[inx]);
                      });
                }
                return const SizedBox.expand();
              },
            ),
          )
        ],
      ),
    );
  }
}
