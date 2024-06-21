import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'shimmer_addresses_model.dart';
export 'shimmer_addresses_model.dart';

class ShimmerAddressesWidget extends StatefulWidget {
  const ShimmerAddressesWidget({super.key});

  @override
  State<ShimmerAddressesWidget> createState() => _ShimmerAddressesWidgetState();
}

class _ShimmerAddressesWidgetState extends State<ShimmerAddressesWidget>
    with TickerProviderStateMixin {
  late ShimmerAddressesModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerAddressesModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1250.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Container(
                      width: 120.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).shimmer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Container(
                width: double.infinity,
                height: 140.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).shimmer,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: double.infinity,
                height: 54.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).shimmer,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Container(
                        width: 120.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).shimmer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Container(
                width: double.infinity,
                height: 140.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).shimmer,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: double.infinity,
                height: 54.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).shimmer,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ).animateOnPageLoad(animationsMap['listViewOnPageLoadAnimation']!),
      ],
    );
  }
}
