import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_cash_money/api/api_manger.dart';
import 'package:tap_cash_money/shard/base_navigator.dart';
import 'package:tap_cash_money/shard/base_veiw.dart';
import 'package:tap_cash_money/ui/register_screen/register_navigator.dart';
import 'package:tap_cash_money/ui/register_screen/register_view_model.dart';

import '../../custom_widgets/customButtom.dart';
import '../../custom_widgets/customForm.dart';
import '../../custom_widgets/dialog_utils.dart';
import '../home/home_screen.dart';
import '../login_screen/login_navigator.dart';
import '../tapCashMian/tapCashMain.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseView<RegisterScreen,RegisterViewModel> implements RegisterNavigator{
  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nIDController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  final List<String> genderItems = [
    'male',
    'female',
  ];

  String? selectedValue;

  RegisterViewModel viewModel=RegisterViewModel();
  GlobalKey<FormState> formKey = GlobalKey();
@override
  void initState() {


  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(children: [
        Image.asset(
          "assets/images/backGround.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, TapCashMain.routName);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Center(
                  child: Text(
                    'CREATE ACCOUNT  ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        customForm(
                          'Name',
                          Icon(Icons.person_pin_circle_outlined,
                              color: Colors.black),
                          'Enter your name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter name';
                            }
                            final bool nameVaild = RegExp(
                                    " [a-zA-Z0-9]([a-zA-Z0-9](_|-| )[a-zA-Z0-9])[a-zA-Z0-9]")
                                .hasMatch(value!);
                            return null;
                          },
                          controller: nameController,
                        ),
                        customForm(
                          keyboard: TextInputType.emailAddress,
                          controller: addressController,
                          'Address',
                          Icon(Icons.pin_drop, color: Colors.black),
                          'Enter your address',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter address';
                            }
                          },
                        ),
                        customForm(
                          'Phone Number',
                          Icon(Icons.phone, color: Colors.black),
                          'Enter your number',
                          keyboard: TextInputType.phone,
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter phone number';
                            }
                          },
                        ),
                        customForm(
                          controller: ageController,
                          'Age',
                          Icon(Icons.view_agenda, color: Colors.black),
                          'Enter your age',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter your age number';
                            }
                          },
                        ),
                        customForm(
                          'National ID',
                          Icon(Icons.format_list_numbered, color: Colors.black),
                          'Enter your National ID',
                          keyboard: TextInputType.phone,
                          controller: nIDController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter National ID';
                            }
                          },
                        ),
                        customForm(
                            controller: passwordController,
                            'Password',
                            Icon(
                              Icons.lock_outline,
                              color: Colors.black,
                            ),
                            keyboard: TextInputType.visiblePassword,
                            'Enter your password',
                            obscure: true, validator: (pass) {
                          if (pass?.trim() == ' ') {
                            return "Enter password";
                          }
                          if (pass?.trim() == "") {
                            return "Please enter password";
                          }
                          final bool passVaild = RegExp(
                                  "({(?=.*[a-z])(?=.*[A-Z]).{8,}}|{(?=.*[A-Z])(?!.*\\s).{8,}})")
                              .hasMatch(pass!);
                          return null;
                        }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        DropdownButtonFormField2(
                          decoration: InputDecoration(
                              //Add isDense true and zero Padding.
                              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          isExpanded: true,
                          hint: const Text(
                            'Select Your Gender',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: genderItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                            height: 60,
                            padding: EdgeInsets.only(left: 20, right: 10),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        InkWell(
                          child: CustomButtom('CREATE ACCOUNT'),
                          onTap: () {
                          // ValidateForm();
                           Navigator.pushReplacementNamed(context, HomeScreen.routName);

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void ValidateForm() async {
    if (formKey.currentState!.validate() == false) {
      return;
    }

  }

@override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();
  }
  @override
  void goHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routName);
  }
}
