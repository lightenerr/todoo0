import 'package:flutter/material.dart';
import 'Home.dart';
// import '';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final pass = TextEditingController();
    final userController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
             Image(
              image: AssetImage('Assets/Login.jpg'), colorBlendMode: BlendMode.colorBurn,
              width: 150.0,
              height: 150.0,
              // color: Colors.blueAccent,
            ),
            TextFormField( controller: userController,
              decoration: InputDecoration(
                label: Text('Username'),
                icon: Icon(Icons.account_circle_rounded),
              ),
            ),
            TextFormField( controller: pass, obscuringCharacter: '*',   obscureText: true,
              decoration: InputDecoration(
                label: Text('Password'),
                icon: Icon(Icons.account_box_outlined),
              ),
            ),
            ElevatedButton.icon(
              label: Text("Home"),
              icon: Icon(Icons.home),
              onPressed: () {
                print(pass);
                (pass.text == "123" && userController.text == "541" )
                    ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Tabs();
                    },
                  ),
                )
                    : showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Incorrect password!"),
                    content: const Text("Enter password again"), ), );
              },
            ),
          ],
        ),
      ),
    );
  }

}


