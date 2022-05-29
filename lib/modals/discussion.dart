import 'package:Plantfix/modals/creator_model.dart';

class Discussion {
  final int id;
  final String name;
  final String about;
  final String image;
  final Creator creater;

  Discussion(
      {required this.id,
      required this.name,
      required this.about,
      required this.image,
      required this.creater});

  Discussion.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'],
        about = json['about'],
        image = json['image'],
        creater = Creator.fromJson(json['creater']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'image': image,
      'creater': creater
    };
  }
}

// {
//     "id": 1,
//     "name": "Damaged Tomato",
//     "about": "This one is for tomato",
//     "creater": 1
// },
