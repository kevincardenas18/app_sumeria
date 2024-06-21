import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start WC Group Code

class WcGroup {
  static String getBaseUrl() => 'https://cindyl23.sg-host.com/wp-json/wc/v3';
  static Map<String, String> headers = {
    'Authorization':
        'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
  };
  static AllOrdersCall allOrdersCall = AllOrdersCall();
  static AllProductsCall allProductsCall = AllProductsCall();
  static CreateCustomerCall createCustomerCall = CreateCustomerCall();
  static ShippingZonesCall shippingZonesCall = ShippingZonesCall();
  static AddressStatesForECCall addressStatesForECCall =
      AddressStatesForECCall();
  static HotSalesCall hotSalesCall = HotSalesCall();
  static ReecomendacionesCall reecomendacionesCall = ReecomendacionesCall();
  static ProductByCategoryCall productByCategoryCall = ProductByCategoryCall();
  static SearchProductsCall searchProductsCall = SearchProductsCall();
  static GetCustomerByIdCall getCustomerByIdCall = GetCustomerByIdCall();
  static UpdateCustomerProfileCall updateCustomerProfileCall =
      UpdateCustomerProfileCall();
  static UpdateCustomerAddressCall updateCustomerAddressCall =
      UpdateCustomerAddressCall();
  static GetOrdersByIdCall getOrdersByIdCall = GetOrdersByIdCall();
  static GetCategoriesCall getCategoriesCall = GetCategoriesCall();
  static CreateWcOrderCall createWcOrderCall = CreateWcOrderCall();
  static ListarComentarioCall listarComentarioCall = ListarComentarioCall();
  static AgregarComenarioCall agregarComenarioCall = AgregarComenarioCall();
}

class AllOrdersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'AllOrders',
      apiUrl: '$baseUrl/orders',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllProductsCall {
  Future<ApiCallResponse> call({
    int? categoryid,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'AllProducts',
      apiUrl: '$baseUrl/products?category=$categoryid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateCustomerCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create customer',
      apiUrl:
          '$baseUrl/customers?%20consumer_key=ck_7f3df1337b0b8a969fd0c68d841fece817b15862&consumer_secret=cs_f6982c08085d6f2dd6047b77531858530f758864',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ShippingZonesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Shipping zones',
      apiUrl: '$baseUrl/shipping/zones',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? countries(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddressStatesForECCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Address States for EC',
      apiUrl: '$baseUrl/data/countries/ec',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? statesName(dynamic response) => (getJsonField(
        response,
        r'''$.states[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? statesCode(dynamic response) => (getJsonField(
        response,
        r'''$.states[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? states(dynamic response) => getJsonField(
        response,
        r'''$.states[:]''',
        true,
      ) as List?;
}

class HotSalesCall {
  Future<ApiCallResponse> call({
    String? orderby = 'popularity',
    String? order = 'desc',
    int? perPage = 6,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'hotSales',
      apiUrl: '$baseUrl/products',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {
        'oderby': orderby,
        'order': order,
        'per_page': perPage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReecomendacionesCall {
  Future<ApiCallResponse> call({
    int? perPage = 10,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Reecomendaciones',
      apiUrl: '$baseUrl/products',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {
        'per_page': perPage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductByCategoryCall {
  Future<ApiCallResponse> call({
    int? category = 30,
    int? perPage = 10,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Product By Category',
      apiUrl: '$baseUrl/products',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {
        'category': category,
        'per_page': perPage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchProductsCall {
  Future<ApiCallResponse> call({
    String? productName = '',
    int? categoryId,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'search products',
      apiUrl: '$baseUrl/products',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {
        'search': productName,
        'per_page': 50,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCustomerByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get customer by id',
      apiUrl: '$baseUrl/customers/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateCustomerProfileCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? email = '',
    String? lastName = '',
    String? firstName = '',
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "first_name": "$firstName",
  "last_name": "$lastName"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update customer profile',
      apiUrl: '$baseUrl/customers/$id',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateCustomerAddressCall {
  Future<ApiCallResponse> call({
    int? id,
    String? firstName = '',
    String? lastName = '',
    String? address1 = '',
    String? address2 = '',
    String? city = '',
    String? country = '',
    String? state = '',
    String? postcode = '',
    String? email = '',
    String? phone = '',
    String? addressType = '',
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "$addressType": {
    "first_name": "$firstName",
    "company": "",
    "last_name": "$lastName",
    "address_1": "$address1",
    "address_2": "$address2",
    "city": "$city",
    "state": "$state",
    "postcode": "$postcode",
    "country": "$country",
    "email": "$email",
    "phone": "$phone"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update customer address',
      apiUrl: '$baseUrl/customers/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOrdersByIdCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get orders by id',
      apiUrl: '$baseUrl/orders?customer=$userId&per_page=100',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get categories',
      apiUrl: '$baseUrl/products/categories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {
        'per_page': 100,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateWcOrderCall {
  Future<ApiCallResponse> call({
    int? customerId,
    dynamic billingJson,
    dynamic shippingJson,
    dynamic lineItemsJson,
    String? transactionId = '',
    String? status = '',
    String? date = '',
    String? paymentMethod = '',
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    final billing = _serializeJson(billingJson);
    final shipping = _serializeJson(shippingJson);
    final lineItems = _serializeJson(lineItemsJson);
    final ffApiRequestBody = '''
{
  "payment_method": "$paymentMethod",
  "payment_method_title": "$paymentMethod",
  "customer_id": "$customerId",
  "status": "processing",
  "billing": $billing,
  "shipping": $shipping,
  "line_items": $lineItems,
  "shipping_lines": [
    {
      "method_id": "free_shipping",
      "method_title": "Free shipping",
      "total": "0"
    }
  ],
  "transaction_id": "$transactionId",
  "meta_data": [
    {
      "key": "paypal_tx_id",
      "value": "$transactionId"
    },
    {
      "key": "fecha",
      "value": "$date"
    },
    {
      "key": "status",
      "value": "$status"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create wc order',
      apiUrl: '$baseUrl/orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListarComentarioCall {
  Future<ApiCallResponse> call({
    int? libroId,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Listar comentario',
      apiUrl: '$baseUrl/products/reviews?product=$libroId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgregarComenarioCall {
  Future<ApiCallResponse> call({
    int? productId,
    String? review = '',
    String? reviewer = '',
    String? reviewerEmail = '',
    int? userId,
  }) async {
    final baseUrl = WcGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "product_id": $productId,
  "review": "$review",
  "reviewer":"$reviewer" ,
  "reviewer_email": "$reviewerEmail",
  "rating": 5,
  "user_id": $userId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'agregarComenario',
      apiUrl: '$baseUrl/products/reviews',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic Y2tfN2YzZGYxMzM3YjBiOGE5NjlmZDBjNjhkODQxZmVjZTgxN2IxNTg2Mjpjc19mNjk4MmMwODA4NWQ2ZjJkZDYwNDdiNzc1MzE4NTg1MzBmNzU4ODY0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End WC Group Code

/// Start JWT Group Code

class JwtGroup {
  static String getBaseUrl() =>
      'https://cindyl23.sg-host.com/?rest_route=/simple-jwt-login/v1';
  static Map<String, String> headers = {};
  static AuthCall authCall = AuthCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
}

class AuthCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = JwtGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "AUTH_KEY": "G5bF7!yP9j#kL%8mQ@Z2d&4xT6nR0W\$yUv"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'auth',
      apiUrl: '$baseUrl/auth&email=Email&password=Password',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = JwtGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'forgot password',
      apiUrl: '$baseUrl/user/reset_password&email=',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'AUTH_KEY': "G5bF7!yP9j#kL%8mQ@Z2d&4xT6nR0W\$yUv",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End JWT Group Code

/// Start CoCart Group Code

class CoCartGroup {
  static String getBaseUrl({
    String? encodedCredentials = '',
  }) =>
      'https://cindyl23.sg-host.com/wp-json/cocart/v2/cart';
  static Map<String, String> headers = {
    'Authorization': 'Basic [encodedCredentials]',
  };
  static MergeCartCall mergeCartCall = MergeCartCall();
  static AddItemToCartAuthenticatedCall addItemToCartAuthenticatedCall =
      AddItemToCartAuthenticatedCall();
  static UpdateItemInCartCall updateItemInCartCall = UpdateItemInCartCall();
  static RemoveItemInCartCall removeItemInCartCall = RemoveItemInCartCall();
  static GetCartCall getCartCall = GetCartCall();
  static ClearCartCall clearCartCall = ClearCartCall();
}

class MergeCartCall {
  Future<ApiCallResponse> call({
    String? cartKey = '',
    String? encodedCredentials = '',
  }) async {
    final baseUrl = CoCartGroup.getBaseUrl(
      encodedCredentials: encodedCredentials,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'merge cart',
      apiUrl: '$baseUrl?cart_key=$cartKey',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddItemToCartAuthenticatedCall {
  Future<ApiCallResponse> call({
    int? id,
    int? quantity,
    String? encodedCredentials = '',
  }) async {
    final baseUrl = CoCartGroup.getBaseUrl(
      encodedCredentials: encodedCredentials,
    );

    final ffApiRequestBody = '''
{
  "id": "$id",
  "quantity": "$quantity"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'add item to cart authenticated',
      apiUrl: '$baseUrl/add-item',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateItemInCartCall {
  Future<ApiCallResponse> call({
    String? itemKey = '',
    String? cartKey = '',
    int? quantity,
    String? encodedCredentials = '',
  }) async {
    final baseUrl = CoCartGroup.getBaseUrl(
      encodedCredentials: encodedCredentials,
    );

    final ffApiRequestBody = '''
{
  "quantity": "$quantity"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update item in cart',
      apiUrl: '$baseUrl/item/$itemKey?cart_key=$cartKey',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveItemInCartCall {
  Future<ApiCallResponse> call({
    String? itemKey = '',
    String? cartKey = '',
    String? encodedCredentials = '',
  }) async {
    final baseUrl = CoCartGroup.getBaseUrl(
      encodedCredentials: encodedCredentials,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'remove item in cart',
      apiUrl: '$baseUrl/item/$itemKey?cart_key=$cartKey',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCartCall {
  Future<ApiCallResponse> call({
    String? cartKey = '',
    String? encodedCredentials = '',
  }) async {
    final baseUrl = CoCartGroup.getBaseUrl(
      encodedCredentials: encodedCredentials,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get Cart',
      apiUrl: '$baseUrl?cart_key=$cartKey',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? itemCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.item_count''',
      ));
}

class ClearCartCall {
  Future<ApiCallResponse> call({
    String? cartKey = '',
    String? encodedCredentials = '',
  }) async {
    final baseUrl = CoCartGroup.getBaseUrl(
      encodedCredentials: encodedCredentials,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'clear cart',
      apiUrl: '$baseUrl/clear?cart_key=$cartKey',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End CoCart Group Code

/// Start WP REST Group Code

class WpRestGroup {
  static String getBaseUrl() => 'https://cindyl23.sg-host.com/wp-json/wp/v2';
  static Map<String, String> headers = {
    'Authorization':
        'Basic bGlicmVyaWFzdW1lcmlhQG91dGxvb2suY29tOlp1dXAgZ0xqQyBpN09YIHFnSEUgMkpaTSB0WFMw',
  };
  static UserProfileCall userProfileCall = UserProfileCall();
  static UserCreateCall userCreateCall = UserCreateCall();
  static ListarRespuestasCall listarRespuestasCall = ListarRespuestasCall();
  static AgregarRespuestaCall agregarRespuestaCall = AgregarRespuestaCall();
}

class UserProfileCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = WpRestGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Profile',
      apiUrl: '$baseUrl/users/$userId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic bGlicmVyaWFzdW1lcmlhQG91dGxvb2suY29tOlp1dXAgZ0xqQyBpN09YIHFnSEUgMkpaTSB0WFMw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserCreateCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? userId = '',
  }) async {
    final baseUrl = WpRestGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "$firstName",
  "last_name": "$lastName"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Create',
      apiUrl: '$baseUrl/users/$userId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic bGlicmVyaWFzdW1lcmlhQG91dGxvb2suY29tOlp1dXAgZ0xqQyBpN09YIHFnSEUgMkpaTSB0WFMw',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListarRespuestasCall {
  Future<ApiCallResponse> call({
    int? comentarioId,
  }) async {
    final baseUrl = WpRestGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Listar Respuestas',
      apiUrl: '$baseUrl/comments?parent=$comentarioId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic bGlicmVyaWFzdW1lcmlhQG91dGxvb2suY29tOlp1dXAgZ0xqQyBpN09YIHFnSEUgMkpaTSB0WFMw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgregarRespuestaCall {
  Future<ApiCallResponse> call({
    int? idProduct,
    String? content = '',
    String? authorName = '',
    String? authorEmail = '',
    int? parent,
    int? author,
  }) async {
    final baseUrl = WpRestGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "post": $idProduct,
  "content": "$content",
  "author_name": "$authorName",
  "author_email": "$authorEmail",
  "parent": $parent,
  "author": $author
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'agregarRespuesta',
      apiUrl: '$baseUrl/comments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic bGlicmVyaWFzdW1lcmlhQG91dGxvb2suY29tOlp1dXAgZ0xqQyBpN09YIHFnSEUgMkpaTSB0WFMw',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End WP REST Group Code

/// Start Sumeria API REST Group Code

class SumeriaAPIRESTGroup {
  static String getBaseUrl() => 'https://cindyl28.sg-host.com/api';
  static Map<String, String> headers = {};
  static ListSlidersCall listSlidersCall = ListSlidersCall();
  static SaveBooksFromAUserOrderCall saveBooksFromAUserOrderCall =
      SaveBooksFromAUserOrderCall();
}

class ListSlidersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SumeriaAPIRESTGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List Sliders',
      apiUrl: '$baseUrl/sliders',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveBooksFromAUserOrderCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? author = '',
    String? urlImage = '',
    String? urlBook = '',
    int? userId,
    int? idLibro,
    String? formato = '',
  }) async {
    final baseUrl = SumeriaAPIRESTGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "title": "$title",
  "author": "$author",
  "urlImage": "$urlImage",
  "urlBook": "$urlBook",
  "formato": "$formato",
  "user_id": $userId,
  "id_libro": $idLibro
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'save books from a user order',
      apiUrl: '$baseUrl/books',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Sumeria API REST Group Code

/// Start PayPal Group Code

class PayPalGroup {
  static String getBaseUrl() => 'https://cindyl28.sg-host.com/api';
  static Map<String, String> headers = {};
  static CreateOrderCall createOrderCall = CreateOrderCall();
}

class CreateOrderCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? quantity = '',
  }) async {
    final baseUrl = PayPalGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "$id",
  "quantity": "$quantity"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create order',
      apiUrl: '$baseUrl/orders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End PayPal Group Code

/// Start Sumeria API REST BOOK Group Code

class SumeriaAPIRESTBOOKGroup {
  static String getBaseUrl() => 'https://cindyl29.sg-host.com/api';
  static Map<String, String> headers = {};
  static ListarLibreriaCall listarLibreriaCall = ListarLibreriaCall();
  static IngresarLibreriaCall ingresarLibreriaCall = IngresarLibreriaCall();
  static InsertMultipleBooksCall insertMultipleBooksCall =
      InsertMultipleBooksCall();
}

class ListarLibreriaCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final baseUrl = SumeriaAPIRESTBOOKGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Listar Libreria',
      apiUrl: '$baseUrl/users/$userId/books',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IngresarLibreriaCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? author = '',
    String? urlImage = '',
    String? urlBook = '',
    String? formato = '',
    int? userId,
    int? idLibro,
  }) async {
    final baseUrl = SumeriaAPIRESTBOOKGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "title": "$title",
  "author": "$author",
  "urlImage": "$urlImage",
  "urlBook": "$urlBook",
  "formato": "$formato",
  "user_id": $userId,
  "id_libro": $idLibro
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Ingresar Libreria',
      apiUrl: '$baseUrl/books',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InsertMultipleBooksCall {
  Future<ApiCallResponse> call({
    dynamic orderInfoJson,
  }) async {
    final baseUrl = SumeriaAPIRESTBOOKGroup.getBaseUrl();

    final orderInfo = _serializeJson(orderInfoJson);
    final ffApiRequestBody = orderInfo;
    return ApiManager.instance.makeApiCall(
      callName: 'insert multiple books',
      apiUrl: '$baseUrl/books/multiple',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Sumeria API REST BOOK Group Code

/// Start Heroku Group Code

class HerokuGroup {
  static String getBaseUrl() =>
      'https://recomendaciones-sumeria-49b6854b9172.herokuapp.com';
  static Map<String, String> headers = {};
  static RecomendacionesCall recomendacionesCall = RecomendacionesCall();
}

class RecomendacionesCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final baseUrl = HerokuGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Recomendaciones',
      apiUrl: '$baseUrl/recommend?user_id=$userId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Heroku Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
