import 'package:malik_newman_tech_task/models/Workout.dart';
import 'package:malik_newman_tech_task/models/WorkoutSet.dart';
import 'package:malik_newman_tech_task/models/WorkoutType.dart';
import 'package:test/test.dart';

void main() {
  group('WorkoutSets', () {
      test('returns correct WorkoutSet object', () {
        expect(
            WorkoutSet(workoutType: WorkoutType.Squat, weight: 3,repetitions: 99, workout: Workout(description: '', sets: [], name: '')),
          isA<WorkoutSet>()
              .having((w) => w.workoutType, 'workoutType', WorkoutType.Squat)
              .having((w) => w.weight, 'weight', 41.85003)
              .having((w) => w.repetitions, 'repetitions', -87.65005),
        );
      });
  });
}