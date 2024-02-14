class Url {
  static final Url _singleton = Url._internal();

  factory Url() => _singleton;

  Url._internal();
  String baseUrl = 'http://16.170.148.249/aleyk-backend/public/api';
  String imageUrl = 'http://16.170.148.249/aleyk-backend/public';
  String socketUrl = 'http://16.170.148.249:8095';
  // String baseUrl = 'https://aleykapp.com/api';
  // String imageUrl = 'https://aleykapp.com/';
}
