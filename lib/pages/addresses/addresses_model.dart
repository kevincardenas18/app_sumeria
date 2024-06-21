import '/components/address_info_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'addresses_widget.dart' show AddressesWidget;
import 'package:flutter/material.dart';

class AddressesModel extends FlutterFlowModel<AddressesWidget> {
  ///  Local state fields for this page.

  String categori = 'Todos';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for addressInfo component.
  late AddressInfoModel addressInfoModel1;
  // Model for addressInfo component.
  late AddressInfoModel addressInfoModel2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    addressInfoModel1 = createModel(context, () => AddressInfoModel());
    addressInfoModel2 = createModel(context, () => AddressInfoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    addressInfoModel1.dispose();
    addressInfoModel2.dispose();
  }
}
