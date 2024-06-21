import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _token = await secureStorage.getString('ff_token') ?? _token;
    });
    await _safeInitAsync(() async {
      _credentialsEncoded =
          await secureStorage.getString('ff_credentialsEncoded') ??
              _credentialsEncoded;
    });
    await _safeInitAsync(() async {
      _cartKey = await secureStorage.getString('ff_cartKey') ?? _cartKey;
    });
    await _safeInitAsync(() async {
      _contador = await secureStorage.getInt('ff_contador') ?? _contador;
    });
    await _safeInitAsync(() async {
      _userId = await secureStorage.getString('ff_userId') ?? _userId;
    });
    await _safeInitAsync(() async {
      _epubFile = await secureStorage.getString('ff_epubFile') ?? _epubFile;
    });
    await _safeInitAsync(() async {
      _nombreUsuario =
          await secureStorage.getString('ff_nombreUsuario') ?? _nombreUsuario;
    });
    await _safeInitAsync(() async {
      _emailUsuario =
          await secureStorage.getString('ff_emailUsuario') ?? _emailUsuario;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    secureStorage.setString('ff_token', value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  String _credentialsEncoded = '';
  String get credentialsEncoded => _credentialsEncoded;
  set credentialsEncoded(String value) {
    _credentialsEncoded = value;
    secureStorage.setString('ff_credentialsEncoded', value);
  }

  void deleteCredentialsEncoded() {
    secureStorage.delete(key: 'ff_credentialsEncoded');
  }

  String _cartKey = '';
  String get cartKey => _cartKey;
  set cartKey(String value) {
    _cartKey = value;
    secureStorage.setString('ff_cartKey', value);
  }

  void deleteCartKey() {
    secureStorage.delete(key: 'ff_cartKey');
  }

  int _contador = 0;
  int get contador => _contador;
  set contador(int value) {
    _contador = value;
    secureStorage.setInt('ff_contador', value);
  }

  void deleteContador() {
    secureStorage.delete(key: 'ff_contador');
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    secureStorage.setString('ff_userId', value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_userId');
  }

  List<dynamic> _categoriesList = [];
  List<dynamic> get categoriesList => _categoriesList;
  set categoriesList(List<dynamic> value) {
    _categoriesList = value;
  }

  void addToCategoriesList(dynamic value) {
    categoriesList.add(value);
  }

  void removeFromCategoriesList(dynamic value) {
    categoriesList.remove(value);
  }

  void removeAtIndexFromCategoriesList(int index) {
    categoriesList.removeAt(index);
  }

  void updateCategoriesListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    categoriesList[index] = updateFn(_categoriesList[index]);
  }

  void insertAtIndexInCategoriesList(int index, dynamic value) {
    categoriesList.insert(index, value);
  }

  String _ProductSearched = '';
  String get ProductSearched => _ProductSearched;
  set ProductSearched(String value) {
    _ProductSearched = value;
  }

  dynamic _paymentResponse;
  dynamic get paymentResponse => _paymentResponse;
  set paymentResponse(dynamic value) {
    _paymentResponse = value;
  }

  String _epubFile = '';
  String get epubFile => _epubFile;
  set epubFile(String value) {
    _epubFile = value;
    secureStorage.setString('ff_epubFile', value);
  }

  void deleteEpubFile() {
    secureStorage.delete(key: 'ff_epubFile');
  }

  String _nombreUsuario = '';
  String get nombreUsuario => _nombreUsuario;
  set nombreUsuario(String value) {
    _nombreUsuario = value;
    secureStorage.setString('ff_nombreUsuario', value);
  }

  void deleteNombreUsuario() {
    secureStorage.delete(key: 'ff_nombreUsuario');
  }

  String _emailUsuario = '';
  String get emailUsuario => _emailUsuario;
  set emailUsuario(String value) {
    _emailUsuario = value;
    secureStorage.setString('ff_emailUsuario', value);
  }

  void deleteEmailUsuario() {
    secureStorage.delete(key: 'ff_emailUsuario');
  }

  final _specialOffersAllManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> specialOffersAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _specialOffersAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSpecialOffersAllCache() => _specialOffersAllManager.clear();
  void clearSpecialOffersAllCacheKey(String? uniqueKey) =>
      _specialOffersAllManager.clearRequest(uniqueKey);

  final _hotSalesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> hotSales({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _hotSalesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHotSalesCache() => _hotSalesManager.clear();
  void clearHotSalesCacheKey(String? uniqueKey) =>
      _hotSalesManager.clearRequest(uniqueKey);

  final _headProfileManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> headProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _headProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHeadProfileCache() => _headProfileManager.clear();
  void clearHeadProfileCacheKey(String? uniqueKey) =>
      _headProfileManager.clearRequest(uniqueKey);

  final _recomendationCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> recomendationCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _recomendationCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRecomendationCacheCache() => _recomendationCacheManager.clear();
  void clearRecomendationCacheCacheKey(String? uniqueKey) =>
      _recomendationCacheManager.clearRequest(uniqueKey);

  final _romanceSliderCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> romanceSliderCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _romanceSliderCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRomanceSliderCacheCache() => _romanceSliderCacheManager.clear();
  void clearRomanceSliderCacheCacheKey(String? uniqueKey) =>
      _romanceSliderCacheManager.clearRequest(uniqueKey);

  final _fictionListCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> fictionListCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _fictionListCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFictionListCacheCache() => _fictionListCacheManager.clear();
  void clearFictionListCacheCacheKey(String? uniqueKey) =>
      _fictionListCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
