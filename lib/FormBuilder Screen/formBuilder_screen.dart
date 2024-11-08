import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderExample extends StatefulWidget {
  @override
  _FormBuilderExampleState createState() => _FormBuilderExampleState();
}

class _FormBuilderExampleState extends State<FormBuilderExample> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FormBuilder Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "name",
                decoration: const InputDecoration(labelText: "Name"),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(3),
                ]),
              ),
              FormBuilderTextField(
                name: "email",
                decoration: const InputDecoration(labelText: "Email"),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              FormBuilderDateTimePicker(
                name: "date_of_birth",
                initialDate: DateTime.now(),
                fieldHintText: "Select Date of Birth",
                inputType: InputType.date,
                decoration: const InputDecoration(
                  labelText: "Date of Birth",
                ),
              ),
              FormBuilderCheckbox(
                name: "accept_terms",
                initialValue: false,
                title: const Text("I accept the terms and conditions"),
                validator: FormBuilderValidators.equal(
                  true,
                  errorText: "You must accept terms and conditions to continue",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    print(_formKey.currentState?.value); // Access form values
                  } else {
                    print("Validation failed");
                  }
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.reset(); // Reset form
                },
                child: const Text("Reset"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}