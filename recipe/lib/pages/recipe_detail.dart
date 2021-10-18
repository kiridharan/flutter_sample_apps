// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:recipes/model/recipe.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child:Column(
          children:<Widget> [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
             Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
  // 8
  child: ListView.builder(
    padding: const EdgeInsets.all(7.0),
    itemCount: widget.recipe.ingredients.length,
    itemBuilder: (BuildContext context, int index) {
      final ingredient = widget.recipe.ingredients[index];
      // 9
      // TODO: Add ingredient.quantity
      return slideritem(ingredient);
    },
  ),
),
Slider(
  // 10
  min: 1,
  max: 10,
  divisions: 10,
  // 11
  label: '${_sliderVal * widget.recipe.servings} servings',
  // 12
  value: _sliderVal.toDouble(),
  // 13
  onChanged: (newValue) {
    setState(() {
      _sliderVal = newValue.round();
    });
  },
  // 14
  activeColor: Colors.green,
  inactiveColor: Colors.black,
),
          ],
          ),
          ),
    );
  }

  Widget slideritem(Ingredient ingredient) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        width: 20,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20,),
            Text('${ingredient.quantity * _sliderVal} '
                            '${ingredient.measure} '
                            ),
                            Text('${ingredient.name}' , style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}