import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:json_tree/services/json_tree.dart';

import '../models/json_tree_response_model.dart';

class HomePageController extends ChangeNotifier {
  final JsonTreeRepository _jsonTreeRepository = JsonTreeRepository();

  JsonTreeResponseModel _jsonTreeResponseModel = JsonTreeResponseModel();

  JsonTreeResponseModel get jsonTreeResponse => _jsonTreeResponseModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  loadTree() async {
    _isLoading = true;
    notifyListeners();
    final response = await _jsonTreeRepository.getTree();

    response.fold((error) {
      log(error);
    }, (response) {
      _jsonTreeResponseModel = response;
      _isLoading = false;
      notifyListeners();
    });
  }
}
