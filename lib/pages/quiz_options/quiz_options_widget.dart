import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'quiz_options_model.dart';
export 'quiz_options_model.dart';

class QuizOptionsWidget extends StatefulWidget {
  /// detail quiz
  const QuizOptionsWidget({
    super.key,
    required this.quizID,
    required this.correctQues,
  });

  final int? quizID;
  final int? correctQues;

  @override
  State<QuizOptionsWidget> createState() => _QuizOptionsWidgetState();
}

class _QuizOptionsWidgetState extends State<QuizOptionsWidget> {
  late QuizOptionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuizWithOptionsRow>>(
      future: QuizWithOptionsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'quiz_id',
          widget.quizID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<QuizWithOptionsRow> quizOptionsQuizWithOptionsRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Text(
                  'CHI TIẾT CÂU ĐỐ',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF58F9C3),
                                  FlutterFlowTheme.of(context).info
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: AutoSizeText(
                                quizOptionsQuizWithOptionsRowList
                                    .first.question!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            quizOptionsQuizWithOptionsRowList.first.quizSound!,
                            metas: Metas(
                              title: 'Câu hỏi',
                            ),
                          ),
                          titleTextStyle:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          playbackDurationTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          elevation: 0.0,
                          playInBackground: PlayInBackground.enabled,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Flex(
                    direction: Axis.vertical,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          final quizDetail =
                              quizOptionsQuizWithOptionsRowList.toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: quizDetail.length,
                            itemBuilder: (context, quizDetailIndex) {
                              final quizDetailItem =
                                  quizDetail[quizDetailIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (quizDetailItem.iscorrect!) {
                                    _model.soundPlayer1 ??= AudioPlayer();
                                    if (_model.soundPlayer1!.playing) {
                                      await _model.soundPlayer1!.stop();
                                    }
                                    _model.soundPlayer1!.setVolume(1.0);
                                    _model.soundPlayer1!
                                        .setUrl(
                                            'https://dqjzsvmipzeupgqkowpf.supabase.co/storage/v1/object/public/sound/dung.mp3?t=2024-11-16T09%3A55%3A31.252Z')
                                        .then(
                                            (_) => _model.soundPlayer1!.play());
                                  } else {
                                    _model.soundPlayer2 ??= AudioPlayer();
                                    if (_model.soundPlayer2!.playing) {
                                      await _model.soundPlayer2!.stop();
                                    }
                                    _model.soundPlayer2!.setVolume(1.0);
                                    _model.soundPlayer2!
                                        .setUrl(
                                            'https://dqjzsvmipzeupgqkowpf.supabase.co/storage/v1/object/public/sound/sai.mp3')
                                        .then(
                                            (_) => _model.soundPlayer2!.play());
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    quizDetailItem.image!,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
