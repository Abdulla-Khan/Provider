import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String title;
  final String desc;
  final bool completed;

  Todo({
    String? title,
    this.completed = false,
    required this.desc,
  }) : title = title ?? uuid.v4();

  @override
  List<Object> get props => [title, completed, desc];
  @override
  bool get stringify => true;
}

enum Filter {
  all,
  active,
  completed,
}
