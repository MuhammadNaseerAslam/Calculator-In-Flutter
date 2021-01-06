import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num1;
  int num2;
  String textToDisplay="";
  String res;
  String operatorToPerform;

  void btnClicked(String btnVal)
  {
    if(btnVal=="C")
    {
      textToDisplay="";
      num1=0;
      num2=0;
      res="";

    }
    else if (btnVal=="+" || btnVal=="-" || btnVal=="x"  || btnVal=="/")
    {
      num1 = int.parse(textToDisplay);
      res = "";
      operatorToPerform = btnVal;
    }
    else if (btnVal=="=" )
    {
      num2 = int.parse(textToDisplay);
      if(operatorToPerform=="+")
      {
        res=(num1+num2).toString();
      }
      else if(operatorToPerform=="-")
      {
        res=(num1-num2).toString();
      }
      else if(operatorToPerform=="x")
      {
        res=(num1*num2).toString();
      }
      else if(operatorToPerform=="/")
      {
        res=(num1/num2).toString();
      }
    }
    else
    {
      res=int.parse(textToDisplay+btnVal).toString();
    }
  setState(() {
    textToDisplay=res;

  });
  }

  Widget custombuton( String btnVal)
  {
    return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(25.0),
          onPressed: ()=>btnClicked(btnVal),
          child:Text(
            "$btnVal",
            style: TextStyle(
              fontSize: 25.0,

            ),
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
children:<Widget>[
  Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.bottomRight,
        child: Text(
          "$textToDisplay",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
  ),
 Row(
   children:<Widget>[
    custombuton("9"),
     custombuton("8"),
     custombuton("7"),
     custombuton("+"),


   ],
 ),
  Row(
    children:<Widget>[
      custombuton("6"),
      custombuton("5"),
      custombuton("4"),
      custombuton("-"),


    ],
  ),
  Row(
    children:<Widget>[
      custombuton("3"),
      custombuton("2"),
      custombuton("1"),
      custombuton("x"),


    ],
  ),
  Row(
    children:<Widget>[
      custombuton("C"),
      custombuton("0"),
      custombuton("="),
      custombuton("/"),


    ],
  )

],
        ),
      ),
    );
  }
}



