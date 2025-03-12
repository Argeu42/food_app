import 'package:flutter/material.dart';
import 'package:food_app/models/settings.dart';
import 'screens/settings_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'utils/app_routes.dart';
import './models/meal.dart';
import './data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaliableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avaliableMeals =
          dummyMeals.where((meal) {
            final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
            final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
            final filterVegan = settings.isVegan && !meal.isVegan;
            final filterVegetarian = settings.isVegetarian && !meal.isVegan;
            return !filterGluten &&
                !filterLactose &&
                !filterVegan &&
                !filterVegetarian;
          }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) 
        ? _favoriteMeals.remove(meal) 
        : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
          tertiary: Colors.white,
          surface: Color.fromRGBO(255, 254, 229, 1),
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            // shadows: <Shadow>[
            //   Shadow(
            //     offset: Offset(1.5, 1.5),
            //     blurRadius: 0.0,
            //     color: Color.fromARGB(255, 0, 0, 0),
            //   ),
            // ],
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.amber,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS:
            (ctx) => CategoriesMealsScreen(_avaliableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
