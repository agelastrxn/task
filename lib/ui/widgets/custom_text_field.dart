import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/app_colors.dart';
import 'package:task/constants/app_sizes.dart';
import 'package:task/infrastructure/cubits/search/search_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.appBarRadius),
      ),
      child: TextField(
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyText2,
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        onSubmitted: (value) {
          BlocProvider.of<SearchCubit>(context).search(value);
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(AppSizes.appBarRadius),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.appBarRadius)),
          hintText: AppLocalizations.of(context).search,
        ),
      ),
    );
  }
}
