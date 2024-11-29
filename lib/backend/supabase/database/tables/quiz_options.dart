import '../database.dart';

class QuizOptionsTable extends SupabaseTable<QuizOptionsRow> {
  @override
  String get tableName => 'quiz_options';

  @override
  QuizOptionsRow createRow(Map<String, dynamic> data) => QuizOptionsRow(data);
}

class QuizOptionsRow extends SupabaseDataRow {
  QuizOptionsRow(super.data);

  @override
  SupabaseTable get table => QuizOptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get quizId => getField<int>('quiz_id')!;
  set quizId(int value) => setField<int>('quiz_id', value);

  int? get optionId => getField<int>('option_id');
  set optionId(int? value) => setField<int>('option_id', value);

  String? get optionText => getField<String>('option_text');
  set optionText(String? value) => setField<String>('option_text', value);

  String? get optionImg => getField<String>('option_img');
  set optionImg(String? value) => setField<String>('option_img', value);
}
