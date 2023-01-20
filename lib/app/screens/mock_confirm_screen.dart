import 'package:flutter/material.dart';
import 'package:mock_train_project/app/screens/landing_screen.dart';

class MockConfirmScreen extends StatelessWidget {
  const MockConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("This app will show only mock data",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            Text("This is done to hide the actual api calls",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            Text("Contact the app developer for the actual app",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            Text("Actual app shows live data",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingScreen(),));
      }, label: Text("Continue"),),
    );
  }
}
