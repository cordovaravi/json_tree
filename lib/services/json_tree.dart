import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:dartz/dartz.dart';

import '../models/json_tree_response_model.dart';

class JsonTreeRepository {
  /// method to load [json] from [assets]
  Future<String> _loadJson() {
    return rootBundle.loadString('assets/raw.json');
  }

  /// method to get [JsonTreeResponse]
  Future<Either<String, JsonTreeResponseModel>> getTree() async {
    try {
      final jsonResponse = await _loadJson();
      final response =
          JsonTreeResponseModel.fromJson(json.decode(jsonResponse));
      return right(response);
    } on Exception catch (error) {
      return left(error.toString());
    } catch (error) {
      return left(error.toString());
    }
  }
}
