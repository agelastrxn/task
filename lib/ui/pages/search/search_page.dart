import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/infrastructure/cubits/search/search_cubit.dart';
import 'package:task/ui/widgets/custom_card_widget.dart';
import 'package:task/ui/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..get(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            const CustomSearchField(),
            Expanded(child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is SearchFailure) {
                  return Center(child: Text(state.message));
                } else if (state is SearchSuccess) {
                  if (state.products.isEmpty) {
                    return Center(
                        child: Text(AppLocalizations.of(context).empty));
                  }
                  return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (c, inx) {
                        return CustomCardWidget(product: state.products[inx]);
                      });
                }
                return const SizedBox.expand();
              },
            )),
          ],
        ),
      ),
    );
  }
}
