import 'package:flutter/material.dart';
import 'package:form_app/utils/validators.dart';
import 'package:form_app/widgets/drop_down_widget.dart';
import 'package:form_app/widgets/password_input_widget.dart';
import 'package:form_app/widgets/simple_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lasttNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderSelectionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Form Page'),
        backgroundColor: Colors.amberAccent,
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
          SimpleInputWidget(controller: firstNameController, hintText: 'Enter your name...', labelText: 'First Name', prefixIcon: Icons.person),
          SizedBox(height: 20,),
          SimpleInputWidget(controller: lasttNameController, hintText: 'Enter your last name...', labelText: 'Last Name', prefixIcon: Icons.person),
          SizedBox(height: 20,),
          SimpleInputWidget(controller: phoneNumberController, hintText: 'Enter your phone number...', labelText: 'Phone Number', prefixIcon: Icons.call, keyboardType: TextInputType.phone, validator: CustomValidators.bangladeshNumberValidator,),
          SizedBox(height: 20,),
          SimpleInputWidget(controller: bioController, hintText: 'Tell us about yourself...', labelText: 'Bio', prefixIcon: Icons.person_4, maxLines: 4,),    
          SizedBox(height: 20,),
          PasswordField(controller: passwordController, validator: CustomValidators.passwordValidator,),
          SizedBox(height: 20,),
          DropDownWidget(controller: genderSelectionController, labelText: 'Select Gender', items: ['Male', 'Female', 'Others'],),


          Spacer(),
          ElevatedButton(onPressed: (){
            formKey.currentState!.validate();


            if(formKey.currentState!.validate()){
              print('First Name: ${firstNameController.text}');
              print('Last Name: ${lasttNameController.text}');
              print('Phone Number: ${phoneNumberController.text}');
              print('Bio: ${bioController.text}');
              print('Password: ${passwordController.text}');
              
            }


          }, child: Text('Submit')),
          Spacer(),


            ],
          ),
        ),
      ),

    );
  }
}