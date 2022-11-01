import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal
    ),
    home: new HomePage()
  ));

class HomePage extends StatefulWidget {
 @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
 // int _currentstep = 0;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utils App"),
        /*bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Icon(Icons.favorite),),
            Tab(icon: Icon(Icons.email))
          ]),*/
      ),
     body: TabBarView(children: [
       NewPage("FIRST"),
       NewPage("SECOND"),
     ],
         controller: tabController,
     ),
     bottomNavigationBar: Material(
       color: Colors.teal,
       child: TabBar(
           controller: tabController,
           tabs: [
         Tab(icon: Icon(Icons.favorite),),
         Tab(icon: Icon(Icons.email))
       ])
     ),
     // body: MyBody()
      /*body: Container(
        child: Stepper(
          steps: [
            Step(title: Text("Step One"),
                content: Text("HIIII"),
            isActive: true),
            Step(title: Text("Step Two"),
                content: Text("HIIII"),
                isActive: true),
            Step(title: Text("Step Three"),
                content: Text("HIIII"),
                isActive: true)
          ],
        currentStep: this._currentstep,
          type: StepperType.vertical
        ),
      ),*/
      floatingActionButton: FloatingActionButton(onPressed: ()=> print("PRESSED"),
      child: Icon(Icons.add),),
      );
  }
}

/*class MyBody extends StatelessWidget {
  AlertDialog dialog = AlertDialog(
      content: Text("Dialog is UP",style: TextStyle(fontSize: 30),),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: ElevatedButton(
            child: Text("click me",style: TextStyle(color: Colors.black),),
          //  onPressed: ()=> ScaffoldMessenger.of(context).showSnackBar(
          //      SnackBar(content: Text("IM PRESSED"),
          //          duration: Duration(seconds: 1)
          //      )
            onPressed: ()=> showDialog(context: context,
                builder: (ctx) => AlertDialog(
                  content: Text("Dialog is UP",style: TextStyle(fontSize: 10.0),),
                  title: Text("Hello"),
                )
            ),
          ),
        )
    );
  }
}*/

class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
