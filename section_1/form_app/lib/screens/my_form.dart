import 'package:flutter/material.dart';
import 'package:form_app/util/validators.dart';
import 'package:form_app/widgets/drop_down_widgets.dart';
import 'package:form_app/widgets/password_input_widget.dart';
import 'package:form_app/widgets/simple_text_input_widget.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  // Local var declier
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final bioController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
      ),


      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SimpleTextInputWidget(controller: firstNameController, lable: 'First Name', validate: Validators.emailValidation,),
              SizedBox(height: 10,),
              SimpleTextInputWidget(controller: lastNameController, lable: 'Last Name'),
              SizedBox(height: 10,),
              SimpleTextInputWidget(controller: phoneNumberController, lable: 'Phone Number', textInputType: TextInputType.number,),
              
              SizedBox(height: 10,),
              SimpleTextInputWidget(controller: bioController, lable: 'Bio', maxLines: 3,),
              SizedBox(height: 10,),
              PasswordField(controller: passwordController),
              SizedBox(height: 10,),
              DropDownWidgets(controller: genderController, items: ['Male','Female','Other'], lable: 'Gender'),
          

              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black
                ),
                onPressed: (){
                  formKey.currentState!.validate();
                },
               child: Text('Validate Form')),
               SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}