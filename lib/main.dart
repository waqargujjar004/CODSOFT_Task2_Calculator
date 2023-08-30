import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var input = '';
  var output = '';
  var operation = '';
  var answer =false;
  var inputText = true;

  onButtonClick(value) {
    if (value == "AC") {
      input = '';
      answer = false;
      inputText = true;

    }
    else if (value == '<-') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);

        answer = false;
        inputText = false;
      }
    }
    else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        answer=true;
        output = finalvalue.toString();
        input = output;
        inputText = false;

      }
    }
   else if(value == "ans" ){
     answer = true;
     inputText = false;
    }


    else{

      input = input+value;
      inputText = false;
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
    home:Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text("Calculator Codsoft"),
        centerTitle: true,
        backgroundColor: Color(0xff272727),
      ),

      body: Column(

        children: [

          Expanded(child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text( inputText ? "Please Enter Values":input , style: TextStyle(
                  fontSize: inputText? 30 :48,
                  color: Colors.white
                ),),

                SizedBox(
                  height: 30,
                ),

                Text( answer ? output: "" , style: TextStyle(
                    fontSize: 34,
                    color: Colors.white.withOpacity(0.7)
                ),),

              ],
            ),
          )),







          Row(
            children: [
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.all(22),
                          primary: Colors.orange),
                      onPressed: () => onButtonClick("AC") , child: Text("AC", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),)))),
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Colors.orange),
                      onPressed: ()=> onButtonClick("<-"), child: Text("Del", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Colors.orange),
                      onPressed: ()=> onButtonClick("ans"), child: Text("Ans", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary:Color(0xff272727)),
                      onPressed: ()=> onButtonClick("/"), child: Text("/", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                  ),)))),


               
            ],
          ),

          Row(
            children: [
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("7"), child: Text("7", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("8"), child: Text("8", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("9"), child: Text("9", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff272727)),
                      onPressed: ()=> onButtonClick("*"), child: Text("*", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                  ),)))),



            ],
          ),

          Row(
            children: [
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("4"), child: Text("4", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("5"), child: Text("5", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("6"), child: Text("6", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff272727)),
                      onPressed: ()=> onButtonClick("+"), child: Text("+", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                  ),)))),



            ],
          ),

          Row(
            children: [
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("1"), child: Text("1", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("2"), child: Text("2", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("3"), child: Text("3", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff272727)),
                      onPressed: ()=> onButtonClick("-"), child: Text("-", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:Colors.orange
                  ),)))),



            ],
          ),

          Row(
            children: [
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff272727)),
                      onPressed: ()=> onButtonClick("%"), child: Text("%", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                  ),)))),
              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("0"), child: Text("0", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Color(0xff191919)),
                      onPressed: ()=> onButtonClick("."), child: Text(".", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),

              Expanded(child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: EdgeInsets.all(22),
                          primary: Colors.orange),
                      onPressed: ()=> onButtonClick("="), child: Text("=", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)))),



            ],
          )


        ],
      ),
    )
    );
  }

}
