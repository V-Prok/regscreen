import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: OnTapList()
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.number }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.teal,
        border: Border.all()
      ),
      child: Text('Элемент # $number',style: Theme.of(context).textTheme.headline6),
    );
  }
}

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        ListItem (number: 1),
        ListItem (number: 1),
        ListItem (number: 1),
        ListItem (number: 1),
        ListItem (number: 1),

    ],
    );
  }
}

class ListBuilder extends StatelessWidget {
  ListBuilder({Key? key}) : super(key: key);
  var list = List <int>.generate(20, (i) => i+1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index)
        {
          return ListItem(number: index);
        }
    );
  }
}

class OnTapList extends StatefulWidget {
  const OnTapList({Key? key}) : super(key: key);

  @override
  _OnTapListState createState() => _OnTapListState();
}

class _OnTapListState extends State<OnTapList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text ('Item $index'),
          selected: index == _selectedIndex,
          onTap:(){
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      },
    );
  }
}



