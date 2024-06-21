import '/components/header_widget.dart';
import '/components/order_payment_status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_detail_widget.dart' show OrderDetailWidget;
import 'package:flutter/material.dart';

class OrderDetailModel extends FlutterFlowModel<OrderDetailWidget> {
  ///  Local state fields for this page.

  String categori = 'Todos';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for orderPaymentStatus component.
  late OrderPaymentStatusModel orderPaymentStatusModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    orderPaymentStatusModel =
        createModel(context, () => OrderPaymentStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    orderPaymentStatusModel.dispose();
  }
}
