// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> validateDocument(String? document) async {
  if (document == null || document.isEmpty) {
    return {
      'success': false,
      'message': 'El número de documento no puede estar vacío'
    };
  }

  String numero = document;

  bool esNumeroValido(String numero) {
    for (int i = 0; i < numero.length; i++) {
      if (int.tryParse(numero[i]) == null) {
        return false;
      }
    }
    return true;
  }

  int obtenerSumaPonderada(bool nat, bool pub, bool pri, int d1, int d2, int d3,
      int d4, int d5, int d6, int d7, int d8, int d9) {
    int p1, p2, p3, p4, p5, p6, p7, p8, p9;
    if (nat) {
      p1 = d1 * 2;
      if (p1 >= 10) p1 -= 9;
      p2 = d2 * 1;
      if (p2 >= 10) p2 -= 9;
      p3 = d3 * 2;
      if (p3 >= 10) p3 -= 9;
      p4 = d4 * 1;
      if (p4 >= 10) p4 -= 9;
      p5 = d5 * 2;
      if (p5 >= 10) p5 -= 9;
      p6 = d6 * 1;
      if (p6 >= 10) p6 -= 9;
      p7 = d7 * 2;
      if (p7 >= 10) p7 -= 9;
      p8 = d8 * 1;
      if (p8 >= 10) p8 -= 9;
      p9 = d9 * 2;
      if (p9 >= 10) p9 -= 9;
      return p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9;
    } else if (pub) {
      p1 = d1 * 3;
      p2 = d2 * 2;
      p3 = d3 * 7;
      p4 = d4 * 6;
      p5 = d5 * 5;
      p6 = d6 * 4;
      p7 = d7 * 3;
      p8 = d8 * 2;
      return p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
    } else if (pri) {
      p1 = d1 * 4;
      p2 = d2 * 3;
      p3 = d3 * 2;
      p4 = d4 * 7;
      p5 = d5 * 6;
      p6 = d6 * 5;
      p7 = d7 * 4;
      p8 = d8 * 3;
      p9 = d9 * 2;
      return p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9;
    }
    return 0;
  }

  if (!esNumeroValido(numero)) {
    return {
      'success': false,
      'message': 'No puede ingresar caracteres en el número'
    };
  }

  if (numero.length < 10) {
    return {
      'success': false,
      'message': 'El número de cédula/ruc ingresado no es válido'
    };
  }

  int provincia = int.parse(numero.substring(0, 2));
  if (provincia < 1 || provincia > 22) {
    return {
      'success': false,
      'message': 'El código de la provincia (dos primeros dígitos) es inválido'
    };
  }

  int d1 = int.parse(numero[0]),
      d2 = int.parse(numero[1]),
      d3 = int.parse(numero[2]),
      d4 = int.parse(numero[3]),
      d5 = int.parse(numero[4]),
      d6 = int.parse(numero[5]),
      d7 = int.parse(numero[6]),
      d8 = int.parse(numero[7]),
      d9 = int.parse(numero[8]),
      d10 = int.parse(numero[9]);

  bool nat = d3 < 6, pub = d3 == 6, pri = d3 == 9;

  if (d3 == 7 || d3 == 8) {
    return {
      'success': false,
      'message': 'El tercer dígito ingresado es inválido'
    };
  }

  int suma =
      obtenerSumaPonderada(nat, pub, pri, d1, d2, d3, d4, d5, d6, d7, d8, d9);
  int modulo = nat ? 10 : 11;
  int residuo = suma % modulo;
  int digitoVerificador = residuo == 0 ? 0 : modulo - residuo;

  if (pub == true) {
    if (digitoVerificador != d9) {
      return {
        'success': false,
        'message': 'El RUC de la empresa del sector público es incorrecto.'
      };
    }
    if (numero.substring(9, 13) != '0001') {
      return {
        'success': false,
        'message':
            'El RUC de la empresa del sector público debe terminar con 0001'
      };
    }
  } else if (pri == true) {
    if (digitoVerificador != d10) {
      return {
        'success': false,
        'message': 'El RUC de la empresa del sector privado es incorrecto.'
      };
    }
    if (numero.substring(10, 13) != '001') {
      return {
        'success': false,
        'message':
            'El RUC de la empresa del sector privado debe terminar con 001'
      };
    }
  } else if (nat == true) {
    if (numero.length == 10 && digitoVerificador != d10) {
      return {
        'success': false,
        'message': 'El número de cédula es incorrecto.'
      };
    }
    if (numero.length > 10 && numero.substring(10, 13) != '001') {
      return {
        'success': false,
        'message': 'El RUC de la persona natural debe terminar con 001'
      };
    }
  }

  return {
    'success': true,
    'message': 'El número de documento ingresado es correcto.'
  };
}
