import 'package:equatable/equatable.dart';

class Destination extends Equatable {
  double? id;
  String? name;
  String? image;
  int? rating;


  Destination({this.id, this.name, this.image, this.rating});
  Destination.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image, rating];
}