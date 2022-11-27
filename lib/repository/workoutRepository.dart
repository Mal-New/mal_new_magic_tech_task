
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:malik_newman_tech_task/models/Workout.dart';
import 'package:malik_newman_tech_task/models/WorkoutSet.dart';
import 'package:malik_newman_tech_task/models/WorkoutType.dart';

class WorkoutRepository {
  Future<List<Workout>> getWorkoutList() async {
    List<Workout> items = new List.empty();
    try {
      items = await Amplify.DataStore.query(Workout.classType);
    } catch (e) {
      print("Could not query DataStore: ");
    }
    return items;
  }

  Future<void> createWorkout(String workoutName,String workoutDescription) async {
    final item = Workout(name: workoutName, description: workoutDescription, sets: List.empty());
    try {
      await Amplify.DataStore.save(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateWorkoutDetails(Workout workout, String workoutName,String workoutDescription) async {
    final item = workout.copyWith( name: workoutName, description: workoutDescription );
    try {
      await Amplify.DataStore.save(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createWorkoutSet(Workout workout, WorkoutType type,int weightNo,int repetitionsNo) async {
    final newSet = WorkoutSet(workoutType: type, weight: weightNo,repetitions: repetitionsNo, workout: workout);
    workout.sets.add(newSet);
    final newWorkout = workout.copyWith(sets: workout.sets);
    try {
      await Amplify.DataStore.save(newSet);
      await Amplify.DataStore.save(newWorkout);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateWorkoutSet(Workout workout,WorkoutSet workoutSet, WorkoutType type,int weightNo,int repetitionsNo) async {
    workout.sets.remove(workoutSet);
    final newSet = workoutSet.copyWith( workoutType: type, weight: weightNo,repetitions: repetitionsNo);
    workout.sets.add(newSet);
    final newWorkout = workout.copyWith(sets: workout.sets);
    try {
      await Amplify.DataStore.save(newSet);
      await Amplify.DataStore.save(newWorkout);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteWorkoutSet(Workout workout,WorkoutSet workoutSet) async {
    workout.sets.remove(workoutSet);
    final newWorkout = workout.copyWith(sets: workout.sets);
    try {
      await Amplify.DataStore.delete(workoutSet);
      await Amplify.DataStore.save(newWorkout);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteWorkout(Workout workout) async {
    final item = workout;
    try {
      await Amplify.DataStore.delete(item);
    } catch (e) {
      rethrow;
    }
  }

  Stream observeTodos() {
    return Amplify.DataStore.observe(Workout.classType);
  }
}