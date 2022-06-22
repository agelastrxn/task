// ignore_for_file: non_constant_identifier_names

import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/constants/app_colors.dart';
import 'package:task/l10n/locale.dart';
import 'package:task/provider/locale.dart';
import 'package:task/ui/pages/category/category_page.dart';
import 'package:task/ui/pages/search/search_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants/app_sizes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTab = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Store"),
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: _getBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: BottomBar(
          itemPadding: const EdgeInsets.all(AppSizes.defaultPadding),
          items: _getItems(context),
          showActiveBackgroundColor: true,
          selectedIndex: selectedTab,
          onTap: (int index) {
            _pageController.jumpToPage(index);
            setState(() => selectedTab = index);
          },
        ),
      ),
    );
  }

  Widget _getBody() {
    return PageView(
      controller: _pageController,
      children: const [
        CategoryPage(),
        SearchPage(),
      ],
      onPageChanged: (index) {
        setState(() => selectedTab = index);
      },
    );
  }

  _getItems(context) {
    return <BottomBarItem>[
      BottomBarItem(
        icon: const Icon(Icons.home),
        title: Text(
          AppLocalizations.of(context).category,
        ),
        activeColor: AppColors.primaryColor,
      ),
      BottomBarItem(
        icon: const Icon(Icons.search),
        title: Text(AppLocalizations.of(context).search),
        activeColor: AppColors.primaryColor,
      )
    ];
  }
}

Drawer _buildDrawer(context) {
  // ignore: no_leading_underscores_for_local_identifiers
  List<String> _Languages = [
    AppLocalizations.of(context).english,
    AppLocalizations.of(context).azerbaijani,
    AppLocalizations.of(context).turkish
  ];

  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("</dev>"),
          accountEmail: Text("mirzezadeorxan181@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_3000/https://envri.eu/wp-content/uploads/2016/08/software-developer-copy.jpg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultPadding),
          child: Text(
            AppLocalizations.of(context).languages,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: double.maxFinite,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.read<LocaleProvider>().setLocale(L10n.support[index]);
                },
                title: Text(_Languages[index]),
              );
            },
            itemCount: _Languages.length,
          ),
        )
      ],
    ),
  );
}
