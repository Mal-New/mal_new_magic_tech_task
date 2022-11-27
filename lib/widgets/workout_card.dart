import 'package:flutter/material.dart';
import 'package:malik_newman_tech_task/models/Workout.dart';
import 'package:malik_newman_tech_task/pages/workoutDraw.dart';

class WorkoutCard extends StatelessWidget {

  const WorkoutCard({super.key , required this.workoutModel});
  final Workout workoutModel;

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body:  Center(
          child: WorkoutPage(workoutModel: workoutModel),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => _gotoDetailsPage,
          child: SizedBox(
            width: 300,
            height: 50,
            child: ListView(
            children:[
              Row(
                children: [
                  Hero(
                      tag: workoutModel.id,
                      child:
                      Text(workoutModel.name)
                  ),


                ],
              )
            ]  
            )
          ),
        ),
      ),
    );
  }
}


