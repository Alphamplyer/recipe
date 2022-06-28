
import 'package:flutter/material.dart';
import 'package:frontend/src/models/ingredient.dart';
import 'package:frontend/src/models/recipe.dart';
import 'package:frontend/src/models/recipe_ingredient.dart';
import 'package:frontend/src/models/recipe_step.dart';
import 'package:frontend/src/models/tool.dart';
import 'package:frontend/src/pages/edit_recipe.dart';
import 'package:frontend/src/states/theme.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  final ThemeState _themeState = ThemeState(enableDarkModeByDefault: true);

  final Recipe recipe = Recipe(
    name: 'Pizza',
    description: 'A pizza is a flatbread typically topped with tomato sauce and cheese and baked in an oven.',
    imageUrl: 'https://img-3.journaldesfemmes.fr/EIo1RLVcSyvpUiU2ZF4w6ojkaps=/1500x/smart/630e41699895410c9d0c4a4e106de2a3/ccmcms-jdf/11009899.jpg',
    ingredients: [
      RecipeIngredient(
        ingredient: Ingredient(
          name: 'Flour',
          imageUrl: 'https://www.thespruceeats.com/thmb/dKYZwtTOK8JcLiDCrvBrwTE5qDc=/1000x1000/smart/filters:no_upscale()/all_purpose_flour1_2-92747f05d2c7445d86fedae894c8c16e.jpg',
          unit: 'g',
        ),
        quantity: '300',
      ),
      RecipeIngredient(
        ingredient: Ingredient(
          name: 'Tomato Sauce',
          imageUrl: 'https://www.errenskitchen.com/wp-content/uploads/2013/12/Easy-Homemade-Tomato-Pasta-Sauce-Feature-500x480.jpg',
          unit: 'ml',
        ),
        quantity: '300',
      ),
      RecipeIngredient(
        ingredient: Ingredient(
          name: 'Cheese',
          imageUrl: 'https://images.theconversation.com/files/316919/original/file-20200224-24701-1lk36vg.jpg',
          unit: 'g',
        ),
        quantity: '300',
      ),
    ],
    tools: [
      Tool(
        name: 'Oven',
        imageUrl: 'https://fr.bertazzoni.com/media/immagini/13061_z_F6011PRO-TX.jpg',
      ),
      Tool(
        name: 'Baking Pan',
        imageUrl: 'https://m.media-amazon.com/images/I/31tmM1xgpkL._AC_.jpg',
      ),
    ],
    steps: [
      RecipeStep(
        number: 1,
        content: 'Mix the ingredients together.',
      ),
      RecipeStep(
        number: 2,
        content: 'Bake in the oven.',
      ),
    ],
  );

  @override
  void initState() {
    _themeState.isDarkMode.addListener(onThemeModeChanged);
    super.initState();
  }

  void onThemeModeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe',
      theme: _themeState.lightTheme,
      darkTheme: _themeState.darkTheme,
      themeMode: _themeState.themeMode,
      //home: const TestPage(),
      home: EditRecipePage(recipe: recipe),
    );
  }
}