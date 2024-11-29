import '../database.dart';

class QuizTable extends SupabaseTable<QuizRow> {
  @override
  String get tableName => 'quiz';

  @override
  QuizRow createRow(Map<String, dynamic> data) => QuizRow(data);
}

class QuizRow extends SupabaseDataRow {
  QuizRow(super.data);

  @override
  SupabaseTable get table => QuizTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get question => getField<String>('question')!;
  set question(String value) => setField<String>('question', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get correctQuestion => getField<int>('correct_question');
  set correctQuestion(int? value) => setField<int>('correct_question', value);

  String? get quizSound => getField<String>('quiz_sound');
  set quizSound(String? value) => setField<String>('quiz_sound', value);
}
