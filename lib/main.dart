import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
  final _formKey = GlobalKey<FormState>();

  double result = 0.0;
  double length = 0.0;
  double height = 0.0;

  void _multiplication () {
    setState(() {
      result = height * length;
      if(_formKey.currentState!.validate()  ) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Площадь успешно вычислена!'), backgroundColor: Colors.green,)
        );
      }
    });
  }

  _changeHeight (String text) {
    setState(() => height = double.tryParse(text) ?? 0.0);
  }
  _changeLenght (String text){
    setState(() => length = double.tryParse(text) ?? 0.0 );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child:
              Row(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child:
                    Column(
                      children:  const <Widget>[
                        Text('Ширина, мм:', style: TextStyle(fontSize: 16,),),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty) return 'Введите ширину';
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: _changeHeight,
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Ширина, мм',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child:
              Row(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child:
                    Column(
                      children:  const <Widget>[
                        Text('Высота, мм:', style: TextStyle(fontSize: 17,),),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextFormField( validator: (value){
                      if(value!.isEmpty) return 'Введите высоту';
                    },
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: _changeLenght,
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Высота, мм',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _multiplication,
                    child: const Text('Вычислить'),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  length > 0 && height > 0 && result > 0 && (length * height) == result  ? Text('S = $length * $height = $result (мм2)',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 26),)
                      : length > 0 && height > 0 ? const Text('') : const Text('Задайте параметры', style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 24))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() => runApp (
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Калькулятор площади'),
          ),
          body: const MyApp(),
        )
    )
);