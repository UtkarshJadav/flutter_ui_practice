import 'package:flutter_demo/models/results.dart';

class ProfileModel implements Decodable<ProfileModel>{
   int? id;
   String? firstName;
   String? lastName;
   String? email;
   String? photo;
   String? photoUrl;
   String? mobile;
   dynamic countryId;
   dynamic countryName;
   dynamic stateId;
   dynamic stateName;
   dynamic cityId;
   dynamic cityName;
   dynamic aboutMe;
   dynamic settings;
   String? status;
   String? createdAt;
   List<SubscriptionFeatures>? subscriptionFeatures;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.photo,
    this.photoUrl,
    this.mobile,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.aboutMe,
    this.settings,
    this.status,
    this.createdAt,
    this.subscriptionFeatures,
  });


 /* ProfileModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        email = json['email'] as String?,
        photo = json['photo'] as String?,
        photoUrl = json['photo_url'] as String?,
        mobile = json['mobile'] as String?,
        countryId = json['country_id'],
        countryName = json['country_name'],
        stateId = json['state_id'],
        stateName = json['state_name'],
        cityId = json['city_id'],
        cityName = json['city_name'],
        aboutMe = json['about_me'],
        settings = json['settings'],
        status = json['status'] as String?,
        createdAt = json['created_at'] as String?,
        subscriptionFeatures = (json['subscription_features'] as List?)?.map((dynamic e) => SubscriptionFeatures.fromJson(e as Map<String,dynamic>)).toList();
*/
  Map<String, dynamic> toJson() => {
    'id' : id,
    'first_name' : firstName,
    'last_name' : lastName,
    'email' : email,
    'photo' : photo,
    'photo_url' : photoUrl,
    'mobile' : mobile,
    'country_id' : countryId,
    'country_name' : countryName,
    'state_id' : stateId,
    'state_name' : stateName,
    'city_id' : cityId,
    'city_name' : cityName,
    'about_me' : aboutMe,
    'settings' : settings,
    'status' : status,
    'created_at' : createdAt,
    'subscription_features' : subscriptionFeatures?.map((e) => e.toJson()).toList()
  };

  @override
  ProfileModel fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    firstName = json['first_name'] as String?;
    lastName = json['last_name'] as String?;
    email = json['email'] as String?;
    photo = json['photo'] as String?;
    photoUrl = json['photo_url'] as String?;
    mobile = json['mobile'] as String?;
    countryId = json['country_id'];
    countryName = json['country_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    aboutMe = json['about_me'];
    settings = json['settings'];
    status = json['status'] as String?;
    createdAt = json['created_at'] as String?;
    subscriptionFeatures = (json['subscription_features'] as List?)?.map((dynamic e) => SubscriptionFeatures.fromJson(e as Map<String,dynamic>)).toList();
  return this;
  }
}

class SubscriptionFeatures {
  final int? id;
  final String? name;
  final String? code;
  final Mapping? mapping;
  final String? type;
  final String? status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;
  final Pivot? pivot;

  SubscriptionFeatures({
    this.id,
    this.name,
    this.code,
    this.mapping,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pivot,
  });

  SubscriptionFeatures.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        code = json['code'] as String?,
        mapping = (json['mapping'] as Map<String,dynamic>?) != null ? Mapping.fromJson(json['mapping'] as Map<String,dynamic>) : null,
        type = json['type'] as String?,
        status = json['status'] as String?,
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'],
        pivot = (json['pivot'] as Map<String,dynamic>?) != null ? Pivot.fromJson(json['pivot'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'code' : code,
    'mapping' : mapping?.toJson(),
    'type' : type,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'pivot' : pivot?.toJson()
  };
}

class Mapping {
  final String? action;
  final String? unit;
  final int? count;
  final String? item;

  Mapping({
    this.action,
    this.unit,
    this.count,
    this.item,
  });

  Mapping.fromJson(Map<String, dynamic> json)
      : action = json['action'] as String?,
        unit = json['unit'] as String?,
        count = json['count'] as int?,
        item = json['item'] as String?;

  Map<String, dynamic> toJson() => {
    'action' : action,
    'unit' : unit,
    'count' : count,
    'item' : item
  };
}

class Pivot {
  final int? productId;
  final int? featureId;

  Pivot({
    this.productId,
    this.featureId,
  });

  Pivot.fromJson(Map<String, dynamic> json)
      : productId = json['product_id'] as int?,
        featureId = json['feature_id'] as int?;

  Map<String, dynamic> toJson() => {
    'product_id' : productId,
    'feature_id' : featureId
  };
}