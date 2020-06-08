import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Tip Calculator',home:TipCalculator()));
}

class TipCalculator extends StatelessWidget {
  
  double billAmount=0.0;
  double tipPercentaje=0.0;
  double total=0.0;

  @override
  Widget build(BuildContext context) {
    //var maximo =billAmount.truncate();
    //print(maximo);
    TextField billAmountField=TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try{
          billAmount= double.parse(value);
        }
        catch(exception){

          billAmount=0.0;
        }
      },

    );

    TextField tipPercentageField = TextField(
      decoration: InputDecoration(labelText: "tip %", hintText:"15" ),
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try{
          tipPercentaje=double.parse(value);
        }catch(exception){
          tipPercentaje=0.0;
        }
      },
    );

   RaisedButton calculateButton = RaisedButton(
     child: Text('Calculate'),
     onPressed: (){
       double calculatedTip = (billAmount* tipPercentaje)/100.0;
       double total= billAmount+calculatedTip;

       AlertDialog dialog = AlertDialog(
         content: Text("Tip: \$$calculatedTip\n"
                        "Total: \$$total"));
                        showDialog(context: context,
                         builder:(BuildContext)=>dialog);

                         
                        
     });
 Text texto1=Text('hello');
 

  final container = Container(
        
       
       padding: const EdgeInsets.all(16.0),
       child: Column(
          
         //children: [billAmountField,tipPercentageField, calculateButton]
         children: <Widget>[
          
           
           Container(
             
             color: Colors.blue,
             child: Column(children:[billAmountField,tipPercentageField, calculateButton]) 
             ),
             Container(
               
               
               color: Colors.green,
               child: Text('Total:\$$total '),
               height: 600,
               alignment: AlignmentDirectional.center,

             )

         ],

         ));


         AppBar appBar = AppBar(title: Text('Tip Calcular'));

         Scaffold scaffold = Scaffold(appBar:appBar, body: container);

         return scaffold;
  }

}