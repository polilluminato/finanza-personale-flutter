import 'package:finanza_personale/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Configure Supabase Env Variables
  await Supabase.initialize(
    url: const String.fromEnvironment("supabase_url"),
    anonKey: const String.fromEnvironment("supabase_anon_key"),
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
