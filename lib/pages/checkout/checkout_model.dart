import '/backend/api_requests/api_calls.dart';
import '/components/address_info_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for addressInfo component.
  late AddressInfoModel addressInfoModel1;
  // Model for addressInfo component.
  late AddressInfoModel addressInfoModel2;
  // Stores action output result for [Backend Call - API (remove item in cart)] action in IconButton widget.
  ApiCallResponse? apiResultivbCopy;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    addressInfoModel1 = createModel(context, () => AddressInfoModel());
    addressInfoModel2 = createModel(context, () => AddressInfoModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addressInfoModel1.dispose();
    addressInfoModel2.dispose();
    navBarModel.dispose();
  }
}
