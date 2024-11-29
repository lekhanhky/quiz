import '../database.dart';

class QuizWithOptionsTable extends SupabaseTable<QuizWithOptionsRow> {
  @override
  String get tableName => 'quiz_with_options';

  @override
  QuizWithOptionsRow createRow(Map<String, dynamic> data) =>
      QuizWithOptionsRow(data);
}

class QuizWithOptionsRow extends SupabaseDataRow {
  QuizWithOptionsRow(super.data);

  @override
  SupabaseTable get table => QuizWithOptionsTable();

  int? get quizId => getField<int>('quiz_id');
  set quizId(int? value) => setField<int>('quiz_id', value);

  String? get question => getField<String>('question');
  set question(String? value) => setField<String>('question', value);

  String? get optionText => getField<String>('option_text');
  set optionText(String? value) => setField<String>('option_text', value);

  int? get qoid => getField<int>('qoid');
  set qoid(int? value) => setField<int>('qoid', value);

  int? get correctQuestion => getField<int>('correct_question');
  set correctQuestion(int? value) => setField<int>('correct_question', value);

  String? get optionImg => getField<String>('option_img');
  set optionImg(String? value) => setField<String>('option_img', value);

  String? get quizSound => getField<String>('quiz_sound');
  set quizSound(String? value) => setField<String>('quiz_sound', value);

  bool? get iscorrect => getField<bool>('iscorrect');
  set iscorrect(bool? value) => setField<bool>('iscorrect', value);
}
