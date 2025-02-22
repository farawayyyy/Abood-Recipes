// ignore_for_file: file_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

const colorizeColors = [
  Colors.blue,
  Colors.purple,
  Colors.purple,
  Colors.pinkAccent,
  Colors.pinkAccent,
  Colors.lightBlueAccent,
];

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              widget.recipe.name,
              textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              speed: const Duration(milliseconds: 600),
              textAlign: TextAlign.left,
              colors: colorizeColors,
            )
          ],
          isRepeatingAnimation: true,
          pause: const Duration(milliseconds: 50),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        backgroundColor: const Color.fromARGB(226, 42, 12, 92),
      ),
      body: Container(
        height: 1000,
        color: const Color.fromARGB(255, 30, 4, 48),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ** recipe details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        widget.recipe.description,
                        maxLines: null,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.purple),
                          SizedBox(width: 4),
                          Text(
                            widget.recipe.rating.toStringAsFixed(1),
                            style: TextStyle(color: Colors.purple),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.people, color: Colors.blue),
                          SizedBox(width: 4),
                          Text(
                            widget.recipe.ratingCount.toString(),
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Image.network(
                          widget.recipe.thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
