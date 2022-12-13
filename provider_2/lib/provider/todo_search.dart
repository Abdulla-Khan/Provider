// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_2/provider/todo_filter.dart';

import '../model/todo_model.dart';

class TodoSearch extends Equatable {
  final String search;
  const TodoSearch({
    required this.search,
  });

  factory TodoSearch.initial() {
    return const TodoSearch(search: '');
  }
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [search];
}

class TodoSearchState extends ChangeNotifier {
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;
  void searchItem(Filter newFilter) {
    _state = _state.copyWith(filter: newFilter);
    notifyListeners();      
  }
}
