import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ebook_viewer_widget.dart' show EbookViewerWidget;
import 'package:flutter/material.dart';

class EbookViewerModel extends FlutterFlowModel<EbookViewerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
  }
}
