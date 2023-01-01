import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputFieldEyePasswordExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextInputFieldEyePasswordExampleState();
  }
}

class TextInputFieldEyePasswordExampleState extends State<TextInputFieldEyePasswordExample> {
  bool _passwordVisible = true;
  final _text = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Text Input Field with eye button'),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _text,
            obscureText: !_passwordVisible, //This will obscure text dynamically
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              // Here is key idea
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
