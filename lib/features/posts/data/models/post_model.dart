import '../../domain/entities/post_entity.dart';

class PostModel extends Post {
  PostModel({required int id, required String title, required String body})
      : super(id: id, title: title, body: body);
//Second type of constructor : its name is fromJson
// factory reads a created object : we won't create a new object with the constructor instead I'll use an existant object
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
