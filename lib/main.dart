import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> myList =
      [
        'List item1',
        'List item2',
        'List item3',
        'List item4',
        'List item5',
        'List item6',
        'List item7',
        'List item8',
        'List item9',
        'List item10',
        'List item11',
        'List item12',
        'List item13',
        'List item14',
      ];
  Color? color = Colors.white ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
                Expanded(
                  child : ReorderableListView(
                      children: [
                       for (int i = 0 ; i< myList.length;i++)
                         ListTile(
                           key: ValueKey(i),
                           title: buildItem(i,myList[i]),
                         )
                      ],
                      onReorder: (oldIndex,newIndex)
                      {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                           String item = myList.removeAt(oldIndex);
                          myList.insert(newIndex, item);
                        });
                      }
                  ),
                )
          ],
        ),
      ),
    );
  }

  buildItem(index,String text){
      if (index%2!=0)
        color=Colors.blue[100];
      else
        color = Colors.white ;
      return Container(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(text),
              Spacer() ,
              Icon(Icons.view_headline_sharp)
            ],
          ),
        ),
      );
  }
  void updateIndex(int oldIndex,int newIndex)
  {
    int temp = oldIndex ;
    oldIndex = newIndex ;

  }
}




