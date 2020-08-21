
import 'package:flutter/material.dart';
void main()=>runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      home: new LoginPage(),
      theme:new ThemeData(
        primarySwatch:Colors.red
      )
      
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconAnimation;

  @override

  void initState(){
    super.initState();
    _iconanimationController=new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconanimationController,
      curve: Curves.bounceOut
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconanimationController.forward();
    }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body:new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image:new AssetImage("assets/bb.jpg"),
            fit: BoxFit.cover,
            color:Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value*100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,fontSize: 20.0
                      )
                    )
                  ),
                                  child: new Container
                                ( padding: const EdgeInsets.all(40.0),
                                
                                   child: new Column
                  (children: <Widget>[
                   new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                   ),

                   new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter password",
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                   ),
                  new Padding(padding: const EdgeInsets.only(top: 20.0),
                  ),
                  new MaterialButton(
                  color:Colors.teal,
                  textColor:Colors.white,
                  child: new Text("Login"),
                  onPressed:()=>{},
                  ),


                 ],),
                                  ),
                )

                ) ,
            ],)
        ],
      ),
      
    );
  }
}