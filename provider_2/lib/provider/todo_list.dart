// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:provider_2/model/todo_model.dart';

class TodoListState {
  final List<Todo> todo;
  TodoListState({
    required this.todo,
  });

  factory TodoListState.initial() {
    return TodoListState(todo: [
      Todo(desc: 'desc', title: '1'),
      Todo(desc: 'desc2', title: '2'),
      Todo(desc: 'desc3', title: '3'),
      Todo(desc: 'desc4', title: '4'),
    ]);
  }

  @override
  String toString() => 'TodoListState(todo: $todo)';

  @override
  bool operator ==(covariant TodoListState other) {
    if (identical(this, other)) return true;

    return listEquals(other.todo, todo);
  }

  @override
  int get hashCode => todo.hashCode;

  TodoListState copyWith({
    List<Todo>? todo,
  }) {
    return TodoListState(
      todo: todo ?? this.todo,
    );
  }
}

class TodoList with ChangeNotifier {
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;
  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [..._state.todo, newTodo];

    _state = _state.copyWith(todo: newTodos);
    notifyListeners();
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = _state.todo.map((Todo todo) {
      if (todo.title == id) {
        return Todo(desc: todoDesc, title: id, completed: todo.completed);
      }
      return todo;
    }).toList();
    _state = _state.copyWith(todo: newTodos);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final newTodos = _state.todo.map((Todo todo) {
      if (todo.title == id) {
        return Todo(desc: todo.desc, title: id, completed: !todo.completed);
      }
      return todo;
    }).toList();
    _state = _state.copyWith(todo: newTodos);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    final newTodos =
        _state.todo.where((Todo t) => t.title != todo.title).toList();
    _state = _state.copyWith(todo: newTodos);
    notifyListeners();
  }
}
