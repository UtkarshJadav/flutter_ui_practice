import 'package:flutter_demo/models/results.dart';

class MainModule implements Decodable<MainModule>{
   int? id;
   String? title;
   String? subTitle;
   dynamic icon;

  MainModule({
    this.id,
    this.title,
    this.subTitle,
    this.icon,
  });

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'sub_title' : subTitle,
    'icon' : icon
  };

  @override
  MainModule fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    subTitle = json['sub_title'] as String?;
    icon = json['icon'];
    return this;
  }


}