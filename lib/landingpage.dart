import 'package:flutter/material.dart';
import 'mealcard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Meal {
  final String idMeal;
  final String strMeal;
  final String? strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String> ingredients;

  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    // Extract ingredients dynamically from the JSON
    List<String> ingredients = [];
    for (int i = 1; i <= 10; i++) {
      final ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }

    return Meal(
      idMeal: json['idMeal'] ?? '', // Provide default value for required fields
      strMeal: json['strMeal'] ?? '',
      strDrinkAlternate: json['strDrinkAlternate'] as String?,
      strCategory: json['strCategory'] ?? '',
      strArea: json['strArea'] ?? '',
      strInstructions: json['strInstructions'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      strTags: json['strTags'] as String?, // Handle nullable fields
      strYoutube: json['strYoutube'] as String?, // Handle nullable fields
      ingredients: ingredients,
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Meal> Meals = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=b'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['meals'] != null) {
        Meals = (data['meals'] as List).map((e) => Meal.fromJson(e)).toList();
      } else {
        Meals = [];
      }
    } else {
      Meals = [];
    }
    setState(() {
      isLoading = false;
      print(Meals);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E01FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome to the App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            SizedBox(
                width: 100, height: 100, child: Image.asset('assets/play.png')),
            const SizedBox(height: 20),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: Meals.isEmpty
                        ? const Center(
                            child: Text('No Data'),
                          )
                        : ListView.builder(
                            itemCount: Meals.length,
                            itemBuilder: (context, index) {
                              // Use the MealCard widget to display each meal
                              return MealCard(meal: Meals[index]);
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
