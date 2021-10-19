import 'package:city_guide/models/user_model.dart';
import 'package:city_guide/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  // form Keys
  final _formKey = GlobalKey<FormState>();
  //Editting Controller
  final firstNameEdittingController = TextEditingController();
  final secondNameEdittingController = TextEditingController();
  final emailEdittingController = TextEditingController();
  final passwordEdittingController = TextEditingController();
  final confimPasswordEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name Field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEdittingController,
      keyboardType: TextInputType.emailAddress,
      //validation
      validator: (value){
          RegExp regExp = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return("First Name Cant be Empty");
          }
          if (!regExp.hasMatch(value)) {
            return("Enter valid name (Min 3 character) ");
          }
      },
      onSaved: (value) {
        firstNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          )),
    );
    // Second Name Field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEdittingController,
      keyboardType: TextInputType.emailAddress,
      //validator: (){},
      validator: (value){
        //RegExp regExp = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return("Second Name Cant be Empty");
        }
        return null;
        // if (!regExp.hasMatch(value)) {
        //   return("Enter valid name (Min 3 character) ");
        // }
      },
      onSaved: (value) {
        secondNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          )),
    );
    //email Field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEdittingController,
      keyboardType: TextInputType.emailAddress,
      //validator: (){},
      validator: (value){
        if (value!.isEmpty){
          return("Please Enter your Email");
        }
        //regular expression for Email
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
        {
          return("Please enter a valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          )),
    );
    //Password Field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordEdittingController,
      //keyboardType: TextInputType.emailAddress,
      //validator: (){},
      validator: (value){
        RegExp regExp = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return("Please Enter Password");
        }
        if (!regExp.hasMatch(value)) {
          return("Enter valid Password (Min 6 character) ");
        }
      },
      onSaved: (value) {
        passwordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          )),
    );
    //Confirm Password Field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confimPasswordEdittingController,
      //keyboardType: TextInputType.emailAddress,
      //validator: (){},
      validator: (value){
        if (confimPasswordEdittingController.text!=passwordEdittingController.text) {
          return "Password not Match";
        }
        return null;
      },
      onSaved: (value) {
        confimPasswordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confim Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          )),
    );
    //Sign up Button
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightGreen,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEdittingController.text, passwordEdittingController.text);

        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(

      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.lightGreen,), onPressed: () {
          Navigator.of(context).pop();
        },),
      ),

      body: Center(

        child: SingleChildScrollView(
          child: Container(
            color: Colors.cyanAccent,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    firstNameField,
                    SizedBox(
                      height: 10,
                    ),
                    secondNameField,
                    SizedBox(
                      height: 8,
                    ),
                    emailField,
                    SizedBox(
                      height: 8,
                    ),
                    passwordField,
                    SizedBox(
                      height: 8,
                    ),
                    confirmPasswordField,
                    SizedBox(
                      height: 8,
                    ),
                    signupButton,
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  //
  void signUp(String email, String password)async {
    if (_formKey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {postDetailsToFirestore()})
        .catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });
    }  
  }
  postDetailsToFirestore()async{
    //call Firestore, then call user_model sending the values to Firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    //writting values to datastore
    userModel.email= user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEdittingController.text;
    userModel.secondName = secondNameEdittingController.text;

    await firebaseFirestore
    .collection("userd").doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: "account Created Successfully");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (Context)=>HomeScreen()), (route) => false);
    
  }
}
