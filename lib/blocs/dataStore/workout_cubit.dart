import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:malik_newman_tech_task/repository/workoutRepository.dart';

import '../../models/Workout.dart';
import '../../models/WorkoutSet.dart';
import '../../models/WorkoutType.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final _workoutRepo = WorkoutRepository();
  WorkoutCubit() : super(LoadingWorkoutList());

  void getListItems() async {
    if (state is WorkoutListSuccess == false) {
      emit(LoadingWorkoutList());
    }

    try {
      final items = await _workoutRepo.getWorkoutList();
      emit(WorkoutListSuccess(items));
    } catch (e) {
      rethrow;
    }
  }

  void createWorkout(String workoutName,String workoutDescription) async {
    await _workoutRepo.createWorkout(workoutName,workoutDescription);
    getListItems();
  }

  void createWorkoutSet(Workout workout, WorkoutType type,int weightNo,int repetitionsNo) async {
    await _workoutRepo.createWorkoutSet( workout, type, weightNo, repetitionsNo);
    getListItems();
  }
  void updateWorkoutSet(Workout workout,WorkoutSet workoutSet, WorkoutType type,int weightNo,int repetitionsNo) async {
    await _workoutRepo.updateWorkoutSet(  workout, workoutSet,  type, weightNo, repetitionsNo);
    getListItems();
  }
  void updateWorkoutDetails(Workout workout, String workoutName,String workoutDescription) async {
    await _workoutRepo.updateWorkoutDetails( workout,  workoutName, workoutDescription);
    getListItems();
  }
  void deleteWorkoutSet(Workout workout,WorkoutSet workoutSet) async {
    await _workoutRepo.deleteWorkoutSet( workout, workoutSet);
    getListItems();
  }
  void deleteWorkout(Workout workout) async {
    await _workoutRepo.deleteWorkout( workout);
    getListItems();
  }

  void observeItems() {
    final itemStream = _workoutRepo.observeTodos();
    itemStream.listen((_) => getListItems());
  }
}
