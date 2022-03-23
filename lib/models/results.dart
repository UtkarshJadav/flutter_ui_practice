import 'dart:convert';

class Results extends GenericObject implements Decodable<Results> {
  dynamic data;
  ExtraMeta? extraMeta;

  Results({required Create<Decodable> create}) : super(create: create);

  @override
  Results fromJson(Map<String, dynamic> json) {

    data = (json['data'] as Map<String, dynamic>?) != null
        ? genericObject(json['data'])
        : null;
    extraMeta = (json['extra_meta'] as Map<String, dynamic>?) != null
        ? ExtraMeta.fromJson(json['extra_meta'] as Map<String, dynamic>)
        : null;
    return this;
  }
}

class ExtraMeta {
  final String? message;
  final String? token;

  ExtraMeta({
    this.message,
    this.token,
  });

  ExtraMeta.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {'message': message, 'token': token};
}

abstract class Decodable<T> {
  T fromJson(Map<String, dynamic> json);
}

abstract class GenericObject<T> {
  Create<Decodable> create;

  GenericObject({required this.create});

  dynamic genericObject(dynamic data) {
    if (data is List) {
      return genericList(data);
    } else {
      final item = create();
      return item.fromJson(data);
    }
  }

  dynamic genericList(List data) {
    print(data.toString());
    return data.map((dynamic e) {
      var item = create();
      return item.fromJson(e);
    }).toList();
  }
}

typedef Create<T> = T Function();
