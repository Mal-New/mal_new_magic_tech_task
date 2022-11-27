/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the WorkoutSet type in your schema. */
@immutable
class WorkoutSet extends Model {
  static const classType = const _WorkoutSetModelType();
  final String id;
  final Workout? _workout;
  final WorkoutType? _workoutType;
  final int? _weight;
  final int? _repetitions;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  WorkoutSetModelIdentifier get modelIdentifier {
      return WorkoutSetModelIdentifier(
        id: id
      );
  }
  
  Workout get workout {
    try {
      return _workout!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  WorkoutType get workoutType {
    try {
      return _workoutType!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get weight {
    try {
      return _weight!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get repetitions {
    try {
      return _repetitions!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const WorkoutSet._internal({required this.id, required workout, required workoutType, required weight, required repetitions, createdAt, updatedAt}): _workout = workout, _workoutType = workoutType, _weight = weight, _repetitions = repetitions, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory WorkoutSet({String? id, required Workout workout, required WorkoutType workoutType, required int weight, required int repetitions}) {
    return WorkoutSet._internal(
      id: id == null ? UUID.getUUID() : id,
      workout: workout,
      workoutType: workoutType,
      weight: weight,
      repetitions: repetitions);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkoutSet &&
      id == other.id &&
      _workout == other._workout &&
      _workoutType == other._workoutType &&
      _weight == other._weight &&
      _repetitions == other._repetitions;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("WorkoutSet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("workout=" + (_workout != null ? _workout!.toString() : "null") + ", ");
    buffer.write("workoutType=" + (_workoutType != null ? enumToString(_workoutType)! : "null") + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("repetitions=" + (_repetitions != null ? _repetitions!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  WorkoutSet copyWith({Workout? workout, WorkoutType? workoutType, int? weight, int? repetitions}) {
    return WorkoutSet._internal(
      id: id,
      workout: workout ?? this.workout,
      workoutType: workoutType ?? this.workoutType,
      weight: weight ?? this.weight,
      repetitions: repetitions ?? this.repetitions);
  }
  
  WorkoutSet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _workout = json['workout']?['serializedData'] != null
        ? Workout.fromJson(new Map<String, dynamic>.from(json['workout']['serializedData']))
        : null,
      _workoutType = enumFromString<WorkoutType>(json['workoutType'], WorkoutType.values),
      _weight = (json['weight'] as num?)?.toInt(),
      _repetitions = (json['repetitions'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'workout': _workout?.toJson(), 'workoutType': enumToString(_workoutType), 'weight': _weight, 'repetitions': _repetitions, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'workout': _workout, 'workoutType': _workoutType, 'weight': _weight, 'repetitions': _repetitions, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<WorkoutSetModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<WorkoutSetModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField WORKOUT = QueryField(
    fieldName: "workout",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Workout).toString()));
  static final QueryField WORKOUTTYPE = QueryField(fieldName: "workoutType");
  static final QueryField WEIGHT = QueryField(fieldName: "weight");
  static final QueryField REPETITIONS = QueryField(fieldName: "repetitions");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "WorkoutSet";
    modelSchemaDefinition.pluralName = "WorkoutSets";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: WorkoutSet.WORKOUT,
      isRequired: true,
      targetNames: ["workoutSetsId"],
      ofModelName: (Workout).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: WorkoutSet.WORKOUTTYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: WorkoutSet.WEIGHT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: WorkoutSet.REPETITIONS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _WorkoutSetModelType extends ModelType<WorkoutSet> {
  const _WorkoutSetModelType();
  
  @override
  WorkoutSet fromJson(Map<String, dynamic> jsonData) {
    return WorkoutSet.fromJson(jsonData);
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [WorkoutSet] in your schema.
 */
@immutable
class WorkoutSetModelIdentifier implements ModelIdentifier<WorkoutSet> {
  final String id;

  /** Create an instance of WorkoutSetModelIdentifier using [id] the primary key. */
  const WorkoutSetModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'WorkoutSetModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is WorkoutSetModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}