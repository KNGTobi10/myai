import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'lottieAnimationOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'conditionalBuilderOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 15.0, 15.0, 15.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_model.isSpeaking)
                              Lottie.asset(
                                'assets/lottie_animations/Animation_-_1701563686340.json',
                                width: 400.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                                animate: true,
                              ).animateOnPageLoad(animationsMap[
                                  'lottieAnimationOnPageLoadAnimation']!),
                            if (!_model.isSpeaking)
                              Builder(
                                builder: (context) {
                                  if (_model.isRecording) {
                                    return FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: 100.0,
                                      buttonSize: 200.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      icon: Icon(
                                        Icons.stop_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 80.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        setState(() {
                                          _model.isRecording = false;
                                        });
                                        await actions.stopTextRecording();
                                        _model.openaiApiCall =
                                            await GettingResponseCall.call(
                                          prompt:
                                              FFAppState().speechToTextResponse,
                                          language: FFLocalizations.of(context)
                                              .languageCode,
                                          apiKey: FFAppState().apiKey,
                                        );
                                        if ((_model.openaiApiCall?.succeeded ??
                                            true)) {
                                          _model.audioFileDuration =
                                              await actions.fetchSpeechAndPlay(
                                            GettingResponseCall.message(
                                              (_model.openaiApiCall?.jsonBody ??
                                                  ''),
                                            ).toString(),
                                            FFAppState().apiKey,
                                          );
                                          setState(() {
                                            FFAppState().TimerValue =
                                                _model.audioFileDuration!;
                                            FFAppState().speechToTextResponse =
                                                '';
                                          });
                                          setState(() {
                                            _model.isSpeaking = true;
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          _model.timerController.onStartTimer();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Api Debug Error',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  const Color(0xFFCB1D1D),
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                    );
                                  } else {
                                    return FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: 100.0,
                                      buttonSize: 200.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      icon: Icon(
                                        Icons.mic_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 80.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        setState(() {
                                          _model.isRecording = true;
                                        });
                                        await actions.startTextRecording();
                                      },
                                    );
                                  }
                                },
                              ).animateOnPageLoad(animationsMap[
                                  'conditionalBuilderOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                  child: FlutterFlowLanguageSelector(
                    width: 200.0,
                    backgroundColor: const Color(0xFF101010),
                    borderColor: Colors.transparent,
                    dropdownIconColor: Colors.white,
                    borderRadius: 8.0,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 13.0,
                    ),
                    hideFlags: false,
                    flagSize: 24.0,
                    flagTextGap: 8.0,
                    currentLanguage: FFLocalizations.of(context).languageCode,
                    languages: FFLocalizations.languages(),
                    onChanged: (lang) => setAppLanguage(context, lang),
                  ),
                ),
              ),
              if (_model.isSpeaking)
                Align(
                  alignment: const AlignmentDirectional(0.00, 1.00),
                  child: FlutterFlowTimer(
                    initialTime: FFAppState().TimerValue,
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                      value,
                      hours: false,
                      minute: false,
                      milliSecond: false,
                    ),
                    controller: _model.timerController,
                    updateStateInterval: const Duration(milliseconds: 1000),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds = value;
                      _model.timerValue = displayTime;
                      if (shouldUpdate) setState(() {});
                    },
                    onEnded: () async {
                      _model.timerController.onResetTimer();

                      setState(() {
                        _model.isSpeaking = false;
                      });
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          fontSize: 1.0,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
