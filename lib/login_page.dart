import 'package:animated_container/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class  LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  var nameController=TextEditingController();
  var passController=TextEditingController();
   String keyName="";
   String  keyPass="";
  var  nameValve="no name value  ";
  var passValue="no pass value ";

  @override
void initState() {
    getValue();
    super.initState();
  }
 void getValue() async {
    var prefs=await SharedPreferences.getInstance();
    var names =prefs.getString(keyName);
    var passes=prefs.getString(keyPass);


     setState(() {
       nameValve=names ?? " no name value";
       passValue=passes ?? "no pass value ";

     });


}


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:nameController ,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Enter name'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(21))
                ),
              ),
            ),
            SizedBox(height: 50,),
            TextField(
              controller:passController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('password'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)),

              ),

            ),
            SizedBox(height: 60,),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(300, 50)
                ),
                onPressed: () async {

                  var prefs=await SharedPreferences.getInstance();
                  prefs.setString(keyName, nameController.text.toString());
                  prefs.setString(keyPass, passController.text.toString());
                  prefs.setBool(SplashScreenState.KEYLOGIN, true);
                  

                }, child: Text('Save data')),


          ],
        ),
      ),
    );
  }
}
