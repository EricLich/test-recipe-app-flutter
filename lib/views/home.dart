import 'package:flutter/material.dart';
import 'package:recipies_app_test/models/recipe.api.dart';
import 'package:recipies_app_test/models/recipe.dart';
import 'package:recipies_app_test/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Recipe app'),
          ],
        )),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      rating: _recipes[index].rating.toString(),
                      totalTimeInSeconds:
                          '${_recipes[index].totalTimeInSeconds.toString()} mins',
                      thumbnailUrl: _recipes[index].images);
                }));
  }
}
