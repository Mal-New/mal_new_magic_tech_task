
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malik_newman_tech_task/models/Workout.dart';
import 'package:malik_newman_tech_task/pages/workoutDraw.dart';

import '../blocs/dataStore/workout_cubit.dart';
import '../widgets/workout_card.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutCubit(),
      child: const WorkoutListView(),
    );
  }
}

class WorkoutListView extends StatefulWidget {
  const WorkoutListView({super.key});

  @override
  State<WorkoutListView> createState() => _WorkoutListViewState();
}

class _WorkoutListViewState extends State<WorkoutListView> {
  WorkoutCubit? _workoutCubit;

  @override
  void initState() {
    super.initState();
    _workoutCubit = BlocProvider.of<WorkoutCubit>(context);
    _workoutCubit?.getListItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout List'),

      ),
      body: Center(
        child: BlocConsumer<WorkoutCubit, WorkoutState>(
          bloc: _workoutCubit,
          listener: (context, WorkoutState workoutState) {
            if (workoutState is LoadingWorkoutList) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Loading Workouts")],
                    ),
                    backgroundColor: Colors.yellow,
                  ),
                );
            }
            else if (workoutState  is WorkoutListSuccess == true) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          },
          builder: (context, WorkoutState workoutState) {
            if(workoutState is WorkoutListSuccess == true) {
              List<Workout> workouts = workoutState.props.first as List<Workout>;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: workouts.length +1,
                  itemBuilder: (context, idx) {

                    if (idx == 0){
                      return Center(
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _workoutCubit!.createWorkout("New Workout","Edit this workout"),
                        ),
                      );
                    }
                    else{
                      Workout workout = workouts[idx -1];
                      return
                        Center(
                          child: Container(
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                WorkoutCard( workoutModel: workout),
                                IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => _workoutCubit!.deleteWorkout(workout),
                                )
                              ],
                            ),
                          ),
                        );
                    }
                  });
            }
            else if (workoutState is LoadingWorkoutList == true) {
            return Container();
            }
             else {
               return Container();
             }
          },
        ),
      ),
    );
  }
}

