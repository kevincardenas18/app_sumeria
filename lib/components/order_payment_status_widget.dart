import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'order_payment_status_model.dart';
export 'order_payment_status_model.dart';

class OrderPaymentStatusWidget extends StatefulWidget {
  const OrderPaymentStatusWidget({super.key});

  @override
  State<OrderPaymentStatusWidget> createState() =>
      _OrderPaymentStatusWidgetState();
}

class _OrderPaymentStatusWidgetState extends State<OrderPaymentStatusWidget> {
  late OrderPaymentStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderPaymentStatusModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Paid',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
