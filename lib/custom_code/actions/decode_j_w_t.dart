// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String decodeJWT(String token) {
  try {
    // Decodificar el JWT sin verificar la firma
    final jwt = JWT.decode(token);

    // Obtener el ID del usuario del payload
    final userId = jwt.payload['id'];

    final email = jwt.payload['email'];

    // Devolver el ID del usuario como una cadena
    FFAppState().userId = userId.toString();
    FFAppState().emailUsuario = email;

    return userId.toString();
  } catch (e) {
    // Manejar errores y devolver una cadena vacía o un mensaje de error
    return '';
  }
}
