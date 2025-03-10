import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
          color: Colors.pink,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
          surface: Color.fromRGBO(255, 254, 229, 1), 
          
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            // color: Colors.white
          )
        )
      ),
      routes: {
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
    );
  }
}
