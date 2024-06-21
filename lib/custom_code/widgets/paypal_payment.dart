// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalPayment extends StatefulWidget {
  const PaypalPayment({
    super.key,
    this.width,
    this.height,
    this.amount,
    this.currency,
    this.navigateTo,
  });

  final double? width;
  final double? height;
  final double? amount;
  final String? currency;
  final Future Function()? navigateTo;

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  String statusMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          if (statusMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                statusMessage,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: WebView(
              initialUrl:
                  'https://pagos-sumeria-d9243e3fece9.herokuapp.com/createpaypalpayment?amount=${widget.amount}&currency=${widget.currency}',
              javascriptMode: JavascriptMode.unrestricted,
              gestureRecognizers: {
                Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer()),
              },
              onPageFinished: (value) {
                print(value);
              },
              navigationDelegate: (NavigationRequest request) async {
                if (request.url.contains('http://return_url/?status=success')) {
                  Uri uri = Uri.parse(request.url);
                  String transactionId = uri.queryParameters['id'] ?? '';
                  String status = uri.queryParameters['status'] ?? '';
                  String state = uri.queryParameters['state'] ?? '';
                  String payerInfoEmail =
                      uri.queryParameters['payer_info_email'] ?? '';
                  String amount = uri.queryParameters['amount'] ?? '';
                  String date = uri.queryParameters['date'] ?? '';

                  Map<String, dynamic> paymentResponse = {
                    'transactionId': transactionId,
                    'status': status,
                    'state': state,
                    'payerInfoEmail': payerInfoEmail,
                    'amount': amount,
                    'date': date,
                  };

                  String jsonValue = jsonEncode(paymentResponse);

                  // Guarda el jsonValue en FFAppState
                  FFAppState().paymentResponse = jsonValue;

                  setState(() {
                    statusMessage = 'Pago Completado';
                  });
                  Future.delayed(const Duration(seconds: 3), () {
                    widget.navigateTo
                        ?.call(); // Llamar a la función navigateTo si está definida
                  });
                  return NavigationDecision.prevent;
                }

                if (request.url.startsWith('http://cancel_url')) {
                  setState(() {
                    statusMessage = 'Payment canceled.';
                  });
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                  });
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          ),
        ],
      ),
    );
  }
}
