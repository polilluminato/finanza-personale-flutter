import 'package:finanza_personale/models/home_tab_model.dart';
import 'package:finanza_personale/pages/home/tabs/books_tab.dart';
import 'package:finanza_personale/pages/home/tabs/media_tab.dart';
import 'package:finanza_personale/pages/home/tabs/tools_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexTabProvider = StateProvider<int>((ref) => 0);

final List<HomeTab> tabList = [
  HomeTab(
    label: "Libri",
    icon: Icons.list_alt,
    content: const BooksTab(),
  ),
  HomeTab(
    label: "Media",
    icon: Icons.grid_view,
    content: const MediaTab(),
  ),
  HomeTab(
    label: "Strumenti",
    icon: Icons.grid_view,
    content: const ToolsTab(),
  ),
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanza Personale"),
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
