import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

const customcolors = [
  Colors.white,
  Colors.blueAccent,
  Colors.blueAccent,
  Colors.pink,
  Colors.pink,
  Colors.blue,
  Colors.purple,
  Colors.purple
];

class RecipeCard extends StatelessWidget {
  final String name;
  final String description;
  final String thumbnailUrl;
  final double rating;
  final int ratingCount;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.rating,
    required this.ratingCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(215, 17, 20, 61)),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply,
                ),
                image: thumbnailUrl.isNotEmpty
                    ? NetworkImage(thumbnailUrl)
                    : AssetImage('assets/placeholder_image.png')
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            ColorizeAnimatedText(
                              name,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                              speed: const Duration(milliseconds: 800),
                              textAlign: TextAlign.start,
                              colors: customcolors,
                            )
                          ]),
                    )),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: const Color.fromARGB(255, 177, 0, 153),
                              size: 18,
                            ),
                            SizedBox(width: 7),
                            Text(
                              rating.toStringAsFixed(1),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.blue,
                              size: 18,
                            ),
                            SizedBox(width: 7),
                            Text(
                              ratingCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
