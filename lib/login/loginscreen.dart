import 'package:HomER_flutter/tenant_Screens/home.dart';
import 'package:flutter/material.dart';
import '../owner_Screens/buildings_overview_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

enum AuthMode { Signup, Login }

class LoginPage extends StatefulWidget {
  static const String id = '/LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'userName': '',
    'email': '',
    'password': '',
  };

  final _passwordController = TextEditingController();
  bool _isLoading = false;
  void _submit(BuildContext context, String type) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    _formKey.currentState.save();
    setState(() {});
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (_authMode == AuthMode.Login) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: _authData['email'].trim(),
            password: _authData['password'].trim());
        if (type == 'tenet') {
          Navigator.of(context).pushReplacementNamed(TenetHome.id);
        } else if (type == 'owner') {
          Navigator.of(context)
              .pushReplacementNamed(BuildingsOverviewScreen.id);
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: _authData['email'].trim(),
            password: _authData['password'].trim());
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user.uid)
            .set({
          'username': _authData['username'],
          'email': _authData['email'],
          'userType': type,
        });
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print(error);
      // var errorMessage = 'Couldn\'t authenticate ';
      // if (error.toString().contains('EMAIL_EXISTS')) {
      //   errorMessage = 'email is already in use';
      // } else if (error.toString().contains('INVALID_EMAIL')) {
      //   errorMessage = 'INVALID_EMAIL ';
      // } else if (error.toString().contains('WEAK_PASSWORD')) {
      //   errorMessage = 'WEAK_PASSWORD';
      // } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
      //   errorMessage = 'EMAIL_NOT_FOUND';
      // } else if (error.toString().contains('INVALID_PASSWORD')) {
      //   errorMessage = 'INVALID_PASSWORD';
      // }
      // _showErrorDialog(errorMessage);
    }
  }

  Widget _submitButton(String type) {
    return InkWell(
      hoverColor: Colors.purple[900],
      onTap: () {
        setState(() {
          _isLoading = true;
          _submit(context, type);
        });
        if (type == 'tenet') {
          Navigator.of(context).pushNamed(TenetHome.id);
        } else {
          Navigator.of(context).pushNamed(BuildingsOverviewScreen.id);
        }
      },
      child: _isLoading
          ? CircularProgressIndicator()
          : Container(
              height: 50,
              width: MediaQuery.of(context).size.width * .45,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.yellow[600],
              ),
              child: Text(
                _authMode == AuthMode.Login ? 'Login' : 'Register',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
    );
  }

  Widget _createAccountLabel(String type) {
    if (_authMode == AuthMode.Login) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'New Here?',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                _switchAuthMode();
              },
              child: Text(
                'Register',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    } else if (_authMode == AuthMode.Signup) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Have an Account?',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                _switchAuthMode();
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  Widget _formWidget(String type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AnimatedContainer(
                    constraints: BoxConstraints(
                      minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                      maxHeight: _authMode == AuthMode.Signup ? 120 : 0,
                    ),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: _authMode == AuthMode.Signup
                        ? TextFormField(
                            decoration: InputDecoration(labelText: 'Full Name'),
                          )
                        : Container(),
                  ),
                  _authMode == AuthMode.Signup
                      ? TextFormField(
                          decoration: InputDecoration(labelText: 'UserName'),
                          keyboardType: TextInputType.name,
                          onSaved: (value) {},
                        )
                      : Container(),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _authData['email'] = value;
                      print(_authData['email']);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value;
                      print(_authData['password']);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // if (_isLoading) CircularProgressIndicator()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkboxorforgot(String type) {
    // String resetemail;
    if (_authMode == AuthMode.Login) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {},
          child: Text(
            'Forgot Password ?',
            style: TextStyle(
                color: Colors.purple,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final String type = ModalRoute.of(context).settings.arguments;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      ),
                      SizedBox(height: height * .075),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        alignment: Alignment.center,
                        child: _authMode == AuthMode.Login
                            ? Row(
                                children: [
                                  Container(
                                    color: Colors.yellow[600],
                                    height: 35,
                                    width: 8,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Login As ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    type,
                                    style: TextStyle(fontSize: 30),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Container(
                                    color: Colors.yellow[600],
                                    height: 35,
                                    width: 8,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Register As ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    type,
                                    style: TextStyle(fontSize: 30),
                                  )
                                ],
                              ),
                      ),
                      SizedBox(height: height * .015),
                      _formWidget(type),
                      SizedBox(height: height * .0015),
                      checkboxorforgot(type),
                      SizedBox(height: height * .04),
                      _submitButton(type),
                      _createAccountLabel(type),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              color: Colors.lightBlue,
                              onPressed: () {},
                              child: Container(
                                height: 45,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.g_translate,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Google',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blue[800],
                              onPressed: () {},
                              child: Container(
                                height: 45,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.face,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Facebook',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
