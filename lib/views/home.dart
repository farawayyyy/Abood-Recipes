// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.api.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/views/RecipeDetailScreen.dart';
import 'package:recipes/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Recipe>> futureRecipes;

  @override
  void initState() {
    super.initState();
    futureRecipes = RecipeApi.getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 10, 36),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_menu,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Abood Recipes',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        body: FutureBuilder<List<Recipe>>(
          future: futureRecipes,
          builder: (context, snapshot) {
            print('Snap connection state: ${snapshot.connectionState}');
            print('Snap has data: ${snapshot.hasData}');
            print('Snap error: ${snapshot.error}');

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.purple,
                backgroundColor: Colors.blue,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No recipes found'));
            } else {
              List<Recipe> recipes = snapshot.data!;
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  Recipe recipe = recipes[index];
                  return RecipeCard(
                    name: recipe.name,
                    description: recipe.description,
                    thumbnailUrl: recipe.thumbnailUrl,
                    rating: recipe.rating,
                    ratingCount: recipe.ratingCount,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ));
  }
}
