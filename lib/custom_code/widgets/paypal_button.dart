// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class PaypalButton extends StatefulWidget {
  const PaypalButton(
      {super.key, this.width, this.height, this.amount, this.testAction});

  final double? width;
  final double? height;
  final double? amount;
  final Future Function()? testAction;

  @override
  State<PaypalButton> createState() => _PaypalButtonState();
}

class _PaypalButtonState extends State<PaypalButton> {
  @override
  Widget build(BuildContext context) {
    final amount =
        widget.amount ?? 0.0; // Valor predeterminado si widget.amount es null
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaypalPayment(
                    amount: amount,
                    currency: 'USD',
                    navigateTo: widget.testAction,
                  ),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color.fromRGBO(252, 187, 50, 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  // image: AssetImage('./assets/nl1wlr0a4nr2/pp_icon.png'),
                  image: NetworkImage(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sumeria-alpha-xaxbh3/assets/6iqk0rsgf4e0/paypal_icono.png'),
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
