import 'package:firebase_login/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body = Stack(
      children: <Widget>[_makeBackGround(context), _loginForm(context)],
    );
    return Scaffold(
      body: body,
    );
  }
}

Widget _makeBackGround(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final colorGradient = <Color>[Color(0xfffbb448), Color(0xfff7892b)];

  final purpleBckGround = Container(
    height: size.height * .4,
    width: double.infinity,
    decoration: BoxDecoration(gradient: LinearGradient(colors: colorGradient)),
  );

  final circle = Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, .2)),
  );

  return Stack(
    children: <Widget>[
      purpleBckGround,
      Positioned(
        top: 90.0,
        left: 30.0,
        child: circle,
      ),
      Positioned(
        top: -40.0,
        right: -30.0,
        child: circle,
      ),
      Positioned(
        bottom: -50.0,
        right: -10.0,
        child: circle,
      ),
      Positioned(
        bottom: 120.0,
        right: 20.0,
        child: circle,
      ),
      Positioned(
        bottom: -50.0,
        left: -20.0,
        child: circle,
      ),
      Container(
        padding: EdgeInsets.only(top: 80.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
            SizedBox(height: 10.0, width: double.infinity),
            Text('xx1196',
                style: TextStyle(color: Colors.white, fontSize: 25.0))
          ],
        ),
      )
    ],
  );
}

Widget _loginForm(BuildContext context) {
  final bloc = Provider.of(context);
  final size = MediaQuery.of(context).size;

  final boxShadow = <BoxShadow>[
    BoxShadow(
        color: Colors.black26,
        blurRadius: 3.0,
        offset: Offset(0.0, 5.0),
        spreadRadius: 3.0)
  ];

  final safeArea = SafeArea(
    child: Container(
      height: 200.0,
    ),
  );

  final _loginBox = Container(
    width: size.width * .85,
    margin: EdgeInsets.symmetric(vertical: 30.0),
    padding: EdgeInsets.symmetric(vertical: 50.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: boxShadow),
    child: Column(
      children: <Widget>[
        Text(
          'Ingreso',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 60.0,
        ),
        _makeEmail(bloc),
        SizedBox(
          height: 60.0,
        ),
        _makePassword(bloc),
        SizedBox(
          height: 60.0,
        ),
        _makeButtonSubmit()
      ],
    ),
  );

  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        safeArea,
        _loginBox,
        Text('¿Olvido su contraseña?'),
        SizedBox(
          height: 25.0,
        )
      ],
    ),
  );
}

Widget _makeEmail(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Color(0xfff7892b),
              ),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data),
          onChanged: bloc.changeEmail,
        ),
      );
    },
  );
}

Widget _makePassword(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Color(0xfff7892b),
              ),
              labelText: 'Contraseña',
              counterText: snapshot.data),
          onChanged: bloc.changePassword,
        ),
      );
    },
  );
}

Widget _makeButtonSubmit() {
  return RaisedButton(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
      child: Text('Ingresar'),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    elevation: 0.5,
    color: Color(0xfff7892b),
    textColor: Colors.white,
    onPressed: () {},
  );
}
