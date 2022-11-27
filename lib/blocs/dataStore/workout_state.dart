part of 'workout_cubit.dart';

abstract class WorkoutState extends Equatable{
  const WorkoutState();
}

class LoadingWorkoutList extends WorkoutState {

  @override
  List<Object> get props => [];
}

class WorkoutListSuccess extends WorkoutState {
  final  List<Workout> listItems;
  const WorkoutListSuccess(this.listItems);
  @override
  List<Object> get props => [listItems];
}