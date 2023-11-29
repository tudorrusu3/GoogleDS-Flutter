import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Converter(),
    );
  }
}

class Converter extends StatefulWidget {
  const Converter({super.key});


  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  TextEditingController controller = TextEditingController();
  bool error = false;
  double amount = 0.0;
  double converted = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Converter'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network('https://www.infofinanciar.ro/wp-content/uploads/2023/02/76459788-l.jpg'),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'How many euro you want to exchange',
                errorText: error? 'Enter a valid number' :null),
              onChanged: (value){
                setState(() {
                  error = false;
                  if(value.isEmpty){
                    amount = 0.0;
                  }
                  else{
                    try{
                    amount = double.parse(value);
                  }
                  catch(e){
                      error = true;
                  }
                }
                });
              },
            ),
          ElevatedButton(onPressed: () {
            if(amount>0){
              setState(() {
                converted = amount * 4.97;
                error =  false;
              });
            }
          }, child: const Text('Convert to RON')),
           Text('${converted.toStringAsFixed(2)} Ron', style: const TextStyle(fontSize: 30))
              ],
        ),
            )
        );
  }
}