import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_options_widget.dart' show QuizOptionsWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class QuizOptionsModel extends FlutterFlowModel<QuizOptionsWidget> {
  ///  Local state fields for this page.

  String? soundurl;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
