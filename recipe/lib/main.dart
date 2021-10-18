import 'package:flutter/material.dart';
import 'package:recipes/model/recipe.dart';
import 'package:recipes/pages/recipe_detail.dart';


void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
          )
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.recipes.length,
          itemBuilder: (BuildContext context , int index){
            return GestureDetector(
              onTap: () {
           Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
        return RecipeDetail(recipe:Recipe.recipes[index]);
        
      },
    ),
   );
  },
              child: buildRecipeCard(
                Recipe.recipes[index]
              ),
              );
          }
          ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget buildRecipeCard(Recipe recipe){
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image(
              image:AssetImage(
                recipe.imageUrl,
                ),
              fit: BoxFit.contain,
              ),
            const SizedBox(height: 16.0),
            Text(recipe.label
            ,style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Palatino'
            ),),
          ]),
      ),);
}
}