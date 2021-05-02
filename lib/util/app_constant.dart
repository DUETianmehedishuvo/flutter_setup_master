import 'package:tutorial/data/model/response/language_model.dart';

class AppConstant {
  static const String BASE_URL = 'http://erp1.bepza.gov.bd:84/api/';
  static const String tickets = 'Ticketes';
  static const String login_uri = 'Userinfs/';
  static const String jwt_token_uri = 'jwt';
  static const String zone_info_uri = 'PrmZoneInfoes';
  static const String employee_info_uri = 'PrmEmploymentInfoes/';

  // sharePreference
  static const String TOKEN = 'token';
  static const String USER = 'user';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String OFFICE_ADDRESS = 'office_address';
  static const String CART_LIST = 'cart_list';
  static const String CONFIG = 'config';
  static const String GUEST_MODE = 'guest_mode';
  static const String CURRENCY = 'currency';

  // order status
  static const String PENDING = 'pending';
  static const String PROCESSING = 'processing';
  static const String PROCESSED = 'processed';
  static const String DELIVERED = 'delivered';
  static const String FAILED = 'failed';
  static const String RETURNED = 'returned';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String THEME = 'theme';
  static const String SELECT_LANGUAGE_STATUS = 'select_language_status';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: '', languageName: 'Bangla', countryCode: 'BD', languageCode: 'bn'),
  ];
}
