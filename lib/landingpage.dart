import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Meal {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  Meal(
      {required this.idMeal,
      required this.strMeal,
      required this.strMealThumb});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
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

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/search.php?f=b'));
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
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: Meals.isEmpty
                        ? const Center(
                            child: Text('No Data'),
                          )
                        : ListView.builder(
                            itemCount: Meals.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading:
                                    Image.network(Meals[index].strMealThumb),
                                title: Text(Meals[index].strMeal),
                              );
                            },
                          )),
          ],
        ),
      ),
    );
  }
}
