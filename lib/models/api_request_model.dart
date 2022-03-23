class ApiRequest {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? deviceType;
  final String? deviceToken;
  final String? sessionId;
  final String? orchardName;
  final String? location;
  final String? lat;
  final String? lng;
  final String? message;
  final String? otp;
  final String? mobile;

  ApiRequest({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.deviceType,
    this.deviceToken,
    this.sessionId,
    this.orchardName,
    this.location,
    this.lat,
    this.lng,
    this.message,
    this.otp,
    this.mobile,
  });

  ApiRequest.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        email = json['email'] as String?,
        password = json['password'] as String?,
        deviceType = json['device_type'] as String?,
        deviceToken = json['device_token'] as String?,
        sessionId = json['session_id'] as String?,
        orchardName = json['orchardName'] as String?,
        location = json['location'] as String?,
        lat = json['lat'] as String?,
        lng = json['lng'] as String?,
        message = json['message'] as String?,
        otp = json['otp'] as String?,
        mobile = json['mobile'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'first_name' : firstName,
    'last_name' : lastName,
    'email' : email,
    'password' : password,
    'device_type' : deviceType,
    'device_token' : deviceToken,
    'session_id' : sessionId,
    'orchardName' : orchardName,
    'location' : location,
    'lat' : lat,
    'lng' : lng,
    'message' : message,
    'otp' : otp,
    'mobile' : mobile
  };
}