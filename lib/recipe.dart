import 'package:flutter/cupertino.dart';
import 'package:paralax/paralax.dart';

class Recipe {
  String label;
  String imageUrl;
  // TODO: Add servings and ingredients here

  Recipe(
    this.label,
    this.imageUrl,
  );

  static List<Recipe> samples = [
    Recipe(
      'Spaghetti and Meatballs',
      'https://www.saltandlavender.com/wp-content/uploads/2016/08/sausagemeatballsroastedtomatospaghetti2-680x1024.jpg',
    ),
    Recipe(
      'Tomato Soup',
      'https://diethood.com/wp-content/uploads/2013/09/Roast-Tomato-Soup-2.jpg',
    ),
    Recipe(
      'Grilled Cheese',
      'https://www.jessicagavin.com/wp-content/uploads/2020/04/grilled-cheese-5-600x900.jpg',
    ),
    Recipe(
      'Chocolate Chip Cookies',
      'https://static.fanpage.it/wp-content/uploads/sites/22/2017/07/chocolate-chip-cookies.jpg',
    ),
    Recipe(
      'Taco Salad',
      'https://hips.hearstapps.com/delish/assets/16/29/1469126666-beef-taco-saladl1.jpg',
    ),
    Recipe(
      'Hawaiian Pizza',
      'https://busites-www.s3.amazonaws.com/blog-margaritaville/2018/06/ThinkstockPhotos-515005958.jpg',
    ),
  ];
// TODO: Add Ingredient() here
}
