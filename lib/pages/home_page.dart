import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: Supabase.instance.client.from('books').select(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final bookList = snapshot.data!;
          return ListView.builder(
            itemCount: bookList.length,
            itemBuilder: ((context, index) {
              final singleBook = bookList[index];
              return ListTile(
                title: Text(singleBook['title']),
              );
            }),
          );
        },
      ),
    );
  }
}
