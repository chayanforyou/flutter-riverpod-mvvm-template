import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_values.dart';
import 'package:flutter_assignment/app/colors.dart';
import 'package:flutter_assignment/app/routes.dart';
import 'package:flutter_assignment/data/models/github_project_response.dart';
import 'package:flutter_assignment/extensions/navigator_extensions.dart';
import 'package:flutter_assignment/providers/theme_provider.dart';
import 'package:flutter_assignment/view/screens/home/components/item_project_widget.dart';
import 'package:flutter_assignment/view/screens/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gap/gap.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final themeMode = ref.watch(themeNotifierProvider);
    // final themeNotifier = ref.watch(themeNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Flutter Repositories'),
        actions: [
          /*IconButton(
            onPressed: () {
              themeNotifier.toggleTheme();
            },
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
          )*/
        ],
      ),
      body: PagedListView.separated(
        pagingController: _viewModel.pagingController,
        padding: EdgeInsets.all(AppValues.padding),
        separatorBuilder: (context, index) => Gap(AppValues.halfPadding),
        builderDelegate: PagedChildBuilderDelegate<Repository>(
          itemBuilder: (context, item, index) => ItemProjectWidget(
            repo: item,
            onTap: () => context.nav.pushNamed(Routes.details, arguments: item),
          ),
          firstPageProgressIndicatorBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
          newPageProgressIndicatorBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
          noItemsFoundIndicatorBuilder: (context) =>
              const Center(child: Text('No repository found')),
        ),
      ),
    );
  }
}
