import 'package:flutter/material.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Geogria',
        splashColor: Colors.yellow,

        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.amber
        ),

        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 20, fontFamily: 'Calibri'),
        )
      ),
      home: ThemeScreen(),
    );
  }
}

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  PreferredSizeWidget _appBar() => AppBar();

  @override

  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2));

    return Scaffold(
      appBar: _appBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text ('Заголовок', style: Theme.of(context).textTheme.headline6,),
                Container(
                  height: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text('Введите логин в виде 10 цифр номера телефона'),

                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Телефон',
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Пароль',
                  ),
                ),
                SizedBox(height: 28,),
                SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: () {},
                  child: Text('Войти'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )
                ),
                SizedBox(height: 32,),
                InkWell(child: const Text('Регистрация',),
                    onTap: () {}),
                SizedBox(height: 20,),
                InkWell(child: Text('Забыли пароль?'), onTap: () {})


              ],
            ),
          )

    )
    );
  }
}

