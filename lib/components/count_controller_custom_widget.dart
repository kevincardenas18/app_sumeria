import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'count_controller_custom_model.dart';
export 'count_controller_custom_model.dart';

class CountControllerCustomWidget extends StatefulWidget {
  const CountControllerCustomWidget({
    super.key,
    required this.count,
  });

  final dynamic count;

  @override
  State<CountControllerCustomWidget> createState() =>
      _CountControllerCustomWidgetState();
}

class _CountControllerCustomWidgetState
    extends State<CountControllerCustomWidget> {
  late CountControllerCustomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountControllerCustomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            height: 35.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(5.0),
              shape: BoxShape.rectangle,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 15.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.remove_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 18.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    logFirebaseEvent(
                        'COUNT_CONTROLLER_CUSTOM_remove_rounded_I');
                    _model.apiResultgnk2 =
                        await CoCartGroup.updateItemInCartCall.call(
                      encodedCredentials: FFAppState().credentialsEncoded,
                      cartKey: FFAppState().cartKey,
                      quantity: functions.countMinus(getJsonField(
                        widget.count,
                        r'''$.quantity.value''',
                      ).toString()),
                      itemKey: getJsonField(
                        widget.count,
                        r'''$.item_key''',
                      ).toString(),
                    );

                    if ((_model.apiResultgnk2?.succeeded ?? true)) {
                      FFAppState().contador = getJsonField(
                        (_model.apiResultgnk2?.jsonBody ?? ''),
                        r'''$.item_count''',
                      );
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Cantidad actualizada',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 1500),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'cart',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Error count cantidad'),
                            content: Text(getJsonField(
                              (_model.apiResultgnk2?.jsonBody ?? ''),
                              r'''$.message''',
                            ).toString()),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getJsonField(
                      widget.count,
                      r'''$.quantity.value''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 15.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 18.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    logFirebaseEvent(
                        'COUNT_CONTROLLER_CUSTOM_add_rounded_ICN_');
                    _model.apiResultgnk =
                        await CoCartGroup.updateItemInCartCall.call(
                      encodedCredentials: FFAppState().credentialsEncoded,
                      cartKey: FFAppState().cartKey,
                      quantity: functions.countPlus(getJsonField(
                        widget.count,
                        r'''$.quantity.value''',
                      ).toString()),
                      itemKey: getJsonField(
                        widget.count,
                        r'''$.item_key''',
                      ).toString(),
                    );

                    if ((_model.apiResultgnk?.succeeded ?? true)) {
                      FFAppState().contador = getJsonField(
                        (_model.apiResultgnk?.jsonBody ?? ''),
                        r'''$.item_count''',
                      );
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Cantidad actualizada',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 1500),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'cart',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Error count cantidad'),
                            content: Text(getJsonField(
                              (_model.apiResultgnk2?.jsonBody ?? ''),
                              r'''$.message''',
                            ).toString()),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
