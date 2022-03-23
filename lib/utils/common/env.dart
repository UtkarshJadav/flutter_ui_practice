const ENV env = ENV.uat;

enum ENV { development, qa, uat }

extension ConfigExt on ENV {
  String get baseurl {
    switch (this) {
      case ENV.qa:
        return '10.2.99.28:5008/api/';
      case ENV.development:
        return '10.2.99.28:5008/api/';
      case ENV.uat:
        return 'https://orchard.inic.cloud/laravel-api2/public/api/v1/';
    }
    return '';
  }

  String get baseimgurl {
    switch (this) {
      case ENV.qa:
        return '10.2.99.28:5008/api/';
      case ENV.development:
        return '10.2.99.28:5008/api/';
      case ENV.uat:
        return 'http://groceryapi.node.indianic.com/public/upload/';
    }
    return '';
  }
}
