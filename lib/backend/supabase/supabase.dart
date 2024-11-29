import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://dqjzsvmipzeupgqkowpf.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRxanpzdm1pcHpldXBncWtvd3BmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE3Mjc1MTksImV4cCI6MjA0NzMwMzUxOX0.fTDsD_4KAapkbfiHcjM5IlmyBaJS0aWbBs-qsRhsT_c';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
