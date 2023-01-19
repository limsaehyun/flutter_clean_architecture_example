import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int id;
  final String title;
  final String body;

  PostEntity({
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  List<Object> get props => [id, title, body];
}
