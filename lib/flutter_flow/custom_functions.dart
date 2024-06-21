import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? encodeCredentials(
  String? username,
  String? password,
) {
  // encode in base64 the username and password then return it
  String basicAuth = base64Encode(utf8.encode('$username:$password'));
  return basicAuth;
}

int? paginationSum(int? newPage) {
  // returns argument + 1
  return newPage! + 1;
}

int? countMinus(String? countItem) {
  // return the argument +1
  if (countItem == null) {
    return null;
  }
  int count = int.parse(countItem);
  return count - 1;
}

double? convertPriceToDouble(String? price) {
  // convert the price to int then convert to double. example: 425 to 4.25
  if (price == null) {
    return null;
  }
  int priceInt = int.parse(price);
  double priceDouble = priceInt / 100;
  return priceDouble;
}

int? countPlus(String? countItem) {
  // return the argument +1
  if (countItem == null) {
    return null;
  }
  int count = int.parse(countItem);
  return count + 1;
}

bool isEmptyField(String fieldContent) {
  // return true if its empty or null
  return fieldContent == null || fieldContent.isEmpty;
}

int? addQuantities(dynamic lineItems) {
  // look for the quantity propertys in lineItems then add them and return that value
  if (lineItems is List) {
    num totalQuantity = 0;

    for (var item in lineItems) {
      if (item is Map<String, dynamic> && item.containsKey('quantity')) {
        totalQuantity += item['quantity'];
      }
    }

    return totalQuantity.round();
  } else {
    // Manejar el caso en el que lineItems no es una lista
    return 0; // O cualquier valor que consideres apropiado en este caso
  }
}

double? calculateSubtotalOrder(dynamic lineItems) {
  double suma = 0.0;

  for (Map<String, dynamic> item in lineItems) {
    if (item.containsKey('subtotal') && item['subtotal'] is String) {
      suma += double.parse(item['subtotal']);
    }
  }

  return suma;
}

dynamic getProductsFromCart2(
  dynamic dataFromCart,
  int? userID,
) {
  List<Map<String, dynamic>> lineItems = [];

  for (var item in dataFromCart) {
    lineItems.add({
      'product_id': item['id'],
      'user_id': userID,
    });
  }

  return lineItems;
}

String? getApproveLink(dynamic createOrderResponse) {
  // Decodificar el JSON si es necesario
  final Map<String, dynamic> jsonMap = createOrderResponse is String
      ? jsonDecode(createOrderResponse)
      : createOrderResponse;

  // Iterar sobre la lista de links
  for (final link in jsonMap['links']) {
    if (link['rel'] == 'approve') {
      return link['href'];
    }
  }

  // Si no se encuentra el rel approve, retornar null
  return null;
}

dynamic getProductsFromCart(dynamic dataFromCart) {
  List<Map<String, dynamic>> lineItems = [];

  for (var item in dataFromCart) {
    lineItems.add({
      'product_id': item['id'],
      'quantity': item['quantity']['value'],
    });
  }

  return lineItems;
}

String? getValueByKeyJson(
  dynamic paymentResponse,
  String? key,
) {
  if (paymentResponse is Map<String, dynamic> && key != null) {
    return paymentResponse[key] as String?;
  }
  return null;
}

int? parseStringToInt(String? text) {
  // return itemCount parsed as integer
  return int.tryParse(text ?? '');
}
