import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:recipes/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    await dotenv.load();

    String? apiKey = dotenv.env['API_KEY'];

    if (apiKey == null) {
      throw Exception('API key not found in environment variables');
    }

    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "20", "tags": "under_30_minutes"});

    print('Making API request to: $uri');

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": apiKey,
      "x-rapidapi-host": "tasty.p.rapidapi.com",
    });

    print('API response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> recipes = data['results'];
      return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
    } else {
      throw Exception('Failed to load recipes: ${response.statusCode}');
    }
  }
}
