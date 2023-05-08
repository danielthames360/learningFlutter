import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'firstName': 'Daniel',
      'last_name': 'Tames',
      'email': 'daniel@gmail.com',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text('Inputs & Forms'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Form(
              key: myFormKey,
              child: Column(children: [
                CustomInputField(
                  labelText: 'Name',
                  hintText: 'User Name',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInputField(
                  labelText: 'Last Name',
                  hintText: 'User Last Name',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'User Email',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'User password',
                  passwordText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                    value: 'Admin',
                    items: const [
                      DropdownMenuItem(
                        value: 'Admin',
                        child: Text('Admin'),
                      ),
                      DropdownMenuItem(
                        value: 'SuperUser',
                        child: Text('SuperUser'),
                      ),
                      DropdownMenuItem(
                        value: 'Developer',
                        child: Text('Developer'),
                      ),
                      DropdownMenuItem(
                        value: 'Jr. Developer',
                        child: Text('Jr. Developer'),
                      ),
                    ],
                    onChanged: (value) {
                      formValues['role'] = value ?? 'Admin';
                    }),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      if (!myFormKey.currentState!.validate()) {
                        return;
                      }
                      print(formValues);
                    },
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Save'))))
              ]),
            ),
          ),
        ));
  }
}
