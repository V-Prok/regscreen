import 'package:flutter/material.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2));
    return MaterialApp(
      home: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 100,),
                SizedBox(child:
                Row(children:[
                  Icon(Icons.account_circle_outlined),
                  SizedBox(width: 50),
                  Text('Регистрация',
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 0.9)),),

                ])),

                SizedBox(height: 20,),
                Text('Чтобы зарегистрироваться введите свой номер телефона и почту',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
                SizedBox(height: 20,),
                Text('Телефон',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.8)),),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: '+7',
                  ),
                ),
                SizedBox(height: 20,),
                Text('Почта',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.8)),),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
                ),
                SizedBox(height: 28,),
                const Text('Вам придет четырехзначный код, который будет вашим паролем',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
                SizedBox(height: 20,),
                const Text('Изменить пароль можно будет в личном кабинете после регистрации',
                  style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
                SizedBox(height: 32,),
                SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: () {},
                  child: Text('Отправить код'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )
                ),

              ],),
            ),
          )
      ),
    );
  }
}
