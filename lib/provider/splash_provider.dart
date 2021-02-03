import 'package:ecommerce_ael/data/model/response/base/api_response.dart';
import 'package:ecommerce_ael/data/model/response/config_model.dart';
import 'package:ecommerce_ael/data/repository/splash_repo.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;
  SplashProvider({@required this.splashRepo});

  ConfigModel _configModel;
  BaseUrls _baseUrls;
  CurrencyList _currency;
  int _currencyIndex;
  PackageInfo _packageInfo;
  bool _hasConnection = true;

  ConfigModel get configModel => _configModel;
  BaseUrls get baseUrls => _baseUrls;
  CurrencyList get currency => _currency;
  int get currencyIndex => _currencyIndex;
  PackageInfo get packageInfo => _packageInfo;
  bool get hasConnection => _hasConnection;

  Future<bool> initConfig() async {
    _hasConnection = true;
    ApiResponse apiResponse = await splashRepo.getConfig();
    bool isSuccess;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {

      _configModel = ConfigModel.fromJson(apiResponse.response.data);
      _baseUrls = ConfigModel.fromJson(apiResponse.response.data).baseUrls;
      getCurrencyData(splashRepo.getCurrency());
      _packageInfo = await PackageInfo.fromPlatform();
      isSuccess = true;
      notifyListeners();
    } else {
      isSuccess = false;
      print(apiResponse.error.toString());
      if(apiResponse.error.toString() == 'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
    }
    return isSuccess;
  }

  void getCurrencyData(String currencyCode) {
    _configModel.currencyList.forEach((currency) {
      if(currencyCode == currency.code) {
        _currency = currency;
        _currencyIndex = _configModel.currencyList.indexOf(currency);
        return;
      }
    });
  }

  void setCurrency(int index) {
    splashRepo.setCurrency(_configModel.currencyList[index].code);
    getCurrencyData(_configModel.currencyList[index].code);
    notifyListeners();
  }

  void initSharedPrefData() {
    splashRepo.initSharedData();
  }
}
