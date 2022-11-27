import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malik_newman_tech_task/blocs/dataStore/workout_cubit.dart';
import 'package:malik_newman_tech_task/models/Workout.dart';
import 'package:malik_newman_tech_task/models/WorkoutType.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key, required this.workoutModel}) : super(key: key);
  final Workout workoutModel;

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  WorkoutCubit? _workoutCubit;

  @override
  void initState() {
    super.initState();
    _workoutCubit = BlocProvider.of<WorkoutCubit>(context);

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutCubit, WorkoutState>(
      bloc: _workoutCubit,
      listener: (BuildContext context, WorkoutState workoutState) {
        if (workoutState is WorkoutListSuccess == true) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } else if (workoutState is LoadingWorkoutList) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("Loading Workouts")],
                ),
                backgroundColor: Colors.yellow,
              ),
            );
        }
      },
      builder: (context, WorkoutState workoutState) {
        if (workoutState is WorkoutListSuccess == true) {
          return Container();
        }
        else {
          return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.workoutModel.sets.length +2,
                itemBuilder: (context, idx) {

                  if (idx == 0){
                    return Card(
                        child:  SizedBox(
                        width: 300,
                        height: 100,
                        child:
                        ListView(
                            children: [
                        Hero(
                        tag: widget.workoutModel.id,
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly],
                              onChanged: (text) => _workoutCubit!.updateWorkoutDetails(widget.workoutModel,  text,widget.workoutModel.description,),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: widget.workoutModel.description,
                              ),
                            ),
                        ),
                              TextField(
                                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly],
                                onChanged: (text) => _workoutCubit!.updateWorkoutDetails(widget.workoutModel, widget.workoutModel.name, text),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: widget.workoutModel.description,
                                ),
                              ),
                            ]
                        )
                        )
                    );

                  }
                  else if (idx == widget.workoutModel.sets.length +2){
                    return Center(
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => _workoutCubit!.createWorkoutSet(widget.workoutModel,WorkoutType.Squat,10,10),
                      ),
                    );
                  }
                  else{
                    var workoutSet = widget.workoutModel.sets[idx -1];
                    return
                      Center(
                        child: Card(
                            child:  SizedBox(
                                width: 300,
                                height: 100,
                                child:
                                ListView(
                                  children: [
                                    Row(
                                        children: [
                                          const Text("Workout Type:"),
                                DropdownButton<WorkoutType>(
                                    value: workoutSet.workoutType,
                                    onChanged: (WorkoutType? newValue) => _workoutCubit!.updateWorkoutSet(widget.workoutModel, workoutSet, newValue!, workoutSet.weight, workoutSet.repetitions),
                                    items: WorkoutType.values.map((WorkoutType classType) {
                                      return DropdownMenuItem<WorkoutType>(
                                          value: classType,
                                          child: Text(classType.toString()));
                                    }).toList()
                                )
                                        ]
                                    ),
                                    Row(
                                        children: [
                                          const Text("Repetitions:"),
                                          TextField(
                                            inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly],
                                            onChanged: (text) => _workoutCubit!.updateWorkoutSet(widget.workoutModel, workoutSet, workoutSet.workoutType,workoutSet.weight ,int.parse(text)),
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(),
                                              labelText: workoutSet.weight.toString(),
                                            ),
                                          ),
                                        ]
                                    ),
                                    Row(
                                      children: [
                                        const Text("Weight:"),
                                        TextField(
                                          inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly],
                                          onChanged: (text) => _workoutCubit!.updateWorkoutSet(widget.workoutModel, workoutSet, workoutSet.workoutType, int.parse(text), workoutSet.repetitions),
                                          decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                          labelText: workoutSet.weight.toString(),
                                        ),
                                        ),
                                      ]
                                    ),
                                  ],
                                )
                        ),
                      ),
                    );
                      // Material(
                      //   color: Colors.transparent,
                      //   child: Text(node["name"],
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 34.w,
                      //           fontWeight: FontWeight.bold)),
                      // ),

                  }
                });
        }
      },
    )
    ;
  }

  void onStartButtonPressed() {}

  void onBackIconTapped() {

  }

  void onHeartIconTapped() {}
}