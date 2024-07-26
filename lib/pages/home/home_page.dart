import 'package:finanza_personale/l10n/localized_context.dart';
import 'package:finanza_personale/models/home_tab_model.dart';
import 'package:finanza_personale/pages/home/tabs/book/books_tab.dart';
import 'package:finanza_personale/pages/home/tabs/media_tab.dart';
import 'package:finanza_personale/pages/home/tabs/tools_tab.dart';
import 'package:finanza_personale/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexTabProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<HomeTab> tabList = [
      HomeTab(
        label: context.loc.homeTabBooks,
        icon: Icons.menu_book_outlined,
        content: const BooksTab(),
      ),
      HomeTab(
        label: context.loc.homeTabMedia,
        icon: Icons.subscriptions_outlined,
        content: const MediaTab(),
      ),
      HomeTab(
        label: context.loc.homeTabTools,
        icon: Icons.handyman_outlined,
        content: const ToolsTab(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.appTitle),
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          ),
          icon: const Icon(Icons.settings),
        ),
      ),
      body: tabList[ref.watch(indexTabProvider)].content,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          ref.read(indexTabProvider.notifier).state = index;
        },
        selectedIndex: ref.watch(indexTabProvider),
        destinations: tabList
            .map(
              (singleScreenTab) => NavigationDestination(
                icon: Icon(singleScreenTab.icon),
                label: singleScreenTab.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
