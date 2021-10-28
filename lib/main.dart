import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:paralax/paralax.dart';

import 'recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Метод виджета - это точка входа для объединения других виджетов для создания нового виджета
    final ThemeData theme =
        ThemeData(); //Тема определяет визуальные аспекты, такие как цвет. По умолчанию ThemeData будут отображаться стандартные значения материалов по умолчанию.
    return MaterialApp(
      //использует Material Design и является виджетом, который будет включен в RecipeApp.
      debugShowCheckedModeBanner: false,
      title: 'Recipe Calc ', //Название приложения
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            // primary: Colors.deepOrange[500],
            // secondary: Colors.black54,
            ),
      ),
      home: MyHomePage(
          title:
              'Recipe Calculator'), //обновили заголовок и отобразили его на устройстве
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //обеспечивает высокоуровневую структуру экрана
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: [
              Colors.blue,
              Colors.lightBlueAccent[100]!,
              Colors.yellow,
              Colors.red,
            ],
          )),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),

            //Создает список, используя ListView
            itemCount: Recipe.samples.length,
            //определяет количество строк в списке. В данном случае length это количество объектов в Recipe.samples списке

            itemBuilder: (BuildContext context, int index) {
              //строит дерево виджетов для каждой строки

              Widget buildRecipeCard(Recipe recipe) {
                // собственный виджет
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: 350,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      // image: const DecorationImage(
                      //   image: NetworkImage('_'),
                      //
                      //   // fit: BoxFit.cover,
                      // ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(100),
                          blurRadius: 3.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                          offset: const Offset(
                            0.0, // Move to right 10  horizontally
                            3.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: ParalaxContainer(
                      aspectRatio: 16 / 10,
                      radius: 8,
                      type: ParalaxType.NETWORK,
                      imageUrl: recipe.imageUrl,

                      // radius: 16,
                      widgets: Positioned(
                        child: Container(
                            child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              recipe.label,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        )),
                      ),
                    ),
                  ),
                );
              }

              // TODO: Add GestureDetector
              return buildRecipeCard(
                  Recipe.samples[index]); //Виджет отображает имя рецепта.
            },
          ),
        ),
      ),
    );
  }
}
