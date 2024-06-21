import '/flutter_flow/flutter_flow_util.dart';
import 'avatar_with_update_widget.dart' show AvatarWithUpdateWidget;
import 'package:flutter/material.dart';

class AvatarWithUpdateModel extends FlutterFlowModel<AvatarWithUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
