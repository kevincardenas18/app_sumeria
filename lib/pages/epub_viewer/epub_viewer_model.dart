import '/flutter_flow/flutter_flow_util.dart';
import 'epub_viewer_widget.dart' show EpubViewerWidget;
import 'package:flutter/material.dart';

class EpubViewerModel extends FlutterFlowModel<EpubViewerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
