import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_confirmed_widget.dart' show OrderConfirmedWidget;
import 'package:flutter/material.dart';

class OrderConfirmedModel extends FlutterFlowModel<OrderConfirmedWidget> {
  ///  Local state fields for this page.

  bool isActionCompleted = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (get Cart)] action in OrderConfirmed widget.
  ApiCallResponse? resultgetCart;
  // Stores action output result for [Backend Call - API (get customer by id)] action in OrderConfirmed widget.
  ApiCallResponse? resultGetCustomer;
  // Stores action output result for [Backend Call - API (create wc order)] action in OrderConfirmed widget.
  ApiCallResponse? resultCreateWCorder;
  // Stores action output result for [Backend Call - API (insert multiple books)] action in OrderConfirmed widget.
  ApiCallResponse? resultInsertBooks;
  // Stores action output result for [Backend Call - API (clear cart)] action in OrderConfirmed widget.
  ApiCallResponse? resultClearCart;
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
