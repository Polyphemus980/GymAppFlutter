// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WorkoutPlansTable extends WorkoutPlans
    with TableInfo<$WorkoutPlansTable, WorkoutPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _numWeeksMeta =
      const VerificationMeta('numWeeks');
  @override
  late final GeneratedColumn<int> numWeeks = GeneratedColumn<int>(
      'num_weeks', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _daysPerWeekMeta =
      const VerificationMeta('daysPerWeek');
  @override
  late final GeneratedColumn<int> daysPerWeek = GeneratedColumn<int>(
      'days_per_week', aliasedName, false,
      check: () => ComparableExpr(daysPerWeek).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        description,
        name,
        numWeeks,
        daysPerWeek,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_plans';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutPlan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('num_weeks')) {
      context.handle(_numWeeksMeta,
          numWeeks.isAcceptableOrUnknown(data['num_weeks']!, _numWeeksMeta));
    } else if (isInserting) {
      context.missing(_numWeeksMeta);
    }
    if (data.containsKey('days_per_week')) {
      context.handle(
          _daysPerWeekMeta,
          daysPerWeek.isAcceptableOrUnknown(
              data['days_per_week']!, _daysPerWeekMeta));
    } else if (isInserting) {
      context.missing(_daysPerWeekMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WorkoutPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlan(
      numWeeks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num_weeks'])!,
      daysPerWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}days_per_week'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $WorkoutPlansTable createAlias(String alias) {
    return $WorkoutPlansTable(attachedDatabase, alias);
  }
}

class WorkoutPlansCompanion extends UpdateCompanion<WorkoutPlan> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> description;
  final Value<String> name;
  final Value<int> numWeeks;
  final Value<int> daysPerWeek;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const WorkoutPlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.description = const Value.absent(),
    this.name = const Value.absent(),
    this.numWeeks = const Value.absent(),
    this.daysPerWeek = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutPlansCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String description,
    required String name,
    required int numWeeks,
    required int daysPerWeek,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        description = Value(description),
        name = Value(name),
        numWeeks = Value(numWeeks),
        daysPerWeek = Value(daysPerWeek);
  static Insertable<WorkoutPlan> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? description,
    Expression<String>? name,
    Expression<int>? numWeeks,
    Expression<int>? daysPerWeek,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (numWeeks != null) 'num_weeks': numWeeks,
      if (daysPerWeek != null) 'days_per_week': daysPerWeek,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutPlansCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? description,
      Value<String>? name,
      Value<int>? numWeeks,
      Value<int>? daysPerWeek,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return WorkoutPlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      description: description ?? this.description,
      name: name ?? this.name,
      numWeeks: numWeeks ?? this.numWeeks,
      daysPerWeek: daysPerWeek ?? this.daysPerWeek,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (numWeeks.present) {
      map['num_weeks'] = Variable<int>(numWeeks.value);
    }
    if (daysPerWeek.present) {
      map['days_per_week'] = Variable<int>(daysPerWeek.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('description: $description, ')
          ..write('name: $name, ')
          ..write('numWeeks: $numWeeks, ')
          ..write('daysPerWeek: $daysPerWeek, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlannedWorkoutsTable extends PlannedWorkouts
    with TableInfo<$PlannedWorkoutsTable, PlannedWorkout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlannedWorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutPlanIdMeta =
      const VerificationMeta('workoutPlanId');
  @override
  late final GeneratedColumn<String> workoutPlanId = GeneratedColumn<String>(
      'workout_plan_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout_plans (id)'));
  static const VerificationMeta _workoutNameMeta =
      const VerificationMeta('workoutName');
  @override
  late final GeneratedColumn<String> workoutName = GeneratedColumn<String>(
      'workout_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dayNumberMeta =
      const VerificationMeta('dayNumber');
  @override
  late final GeneratedColumn<int> dayNumber = GeneratedColumn<int>(
      'day_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weekNumberMeta =
      const VerificationMeta('weekNumber');
  @override
  late final GeneratedColumn<int> weekNumber = GeneratedColumn<int>(
      'week_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        workoutPlanId,
        workoutName,
        dayNumber,
        weekNumber,
        description,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'planned_workouts';
  @override
  VerificationContext validateIntegrity(Insertable<PlannedWorkout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_plan_id')) {
      context.handle(
          _workoutPlanIdMeta,
          workoutPlanId.isAcceptableOrUnknown(
              data['workout_plan_id']!, _workoutPlanIdMeta));
    } else if (isInserting) {
      context.missing(_workoutPlanIdMeta);
    }
    if (data.containsKey('workout_name')) {
      context.handle(
          _workoutNameMeta,
          workoutName.isAcceptableOrUnknown(
              data['workout_name']!, _workoutNameMeta));
    }
    if (data.containsKey('day_number')) {
      context.handle(_dayNumberMeta,
          dayNumber.isAcceptableOrUnknown(data['day_number']!, _dayNumberMeta));
    } else if (isInserting) {
      context.missing(_dayNumberMeta);
    }
    if (data.containsKey('week_number')) {
      context.handle(
          _weekNumberMeta,
          weekNumber.isAcceptableOrUnknown(
              data['week_number']!, _weekNumberMeta));
    } else if (isInserting) {
      context.missing(_weekNumberMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PlannedWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannedWorkout(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workoutPlanId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_plan_id'])!,
      workoutName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_name']),
      dayNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_number'])!,
      weekNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}week_number'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $PlannedWorkoutsTable createAlias(String alias) {
    return $PlannedWorkoutsTable(attachedDatabase, alias);
  }
}

class PlannedWorkoutsCompanion extends UpdateCompanion<PlannedWorkout> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> workoutPlanId;
  final Value<String?> workoutName;
  final Value<int> dayNumber;
  final Value<int> weekNumber;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const PlannedWorkoutsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.workoutPlanId = const Value.absent(),
    this.workoutName = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.weekNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannedWorkoutsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String workoutPlanId,
    this.workoutName = const Value.absent(),
    required int dayNumber,
    required int weekNumber,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        workoutPlanId = Value(workoutPlanId),
        dayNumber = Value(dayNumber),
        weekNumber = Value(weekNumber);
  static Insertable<PlannedWorkout> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? workoutPlanId,
    Expression<String>? workoutName,
    Expression<int>? dayNumber,
    Expression<int>? weekNumber,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (workoutPlanId != null) 'workout_plan_id': workoutPlanId,
      if (workoutName != null) 'workout_name': workoutName,
      if (dayNumber != null) 'day_number': dayNumber,
      if (weekNumber != null) 'week_number': weekNumber,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannedWorkoutsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? workoutPlanId,
      Value<String?>? workoutName,
      Value<int>? dayNumber,
      Value<int>? weekNumber,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return PlannedWorkoutsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      workoutName: workoutName ?? this.workoutName,
      dayNumber: dayNumber ?? this.dayNumber,
      weekNumber: weekNumber ?? this.weekNumber,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutPlanId.present) {
      map['workout_plan_id'] = Variable<String>(workoutPlanId.value);
    }
    if (workoutName.present) {
      map['workout_name'] = Variable<String>(workoutName.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (weekNumber.present) {
      map['week_number'] = Variable<int>(weekNumber.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannedWorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('workoutName: $workoutName, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('weekNumber: $weekNumber, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CompletedWorkoutsTable extends CompletedWorkouts
    with TableInfo<$CompletedWorkoutsTable, CompletedWorkout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompletedWorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _plannedWorkoutIdMeta =
      const VerificationMeta('plannedWorkoutId');
  @override
  late final GeneratedColumn<String> plannedWorkoutId = GeneratedColumn<String>(
      'planned_workout_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES planned_workouts (id)'));
  static const VerificationMeta _workoutNameMeta =
      const VerificationMeta('workoutName');
  @override
  late final GeneratedColumn<String> workoutName = GeneratedColumn<String>(
      'workout_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _workoutDateMeta =
      const VerificationMeta('workoutDate');
  @override
  late final GeneratedColumn<DateTime> workoutDate = GeneratedColumn<DateTime>(
      'workout_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _totalDurationMeta =
      const VerificationMeta('totalDuration');
  @override
  late final GeneratedColumn<int> totalDuration = GeneratedColumn<int>(
      'total_duration', aliasedName, true,
      check: () => ComparableExpr(totalDuration).isBiggerThanValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        plannedWorkoutId,
        workoutName,
        workoutDate,
        startTime,
        endTime,
        totalDuration,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'completed_workouts';
  @override
  VerificationContext validateIntegrity(Insertable<CompletedWorkout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('planned_workout_id')) {
      context.handle(
          _plannedWorkoutIdMeta,
          plannedWorkoutId.isAcceptableOrUnknown(
              data['planned_workout_id']!, _plannedWorkoutIdMeta));
    }
    if (data.containsKey('workout_name')) {
      context.handle(
          _workoutNameMeta,
          workoutName.isAcceptableOrUnknown(
              data['workout_name']!, _workoutNameMeta));
    }
    if (data.containsKey('workout_date')) {
      context.handle(
          _workoutDateMeta,
          workoutDate.isAcceptableOrUnknown(
              data['workout_date']!, _workoutDateMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('total_duration')) {
      context.handle(
          _totalDurationMeta,
          totalDuration.isAcceptableOrUnknown(
              data['total_duration']!, _totalDurationMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CompletedWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletedWorkout(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      plannedWorkoutId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}planned_workout_id']),
      workoutName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_name']),
      workoutDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}workout_date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      totalDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_duration']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $CompletedWorkoutsTable createAlias(String alias) {
    return $CompletedWorkoutsTable(attachedDatabase, alias);
  }
}

class CompletedWorkoutsCompanion extends UpdateCompanion<CompletedWorkout> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> plannedWorkoutId;
  final Value<String?> workoutName;
  final Value<DateTime> workoutDate;
  final Value<DateTime?> startTime;
  final Value<DateTime?> endTime;
  final Value<int?> totalDuration;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const CompletedWorkoutsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.plannedWorkoutId = const Value.absent(),
    this.workoutName = const Value.absent(),
    this.workoutDate = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.totalDuration = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletedWorkoutsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    this.plannedWorkoutId = const Value.absent(),
    this.workoutName = const Value.absent(),
    this.workoutDate = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.totalDuration = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<CompletedWorkout> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? plannedWorkoutId,
    Expression<String>? workoutName,
    Expression<DateTime>? workoutDate,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? totalDuration,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (plannedWorkoutId != null) 'planned_workout_id': plannedWorkoutId,
      if (workoutName != null) 'workout_name': workoutName,
      if (workoutDate != null) 'workout_date': workoutDate,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (totalDuration != null) 'total_duration': totalDuration,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletedWorkoutsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String?>? plannedWorkoutId,
      Value<String?>? workoutName,
      Value<DateTime>? workoutDate,
      Value<DateTime?>? startTime,
      Value<DateTime?>? endTime,
      Value<int?>? totalDuration,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return CompletedWorkoutsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      plannedWorkoutId: plannedWorkoutId ?? this.plannedWorkoutId,
      workoutName: workoutName ?? this.workoutName,
      workoutDate: workoutDate ?? this.workoutDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalDuration: totalDuration ?? this.totalDuration,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (plannedWorkoutId.present) {
      map['planned_workout_id'] = Variable<String>(plannedWorkoutId.value);
    }
    if (workoutName.present) {
      map['workout_name'] = Variable<String>(workoutName.value);
    }
    if (workoutDate.present) {
      map['workout_date'] = Variable<DateTime>(workoutDate.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (totalDuration.present) {
      map['total_duration'] = Variable<int>(totalDuration.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletedWorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('plannedWorkoutId: $plannedWorkoutId, ')
          ..write('workoutName: $workoutName, ')
          ..write('workoutDate: $workoutDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('totalDuration: $totalDuration, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startPositionImagePathMeta =
      const VerificationMeta('startPositionImagePath');
  @override
  late final GeneratedColumn<String> startPositionImagePath =
      GeneratedColumn<String>('start_position_image_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _endPositionImagePathMeta =
      const VerificationMeta('endPositionImagePath');
  @override
  late final GeneratedColumn<String> endPositionImagePath =
      GeneratedColumn<String>('end_position_image_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        startPositionImagePath,
        endPositionImagePath,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('start_position_image_path')) {
      context.handle(
          _startPositionImagePathMeta,
          startPositionImagePath.isAcceptableOrUnknown(
              data['start_position_image_path']!, _startPositionImagePathMeta));
    }
    if (data.containsKey('end_position_image_path')) {
      context.handle(
          _endPositionImagePathMeta,
          endPositionImagePath.isAcceptableOrUnknown(
              data['end_position_image_path']!, _endPositionImagePathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      startPositionImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}start_position_image_path']),
      endPositionImagePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}end_position_image_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> startPositionImagePath;
  final Value<String?> endPositionImagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.startPositionImagePath = const Value.absent(),
    this.endPositionImagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.startPositionImagePath = const Value.absent(),
    this.endPositionImagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? startPositionImagePath,
    Expression<String>? endPositionImagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (startPositionImagePath != null)
        'start_position_image_path': startPositionImagePath,
      if (endPositionImagePath != null)
        'end_position_image_path': endPositionImagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? startPositionImagePath,
      Value<String?>? endPositionImagePath,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startPositionImagePath:
          startPositionImagePath ?? this.startPositionImagePath,
      endPositionImagePath: endPositionImagePath ?? this.endPositionImagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startPositionImagePath.present) {
      map['start_position_image_path'] =
          Variable<String>(startPositionImagePath.value);
    }
    if (endPositionImagePath.present) {
      map['end_position_image_path'] =
          Variable<String>(endPositionImagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startPositionImagePath: $startPositionImagePath, ')
          ..write('endPositionImagePath: $endPositionImagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CompletedWorkoutExercisesTable extends CompletedWorkoutExercises
    with TableInfo<$CompletedWorkoutExercisesTable, CompletedWorkoutExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompletedWorkoutExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES completed_workouts (id)'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _exerciseOrderMeta =
      const VerificationMeta('exerciseOrder');
  @override
  late final GeneratedColumn<int> exerciseOrder = GeneratedColumn<int>(
      'exercise_order', aliasedName, false,
      check: () => ComparableExpr(exerciseOrder).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        workoutId,
        exerciseId,
        exerciseOrder,
        createdAt,
        updatedAt,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'completed_workout_exercises';
  @override
  VerificationContext validateIntegrity(
      Insertable<CompletedWorkoutExercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_order')) {
      context.handle(
          _exerciseOrderMeta,
          exerciseOrder.isAcceptableOrUnknown(
              data['exercise_order']!, _exerciseOrderMeta));
    } else if (isInserting) {
      context.missing(_exerciseOrderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CompletedWorkoutExercise map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletedWorkoutExercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id'])!,
      exerciseOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $CompletedWorkoutExercisesTable createAlias(String alias) {
    return $CompletedWorkoutExercisesTable(attachedDatabase, alias);
  }
}

class CompletedWorkoutExercisesCompanion
    extends UpdateCompanion<CompletedWorkoutExercise> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> workoutId;
  final Value<int> exerciseId;
  final Value<int> exerciseOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String?> notes;
  final Value<int> rowid;
  const CompletedWorkoutExercisesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.exerciseOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletedWorkoutExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String workoutId,
    required int exerciseId,
    required int exerciseOrder,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        workoutId = Value(workoutId),
        exerciseId = Value(exerciseId),
        exerciseOrder = Value(exerciseOrder);
  static Insertable<CompletedWorkoutExercise> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? workoutId,
    Expression<int>? exerciseId,
    Expression<int>? exerciseOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (workoutId != null) 'workout_id': workoutId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseOrder != null) 'exercise_order': exerciseOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletedWorkoutExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? workoutId,
      Value<int>? exerciseId,
      Value<int>? exerciseOrder,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return CompletedWorkoutExercisesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      workoutId: workoutId ?? this.workoutId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseOrder: exerciseOrder ?? this.exerciseOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (exerciseOrder.present) {
      map['exercise_order'] = Variable<int>(exerciseOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletedWorkoutExercisesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseOrder: $exerciseOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CompletedSetsTable extends CompletedSets
    with TableInfo<$CompletedSetsTable, CompletedSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompletedSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutExerciseIdMeta =
      const VerificationMeta('workoutExerciseId');
  @override
  late final GeneratedColumn<String> workoutExerciseId =
      GeneratedColumn<String>('workout_exercise_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES completed_workout_exercises (id)'));
  static const VerificationMeta _setNumberMeta =
      const VerificationMeta('setNumber');
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
      'set_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        workoutExerciseId,
        setNumber,
        repetitions,
        durationSeconds,
        weight,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'completed_sets';
  @override
  VerificationContext validateIntegrity(Insertable<CompletedSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_exercise_id')) {
      context.handle(
          _workoutExerciseIdMeta,
          workoutExerciseId.isAcceptableOrUnknown(
              data['workout_exercise_id']!, _workoutExerciseIdMeta));
    } else if (isInserting) {
      context.missing(_workoutExerciseIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(_setNumberMeta,
          setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta));
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CompletedSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletedSet(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workoutExerciseId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_exercise_id'])!,
      setNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_number'])!,
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetitions'])!,
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $CompletedSetsTable createAlias(String alias) {
    return $CompletedSetsTable(attachedDatabase, alias);
  }
}

class CompletedSetsCompanion extends UpdateCompanion<CompletedSet> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> workoutExerciseId;
  final Value<int> setNumber;
  final Value<int> repetitions;
  final Value<int?> durationSeconds;
  final Value<double?> weight;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const CompletedSetsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.workoutExerciseId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.weight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletedSetsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String workoutExerciseId,
    required int setNumber,
    required int repetitions,
    this.durationSeconds = const Value.absent(),
    this.weight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        workoutExerciseId = Value(workoutExerciseId),
        setNumber = Value(setNumber),
        repetitions = Value(repetitions);
  static Insertable<CompletedSet> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? workoutExerciseId,
    Expression<int>? setNumber,
    Expression<int>? repetitions,
    Expression<int>? durationSeconds,
    Expression<double>? weight,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (workoutExerciseId != null) 'workout_exercise_id': workoutExerciseId,
      if (setNumber != null) 'set_number': setNumber,
      if (repetitions != null) 'repetitions': repetitions,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (weight != null) 'weight': weight,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletedSetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? workoutExerciseId,
      Value<int>? setNumber,
      Value<int>? repetitions,
      Value<int?>? durationSeconds,
      Value<double?>? weight,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return CompletedSetsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      workoutExerciseId: workoutExerciseId ?? this.workoutExerciseId,
      setNumber: setNumber ?? this.setNumber,
      repetitions: repetitions ?? this.repetitions,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      weight: weight ?? this.weight,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutExerciseId.present) {
      map['workout_exercise_id'] = Variable<String>(workoutExerciseId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletedSetsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutExerciseId: $workoutExerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('repetitions: $repetitions, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('weight: $weight, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlannedWorkoutExercisesTable extends PlannedWorkoutExercises
    with TableInfo<$PlannedWorkoutExercisesTable, PlannedWorkoutExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlannedWorkoutExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES planned_workouts (id)'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _exerciseOrderMeta =
      const VerificationMeta('exerciseOrder');
  @override
  late final GeneratedColumn<int> exerciseOrder = GeneratedColumn<int>(
      'exercise_order', aliasedName, false,
      check: () => ComparableExpr(exerciseOrder).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, workoutId, exerciseId, exerciseOrder, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'planned_workout_exercises';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlannedWorkoutExercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_order')) {
      context.handle(
          _exerciseOrderMeta,
          exerciseOrder.isAcceptableOrUnknown(
              data['exercise_order']!, _exerciseOrderMeta));
    } else if (isInserting) {
      context.missing(_exerciseOrderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PlannedWorkoutExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannedWorkoutExercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id'])!,
      exerciseOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $PlannedWorkoutExercisesTable createAlias(String alias) {
    return $PlannedWorkoutExercisesTable(attachedDatabase, alias);
  }
}

class PlannedWorkoutExercisesCompanion
    extends UpdateCompanion<PlannedWorkoutExercise> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> workoutId;
  final Value<int> exerciseId;
  final Value<int> exerciseOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const PlannedWorkoutExercisesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.exerciseOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannedWorkoutExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String workoutId,
    required int exerciseId,
    required int exerciseOrder,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        workoutId = Value(workoutId),
        exerciseId = Value(exerciseId),
        exerciseOrder = Value(exerciseOrder);
  static Insertable<PlannedWorkoutExercise> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? workoutId,
    Expression<int>? exerciseId,
    Expression<int>? exerciseOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (workoutId != null) 'workout_id': workoutId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseOrder != null) 'exercise_order': exerciseOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannedWorkoutExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? workoutId,
      Value<int>? exerciseId,
      Value<int>? exerciseOrder,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return PlannedWorkoutExercisesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      workoutId: workoutId ?? this.workoutId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseOrder: exerciseOrder ?? this.exerciseOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (exerciseOrder.present) {
      map['exercise_order'] = Variable<int>(exerciseOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannedWorkoutExercisesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseOrder: $exerciseOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MuscleGroupsTable extends MuscleGroups
    with TableInfo<$MuscleGroupsTable, MuscleGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MuscleGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'muscle_groups';
  @override
  VerificationContext validateIntegrity(Insertable<MuscleGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MuscleGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuscleGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $MuscleGroupsTable createAlias(String alias) {
    return $MuscleGroupsTable(attachedDatabase, alias);
  }
}

class MuscleGroupsCompanion extends UpdateCompanion<MuscleGroup> {
  final Value<int> id;
  final Value<String> name;
  const MuscleGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  MuscleGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<MuscleGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  MuscleGroupsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return MuscleGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MuscleGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ExerciseMusclesTable extends ExerciseMuscles
    with TableInfo<$ExerciseMusclesTable, ExerciseMuscle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseMusclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id) ON DELETE CASCADE'));
  static const VerificationMeta _muscleGroupIdMeta =
      const VerificationMeta('muscleGroupId');
  @override
  late final GeneratedColumn<int> muscleGroupId = GeneratedColumn<int>(
      'muscle_group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES muscle_groups (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [exerciseId, muscleGroupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_muscles';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseMuscle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('muscle_group_id')) {
      context.handle(
          _muscleGroupIdMeta,
          muscleGroupId.isAcceptableOrUnknown(
              data['muscle_group_id']!, _muscleGroupIdMeta));
    } else if (isInserting) {
      context.missing(_muscleGroupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {exerciseId, muscleGroupId};
  @override
  ExerciseMuscle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseMuscle(
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_id'])!,
      muscleGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muscle_group_id'])!,
    );
  }

  @override
  $ExerciseMusclesTable createAlias(String alias) {
    return $ExerciseMusclesTable(attachedDatabase, alias);
  }
}

class ExerciseMuscle extends DataClass implements Insertable<ExerciseMuscle> {
  final int exerciseId;
  final int muscleGroupId;
  const ExerciseMuscle({required this.exerciseId, required this.muscleGroupId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['exercise_id'] = Variable<int>(exerciseId);
    map['muscle_group_id'] = Variable<int>(muscleGroupId);
    return map;
  }

  ExerciseMusclesCompanion toCompanion(bool nullToAbsent) {
    return ExerciseMusclesCompanion(
      exerciseId: Value(exerciseId),
      muscleGroupId: Value(muscleGroupId),
    );
  }

  factory ExerciseMuscle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseMuscle(
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      muscleGroupId: serializer.fromJson<int>(json['muscleGroupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseId': serializer.toJson<int>(exerciseId),
      'muscleGroupId': serializer.toJson<int>(muscleGroupId),
    };
  }

  ExerciseMuscle copyWith({int? exerciseId, int? muscleGroupId}) =>
      ExerciseMuscle(
        exerciseId: exerciseId ?? this.exerciseId,
        muscleGroupId: muscleGroupId ?? this.muscleGroupId,
      );
  ExerciseMuscle copyWithCompanion(ExerciseMusclesCompanion data) {
    return ExerciseMuscle(
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      muscleGroupId: data.muscleGroupId.present
          ? data.muscleGroupId.value
          : this.muscleGroupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseMuscle(')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleGroupId: $muscleGroupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(exerciseId, muscleGroupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseMuscle &&
          other.exerciseId == this.exerciseId &&
          other.muscleGroupId == this.muscleGroupId);
}

class ExerciseMusclesCompanion extends UpdateCompanion<ExerciseMuscle> {
  final Value<int> exerciseId;
  final Value<int> muscleGroupId;
  final Value<int> rowid;
  const ExerciseMusclesCompanion({
    this.exerciseId = const Value.absent(),
    this.muscleGroupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseMusclesCompanion.insert({
    required int exerciseId,
    required int muscleGroupId,
    this.rowid = const Value.absent(),
  })  : exerciseId = Value(exerciseId),
        muscleGroupId = Value(muscleGroupId);
  static Insertable<ExerciseMuscle> custom({
    Expression<int>? exerciseId,
    Expression<int>? muscleGroupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (muscleGroupId != null) 'muscle_group_id': muscleGroupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseMusclesCompanion copyWith(
      {Value<int>? exerciseId, Value<int>? muscleGroupId, Value<int>? rowid}) {
    return ExerciseMusclesCompanion(
      exerciseId: exerciseId ?? this.exerciseId,
      muscleGroupId: muscleGroupId ?? this.muscleGroupId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (muscleGroupId.present) {
      map['muscle_group_id'] = Variable<int>(muscleGroupId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseMusclesCompanion(')
          ..write('exerciseId: $exerciseId, ')
          ..write('muscleGroupId: $muscleGroupId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlannedSetsTable extends PlannedSets
    with TableInfo<$PlannedSetsTable, PlannedSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlannedSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutExerciseIdMeta =
      const VerificationMeta('workoutExerciseId');
  @override
  late final GeneratedColumn<String> workoutExerciseId =
      GeneratedColumn<String>('workout_exercise_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES planned_workout_exercises (id)'));
  static const VerificationMeta _setNumberMeta =
      const VerificationMeta('setNumber');
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
      'set_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minRepetitionsMeta =
      const VerificationMeta('minRepetitions');
  @override
  late final GeneratedColumn<int> minRepetitions = GeneratedColumn<int>(
      'min_repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxRepetitionsMeta =
      const VerificationMeta('maxRepetitions');
  @override
  late final GeneratedColumn<int> maxRepetitions = GeneratedColumn<int>(
      'max_repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
      'rpe', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        workoutExerciseId,
        setNumber,
        minRepetitions,
        maxRepetitions,
        rpe
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'planned_sets';
  @override
  VerificationContext validateIntegrity(Insertable<PlannedSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_exercise_id')) {
      context.handle(
          _workoutExerciseIdMeta,
          workoutExerciseId.isAcceptableOrUnknown(
              data['workout_exercise_id']!, _workoutExerciseIdMeta));
    } else if (isInserting) {
      context.missing(_workoutExerciseIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(_setNumberMeta,
          setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta));
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('min_repetitions')) {
      context.handle(
          _minRepetitionsMeta,
          minRepetitions.isAcceptableOrUnknown(
              data['min_repetitions']!, _minRepetitionsMeta));
    } else if (isInserting) {
      context.missing(_minRepetitionsMeta);
    }
    if (data.containsKey('max_repetitions')) {
      context.handle(
          _maxRepetitionsMeta,
          maxRepetitions.isAcceptableOrUnknown(
              data['max_repetitions']!, _maxRepetitionsMeta));
    } else if (isInserting) {
      context.missing(_maxRepetitionsMeta);
    }
    if (data.containsKey('rpe')) {
      context.handle(
          _rpeMeta, rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta));
    } else if (isInserting) {
      context.missing(_rpeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PlannedSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannedSet(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      rpe: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rpe'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workoutExerciseId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_exercise_id'])!,
      setNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_number'])!,
      minRepetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_repetitions'])!,
      maxRepetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_repetitions'])!,
    );
  }

  @override
  $PlannedSetsTable createAlias(String alias) {
    return $PlannedSetsTable(attachedDatabase, alias);
  }
}

class PlannedSetsCompanion extends UpdateCompanion<PlannedSet> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> workoutExerciseId;
  final Value<int> setNumber;
  final Value<int> minRepetitions;
  final Value<int> maxRepetitions;
  final Value<double> rpe;
  final Value<int> rowid;
  const PlannedSetsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.workoutExerciseId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.minRepetitions = const Value.absent(),
    this.maxRepetitions = const Value.absent(),
    this.rpe = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannedSetsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String workoutExerciseId,
    required int setNumber,
    required int minRepetitions,
    required int maxRepetitions,
    required double rpe,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        workoutExerciseId = Value(workoutExerciseId),
        setNumber = Value(setNumber),
        minRepetitions = Value(minRepetitions),
        maxRepetitions = Value(maxRepetitions),
        rpe = Value(rpe);
  static Insertable<PlannedSet> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? workoutExerciseId,
    Expression<int>? setNumber,
    Expression<int>? minRepetitions,
    Expression<int>? maxRepetitions,
    Expression<double>? rpe,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (workoutExerciseId != null) 'workout_exercise_id': workoutExerciseId,
      if (setNumber != null) 'set_number': setNumber,
      if (minRepetitions != null) 'min_repetitions': minRepetitions,
      if (maxRepetitions != null) 'max_repetitions': maxRepetitions,
      if (rpe != null) 'rpe': rpe,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannedSetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? workoutExerciseId,
      Value<int>? setNumber,
      Value<int>? minRepetitions,
      Value<int>? maxRepetitions,
      Value<double>? rpe,
      Value<int>? rowid}) {
    return PlannedSetsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      workoutExerciseId: workoutExerciseId ?? this.workoutExerciseId,
      setNumber: setNumber ?? this.setNumber,
      minRepetitions: minRepetitions ?? this.minRepetitions,
      maxRepetitions: maxRepetitions ?? this.maxRepetitions,
      rpe: rpe ?? this.rpe,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutExerciseId.present) {
      map['workout_exercise_id'] = Variable<String>(workoutExerciseId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (minRepetitions.present) {
      map['min_repetitions'] = Variable<int>(minRepetitions.value);
    }
    if (maxRepetitions.present) {
      map['max_repetitions'] = Variable<int>(maxRepetitions.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<double>(rpe.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannedSetsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('workoutExerciseId: $workoutExerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('minRepetitions: $minRepetitions, ')
          ..write('maxRepetitions: $maxRepetitions, ')
          ..write('rpe: $rpe, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserPreferencesTableTable extends UserPreferencesTable
    with TableInfo<$UserPreferencesTableTable, UserPreferences> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPreferencesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _isDarkModeMeta =
      const VerificationMeta('isDarkMode');
  @override
  late final GeneratedColumn<bool> isDarkMode = GeneratedColumn<bool>(
      'is_dark_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_dark_mode" IN (0, 1))'));
  static const VerificationMeta _isMetricMeta =
      const VerificationMeta('isMetric');
  @override
  late final GeneratedColumn<bool> isMetric = GeneratedColumn<bool>(
      'is_metric', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_metric" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [userId, isDarkMode, isMetric];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_preferences_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserPreferences> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_dark_mode')) {
      context.handle(
          _isDarkModeMeta,
          isDarkMode.isAcceptableOrUnknown(
              data['is_dark_mode']!, _isDarkModeMeta));
    } else if (isInserting) {
      context.missing(_isDarkModeMeta);
    }
    if (data.containsKey('is_metric')) {
      context.handle(_isMetricMeta,
          isMetric.isAcceptableOrUnknown(data['is_metric']!, _isMetricMeta));
    } else if (isInserting) {
      context.missing(_isMetricMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserPreferences map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPreferences(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      isDarkMode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dark_mode'])!,
      isMetric: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_metric'])!,
    );
  }

  @override
  $UserPreferencesTableTable createAlias(String alias) {
    return $UserPreferencesTableTable(attachedDatabase, alias);
  }
}

class UserPreferencesTableCompanion extends UpdateCompanion<UserPreferences> {
  final Value<String> userId;
  final Value<bool> isDarkMode;
  final Value<bool> isMetric;
  final Value<int> rowid;
  const UserPreferencesTableCompanion({
    this.userId = const Value.absent(),
    this.isDarkMode = const Value.absent(),
    this.isMetric = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPreferencesTableCompanion.insert({
    required String userId,
    required bool isDarkMode,
    required bool isMetric,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        isDarkMode = Value(isDarkMode),
        isMetric = Value(isMetric);
  static Insertable<UserPreferences> custom({
    Expression<String>? userId,
    Expression<bool>? isDarkMode,
    Expression<bool>? isMetric,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (isDarkMode != null) 'is_dark_mode': isDarkMode,
      if (isMetric != null) 'is_metric': isMetric,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPreferencesTableCompanion copyWith(
      {Value<String>? userId,
      Value<bool>? isDarkMode,
      Value<bool>? isMetric,
      Value<int>? rowid}) {
    return UserPreferencesTableCompanion(
      userId: userId ?? this.userId,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isMetric: isMetric ?? this.isMetric,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (isDarkMode.present) {
      map['is_dark_mode'] = Variable<bool>(isDarkMode.value);
    }
    if (isMetric.present) {
      map['is_metric'] = Variable<bool>(isMetric.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPreferencesTableCompanion(')
          ..write('userId: $userId, ')
          ..write('isDarkMode: $isDarkMode, ')
          ..write('isMetric: $isMetric, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserWorkoutPlansTableTable extends UserWorkoutPlansTable
    with TableInfo<$UserWorkoutPlansTableTable, UserWorkoutPlansTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserWorkoutPlansTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workoutPlanIdMeta =
      const VerificationMeta('workoutPlanId');
  @override
  late final GeneratedColumn<String> workoutPlanId = GeneratedColumn<String>(
      'workout_plan_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workout_plans (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [userId, workoutPlanId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_workout_plans_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserWorkoutPlansTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('workout_plan_id')) {
      context.handle(
          _workoutPlanIdMeta,
          workoutPlanId.isAcceptableOrUnknown(
              data['workout_plan_id']!, _workoutPlanIdMeta));
    } else if (isInserting) {
      context.missing(_workoutPlanIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserWorkoutPlansTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserWorkoutPlansTableData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      workoutPlanId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_plan_id'])!,
    );
  }

  @override
  $UserWorkoutPlansTableTable createAlias(String alias) {
    return $UserWorkoutPlansTableTable(attachedDatabase, alias);
  }
}

class UserWorkoutPlansTableData extends DataClass
    implements Insertable<UserWorkoutPlansTableData> {
  final String userId;
  final String workoutPlanId;
  const UserWorkoutPlansTableData(
      {required this.userId, required this.workoutPlanId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['workout_plan_id'] = Variable<String>(workoutPlanId);
    return map;
  }

  UserWorkoutPlansTableCompanion toCompanion(bool nullToAbsent) {
    return UserWorkoutPlansTableCompanion(
      userId: Value(userId),
      workoutPlanId: Value(workoutPlanId),
    );
  }

  factory UserWorkoutPlansTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserWorkoutPlansTableData(
      userId: serializer.fromJson<String>(json['userId']),
      workoutPlanId: serializer.fromJson<String>(json['workoutPlanId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'workoutPlanId': serializer.toJson<String>(workoutPlanId),
    };
  }

  UserWorkoutPlansTableData copyWith({String? userId, String? workoutPlanId}) =>
      UserWorkoutPlansTableData(
        userId: userId ?? this.userId,
        workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      );
  UserWorkoutPlansTableData copyWithCompanion(
      UserWorkoutPlansTableCompanion data) {
    return UserWorkoutPlansTableData(
      userId: data.userId.present ? data.userId.value : this.userId,
      workoutPlanId: data.workoutPlanId.present
          ? data.workoutPlanId.value
          : this.workoutPlanId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserWorkoutPlansTableData(')
          ..write('userId: $userId, ')
          ..write('workoutPlanId: $workoutPlanId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, workoutPlanId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserWorkoutPlansTableData &&
          other.userId == this.userId &&
          other.workoutPlanId == this.workoutPlanId);
}

class UserWorkoutPlansTableCompanion
    extends UpdateCompanion<UserWorkoutPlansTableData> {
  final Value<String> userId;
  final Value<String> workoutPlanId;
  final Value<int> rowid;
  const UserWorkoutPlansTableCompanion({
    this.userId = const Value.absent(),
    this.workoutPlanId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserWorkoutPlansTableCompanion.insert({
    required String userId,
    required String workoutPlanId,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        workoutPlanId = Value(workoutPlanId);
  static Insertable<UserWorkoutPlansTableData> custom({
    Expression<String>? userId,
    Expression<String>? workoutPlanId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (workoutPlanId != null) 'workout_plan_id': workoutPlanId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserWorkoutPlansTableCompanion copyWith(
      {Value<String>? userId,
      Value<String>? workoutPlanId,
      Value<int>? rowid}) {
    return UserWorkoutPlansTableCompanion(
      userId: userId ?? this.userId,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (workoutPlanId.present) {
      map['workout_plan_id'] = Variable<String>(workoutPlanId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserWorkoutPlansTableCompanion(')
          ..write('userId: $userId, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfflineUserDataTableTable extends OfflineUserDataTable
    with TableInfo<$OfflineUserDataTableTable, OfflineUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflineUserDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_user_data_table';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineUserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  OfflineUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineUserData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $OfflineUserDataTableTable createAlias(String alias) {
    return $OfflineUserDataTableTable(attachedDatabase, alias);
  }
}

class OfflineUserDataTableCompanion extends UpdateCompanion<OfflineUserData> {
  final Value<String> userId;
  final Value<int> rowid;
  const OfflineUserDataTableCompanion({
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfflineUserDataTableCompanion.insert({
    required String userId,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<OfflineUserData> custom({
    Expression<String>? userId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfflineUserDataTableCompanion copyWith(
      {Value<String>? userId, Value<int>? rowid}) {
    return OfflineUserDataTableCompanion(
      userId: userId ?? this.userId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineUserDataTableCompanion(')
          ..write('userId: $userId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorkoutPlansTable workoutPlans = $WorkoutPlansTable(this);
  late final $PlannedWorkoutsTable plannedWorkouts =
      $PlannedWorkoutsTable(this);
  late final $CompletedWorkoutsTable completedWorkouts =
      $CompletedWorkoutsTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $CompletedWorkoutExercisesTable completedWorkoutExercises =
      $CompletedWorkoutExercisesTable(this);
  late final $CompletedSetsTable completedSets = $CompletedSetsTable(this);
  late final $PlannedWorkoutExercisesTable plannedWorkoutExercises =
      $PlannedWorkoutExercisesTable(this);
  late final $MuscleGroupsTable muscleGroups = $MuscleGroupsTable(this);
  late final $ExerciseMusclesTable exerciseMuscles =
      $ExerciseMusclesTable(this);
  late final $PlannedSetsTable plannedSets = $PlannedSetsTable(this);
  late final $UserPreferencesTableTable userPreferencesTable =
      $UserPreferencesTableTable(this);
  late final $UserWorkoutPlansTableTable userWorkoutPlansTable =
      $UserWorkoutPlansTableTable(this);
  late final $OfflineUserDataTableTable offlineUserDataTable =
      $OfflineUserDataTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        workoutPlans,
        plannedWorkouts,
        completedWorkouts,
        exercises,
        completedWorkoutExercises,
        completedSets,
        plannedWorkoutExercises,
        muscleGroups,
        exerciseMuscles,
        plannedSets,
        userPreferencesTable,
        userWorkoutPlansTable,
        offlineUserDataTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('exercises',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('exercise_muscles', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('muscle_groups',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('exercise_muscles', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('workout_plans',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('user_workout_plans_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$WorkoutPlansTableCreateCompanionBuilder = WorkoutPlansCompanion
    Function({
  Value<String> id,
  required String userId,
  required String description,
  required String name,
  required int numWeeks,
  required int daysPerWeek,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$WorkoutPlansTableUpdateCompanionBuilder = WorkoutPlansCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> description,
  Value<String> name,
  Value<int> numWeeks,
  Value<int> daysPerWeek,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$WorkoutPlansTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutPlansTable, WorkoutPlan> {
  $$WorkoutPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlannedWorkoutsTable, List<PlannedWorkout>>
      _plannedWorkoutsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.plannedWorkouts,
              aliasName: $_aliasNameGenerator(
                  db.workoutPlans.id, db.plannedWorkouts.workoutPlanId));

  $$PlannedWorkoutsTableProcessedTableManager get plannedWorkoutsRefs {
    final manager =
        $$PlannedWorkoutsTableTableManager($_db, $_db.plannedWorkouts)
            .filter((f) => f.workoutPlanId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_plannedWorkoutsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$UserWorkoutPlansTableTable,
      List<UserWorkoutPlansTableData>> _userWorkoutPlansTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.userWorkoutPlansTable,
          aliasName: $_aliasNameGenerator(
              db.workoutPlans.id, db.userWorkoutPlansTable.workoutPlanId));

  $$UserWorkoutPlansTableTableProcessedTableManager
      get userWorkoutPlansTableRefs {
    final manager = $$UserWorkoutPlansTableTableTableManager(
            $_db, $_db.userWorkoutPlansTable)
        .filter((f) => f.workoutPlanId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_userWorkoutPlansTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkoutPlansTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get numWeeks => $composableBuilder(
      column: $table.numWeeks, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get daysPerWeek => $composableBuilder(
      column: $table.daysPerWeek, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> plannedWorkoutsRefs(
      Expression<bool> Function($$PlannedWorkoutsTableFilterComposer f) f) {
    final $$PlannedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.workoutPlanId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> userWorkoutPlansTableRefs(
      Expression<bool> Function($$UserWorkoutPlansTableTableFilterComposer f)
          f) {
    final $$UserWorkoutPlansTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.userWorkoutPlansTable,
            getReferencedColumn: (t) => t.workoutPlanId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$UserWorkoutPlansTableTableFilterComposer(
                  $db: $db,
                  $table: $db.userWorkoutPlansTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$WorkoutPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get numWeeks => $composableBuilder(
      column: $table.numWeeks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get daysPerWeek => $composableBuilder(
      column: $table.daysPerWeek, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$WorkoutPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get numWeeks =>
      $composableBuilder(column: $table.numWeeks, builder: (column) => column);

  GeneratedColumn<int> get daysPerWeek => $composableBuilder(
      column: $table.daysPerWeek, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> plannedWorkoutsRefs<T extends Object>(
      Expression<T> Function($$PlannedWorkoutsTableAnnotationComposer a) f) {
    final $$PlannedWorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.workoutPlanId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> userWorkoutPlansTableRefs<T extends Object>(
      Expression<T> Function($$UserWorkoutPlansTableTableAnnotationComposer a)
          f) {
    final $$UserWorkoutPlansTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.userWorkoutPlansTable,
            getReferencedColumn: (t) => t.workoutPlanId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$UserWorkoutPlansTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.userWorkoutPlansTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$WorkoutPlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutPlansTable,
    WorkoutPlan,
    $$WorkoutPlansTableFilterComposer,
    $$WorkoutPlansTableOrderingComposer,
    $$WorkoutPlansTableAnnotationComposer,
    $$WorkoutPlansTableCreateCompanionBuilder,
    $$WorkoutPlansTableUpdateCompanionBuilder,
    (WorkoutPlan, $$WorkoutPlansTableReferences),
    WorkoutPlan,
    PrefetchHooks Function(
        {bool plannedWorkoutsRefs, bool userWorkoutPlansTableRefs})> {
  $$WorkoutPlansTableTableManager(_$AppDatabase db, $WorkoutPlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> numWeeks = const Value.absent(),
            Value<int> daysPerWeek = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion(
            id: id,
            userId: userId,
            description: description,
            name: name,
            numWeeks: numWeeks,
            daysPerWeek: daysPerWeek,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String userId,
            required String description,
            required String name,
            required int numWeeks,
            required int daysPerWeek,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion.insert(
            id: id,
            userId: userId,
            description: description,
            name: name,
            numWeeks: numWeeks,
            daysPerWeek: daysPerWeek,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkoutPlansTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {plannedWorkoutsRefs = false,
              userWorkoutPlansTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (plannedWorkoutsRefs) db.plannedWorkouts,
                if (userWorkoutPlansTableRefs) db.userWorkoutPlansTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (plannedWorkoutsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WorkoutPlansTableReferences
                            ._plannedWorkoutsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutPlansTableReferences(db, table, p0)
                                .plannedWorkoutsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutPlanId == item.id),
                        typedResults: items),
                  if (userWorkoutPlansTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WorkoutPlansTableReferences
                            ._userWorkoutPlansTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutPlansTableReferences(db, table, p0)
                                .userWorkoutPlansTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutPlanId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkoutPlansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutPlansTable,
    WorkoutPlan,
    $$WorkoutPlansTableFilterComposer,
    $$WorkoutPlansTableOrderingComposer,
    $$WorkoutPlansTableAnnotationComposer,
    $$WorkoutPlansTableCreateCompanionBuilder,
    $$WorkoutPlansTableUpdateCompanionBuilder,
    (WorkoutPlan, $$WorkoutPlansTableReferences),
    WorkoutPlan,
    PrefetchHooks Function(
        {bool plannedWorkoutsRefs, bool userWorkoutPlansTableRefs})>;
typedef $$PlannedWorkoutsTableCreateCompanionBuilder = PlannedWorkoutsCompanion
    Function({
  Value<String> id,
  required String userId,
  required String workoutPlanId,
  Value<String?> workoutName,
  required int dayNumber,
  required int weekNumber,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$PlannedWorkoutsTableUpdateCompanionBuilder = PlannedWorkoutsCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> workoutPlanId,
  Value<String?> workoutName,
  Value<int> dayNumber,
  Value<int> weekNumber,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$PlannedWorkoutsTableReferences extends BaseReferences<
    _$AppDatabase, $PlannedWorkoutsTable, PlannedWorkout> {
  $$PlannedWorkoutsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutPlansTable _workoutPlanIdTable(_$AppDatabase db) =>
      db.workoutPlans.createAlias($_aliasNameGenerator(
          db.plannedWorkouts.workoutPlanId, db.workoutPlans.id));

  $$WorkoutPlansTableProcessedTableManager get workoutPlanId {
    final manager = $$WorkoutPlansTableTableManager($_db, $_db.workoutPlans)
        .filter((f) => f.id($_item.workoutPlanId));
    final item = $_typedResult.readTableOrNull(_workoutPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CompletedWorkoutsTable, List<CompletedWorkout>>
      _completedWorkoutsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.completedWorkouts,
              aliasName: $_aliasNameGenerator(db.plannedWorkouts.id,
                  db.completedWorkouts.plannedWorkoutId));

  $$CompletedWorkoutsTableProcessedTableManager get completedWorkoutsRefs {
    final manager =
        $$CompletedWorkoutsTableTableManager($_db, $_db.completedWorkouts)
            .filter((f) => f.plannedWorkoutId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_completedWorkoutsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PlannedWorkoutExercisesTable,
      List<PlannedWorkoutExercise>> _plannedWorkoutExercisesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.plannedWorkoutExercises,
          aliasName: $_aliasNameGenerator(
              db.plannedWorkouts.id, db.plannedWorkoutExercises.workoutId));

  $$PlannedWorkoutExercisesTableProcessedTableManager
      get plannedWorkoutExercisesRefs {
    final manager = $$PlannedWorkoutExercisesTableTableManager(
            $_db, $_db.plannedWorkoutExercises)
        .filter((f) => f.workoutId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_plannedWorkoutExercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlannedWorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $PlannedWorkoutsTable> {
  $$PlannedWorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workoutName => $composableBuilder(
      column: $table.workoutName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get weekNumber => $composableBuilder(
      column: $table.weekNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$WorkoutPlansTableFilterComposer get workoutPlanId {
    final $$WorkoutPlansTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutPlansTableFilterComposer(
              $db: $db,
              $table: $db.workoutPlans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> completedWorkoutsRefs(
      Expression<bool> Function($$CompletedWorkoutsTableFilterComposer f) f) {
    final $$CompletedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.completedWorkouts,
        getReferencedColumn: (t) => t.plannedWorkoutId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompletedWorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.completedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> plannedWorkoutExercisesRefs(
      Expression<bool> Function($$PlannedWorkoutExercisesTableFilterComposer f)
          f) {
    final $$PlannedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.plannedWorkoutExercises,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlannedWorkoutExercisesTableFilterComposer(
                  $db: $db,
                  $table: $db.plannedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlannedWorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlannedWorkoutsTable> {
  $$PlannedWorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workoutName => $composableBuilder(
      column: $table.workoutName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayNumber => $composableBuilder(
      column: $table.dayNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weekNumber => $composableBuilder(
      column: $table.weekNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$WorkoutPlansTableOrderingComposer get workoutPlanId {
    final $$WorkoutPlansTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutPlansTableOrderingComposer(
              $db: $db,
              $table: $db.workoutPlans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlannedWorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlannedWorkoutsTable> {
  $$PlannedWorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get workoutName => $composableBuilder(
      column: $table.workoutName, builder: (column) => column);

  GeneratedColumn<int> get dayNumber =>
      $composableBuilder(column: $table.dayNumber, builder: (column) => column);

  GeneratedColumn<int> get weekNumber => $composableBuilder(
      column: $table.weekNumber, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WorkoutPlansTableAnnotationComposer get workoutPlanId {
    final $$WorkoutPlansTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutPlansTableAnnotationComposer(
              $db: $db,
              $table: $db.workoutPlans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> completedWorkoutsRefs<T extends Object>(
      Expression<T> Function($$CompletedWorkoutsTableAnnotationComposer a) f) {
    final $$CompletedWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.completedWorkouts,
            getReferencedColumn: (t) => t.plannedWorkoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.completedWorkouts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> plannedWorkoutExercisesRefs<T extends Object>(
      Expression<T> Function($$PlannedWorkoutExercisesTableAnnotationComposer a)
          f) {
    final $$PlannedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.plannedWorkoutExercises,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlannedWorkoutExercisesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.plannedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlannedWorkoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlannedWorkoutsTable,
    PlannedWorkout,
    $$PlannedWorkoutsTableFilterComposer,
    $$PlannedWorkoutsTableOrderingComposer,
    $$PlannedWorkoutsTableAnnotationComposer,
    $$PlannedWorkoutsTableCreateCompanionBuilder,
    $$PlannedWorkoutsTableUpdateCompanionBuilder,
    (PlannedWorkout, $$PlannedWorkoutsTableReferences),
    PlannedWorkout,
    PrefetchHooks Function(
        {bool workoutPlanId,
        bool completedWorkoutsRefs,
        bool plannedWorkoutExercisesRefs})> {
  $$PlannedWorkoutsTableTableManager(
      _$AppDatabase db, $PlannedWorkoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlannedWorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlannedWorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlannedWorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> workoutPlanId = const Value.absent(),
            Value<String?> workoutName = const Value.absent(),
            Value<int> dayNumber = const Value.absent(),
            Value<int> weekNumber = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutsCompanion(
            id: id,
            userId: userId,
            workoutPlanId: workoutPlanId,
            workoutName: workoutName,
            dayNumber: dayNumber,
            weekNumber: weekNumber,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String userId,
            required String workoutPlanId,
            Value<String?> workoutName = const Value.absent(),
            required int dayNumber,
            required int weekNumber,
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutsCompanion.insert(
            id: id,
            userId: userId,
            workoutPlanId: workoutPlanId,
            workoutName: workoutName,
            dayNumber: dayNumber,
            weekNumber: weekNumber,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlannedWorkoutsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workoutPlanId = false,
              completedWorkoutsRefs = false,
              plannedWorkoutExercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (completedWorkoutsRefs) db.completedWorkouts,
                if (plannedWorkoutExercisesRefs) db.plannedWorkoutExercises
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutPlanId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutPlanId,
                    referencedTable: $$PlannedWorkoutsTableReferences
                        ._workoutPlanIdTable(db),
                    referencedColumn: $$PlannedWorkoutsTableReferences
                        ._workoutPlanIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (completedWorkoutsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PlannedWorkoutsTableReferences
                            ._completedWorkoutsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlannedWorkoutsTableReferences(db, table, p0)
                                .completedWorkoutsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.plannedWorkoutId == item.id),
                        typedResults: items),
                  if (plannedWorkoutExercisesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PlannedWorkoutsTableReferences
                            ._plannedWorkoutExercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlannedWorkoutsTableReferences(db, table, p0)
                                .plannedWorkoutExercisesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlannedWorkoutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlannedWorkoutsTable,
    PlannedWorkout,
    $$PlannedWorkoutsTableFilterComposer,
    $$PlannedWorkoutsTableOrderingComposer,
    $$PlannedWorkoutsTableAnnotationComposer,
    $$PlannedWorkoutsTableCreateCompanionBuilder,
    $$PlannedWorkoutsTableUpdateCompanionBuilder,
    (PlannedWorkout, $$PlannedWorkoutsTableReferences),
    PlannedWorkout,
    PrefetchHooks Function(
        {bool workoutPlanId,
        bool completedWorkoutsRefs,
        bool plannedWorkoutExercisesRefs})>;
typedef $$CompletedWorkoutsTableCreateCompanionBuilder
    = CompletedWorkoutsCompanion Function({
  Value<String> id,
  required String userId,
  Value<String?> plannedWorkoutId,
  Value<String?> workoutName,
  Value<DateTime> workoutDate,
  Value<DateTime?> startTime,
  Value<DateTime?> endTime,
  Value<int?> totalDuration,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$CompletedWorkoutsTableUpdateCompanionBuilder
    = CompletedWorkoutsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String?> plannedWorkoutId,
  Value<String?> workoutName,
  Value<DateTime> workoutDate,
  Value<DateTime?> startTime,
  Value<DateTime?> endTime,
  Value<int?> totalDuration,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$CompletedWorkoutsTableReferences extends BaseReferences<
    _$AppDatabase, $CompletedWorkoutsTable, CompletedWorkout> {
  $$CompletedWorkoutsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlannedWorkoutsTable _plannedWorkoutIdTable(_$AppDatabase db) =>
      db.plannedWorkouts.createAlias($_aliasNameGenerator(
          db.completedWorkouts.plannedWorkoutId, db.plannedWorkouts.id));

  $$PlannedWorkoutsTableProcessedTableManager? get plannedWorkoutId {
    if ($_item.plannedWorkoutId == null) return null;
    final manager =
        $$PlannedWorkoutsTableTableManager($_db, $_db.plannedWorkouts)
            .filter((f) => f.id($_item.plannedWorkoutId!));
    final item = $_typedResult.readTableOrNull(_plannedWorkoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CompletedWorkoutExercisesTable,
      List<CompletedWorkoutExercise>> _completedWorkoutExercisesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.completedWorkoutExercises,
          aliasName: $_aliasNameGenerator(
              db.completedWorkouts.id, db.completedWorkoutExercises.workoutId));

  $$CompletedWorkoutExercisesTableProcessedTableManager
      get completedWorkoutExercisesRefs {
    final manager = $$CompletedWorkoutExercisesTableTableManager(
            $_db, $_db.completedWorkoutExercises)
        .filter((f) => f.workoutId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_completedWorkoutExercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CompletedWorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $CompletedWorkoutsTable> {
  $$CompletedWorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workoutName => $composableBuilder(
      column: $table.workoutName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get workoutDate => $composableBuilder(
      column: $table.workoutDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalDuration => $composableBuilder(
      column: $table.totalDuration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$PlannedWorkoutsTableFilterComposer get plannedWorkoutId {
    final $$PlannedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plannedWorkoutId,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> completedWorkoutExercisesRefs(
      Expression<bool> Function(
              $$CompletedWorkoutExercisesTableFilterComposer f)
          f) {
    final $$CompletedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutExercisesTableFilterComposer(
                  $db: $db,
                  $table: $db.completedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CompletedWorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $CompletedWorkoutsTable> {
  $$CompletedWorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workoutName => $composableBuilder(
      column: $table.workoutName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get workoutDate => $composableBuilder(
      column: $table.workoutDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalDuration => $composableBuilder(
      column: $table.totalDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$PlannedWorkoutsTableOrderingComposer get plannedWorkoutId {
    final $$PlannedWorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plannedWorkoutId,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableOrderingComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CompletedWorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompletedWorkoutsTable> {
  $$CompletedWorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get workoutName => $composableBuilder(
      column: $table.workoutName, builder: (column) => column);

  GeneratedColumn<DateTime> get workoutDate => $composableBuilder(
      column: $table.workoutDate, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get totalDuration => $composableBuilder(
      column: $table.totalDuration, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PlannedWorkoutsTableAnnotationComposer get plannedWorkoutId {
    final $$PlannedWorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plannedWorkoutId,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> completedWorkoutExercisesRefs<T extends Object>(
      Expression<T> Function(
              $$CompletedWorkoutExercisesTableAnnotationComposer a)
          f) {
    final $$CompletedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutExercisesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.completedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CompletedWorkoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CompletedWorkoutsTable,
    CompletedWorkout,
    $$CompletedWorkoutsTableFilterComposer,
    $$CompletedWorkoutsTableOrderingComposer,
    $$CompletedWorkoutsTableAnnotationComposer,
    $$CompletedWorkoutsTableCreateCompanionBuilder,
    $$CompletedWorkoutsTableUpdateCompanionBuilder,
    (CompletedWorkout, $$CompletedWorkoutsTableReferences),
    CompletedWorkout,
    PrefetchHooks Function(
        {bool plannedWorkoutId, bool completedWorkoutExercisesRefs})> {
  $$CompletedWorkoutsTableTableManager(
      _$AppDatabase db, $CompletedWorkoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompletedWorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompletedWorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompletedWorkoutsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> plannedWorkoutId = const Value.absent(),
            Value<String?> workoutName = const Value.absent(),
            Value<DateTime> workoutDate = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<int?> totalDuration = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutsCompanion(
            id: id,
            userId: userId,
            plannedWorkoutId: plannedWorkoutId,
            workoutName: workoutName,
            workoutDate: workoutDate,
            startTime: startTime,
            endTime: endTime,
            totalDuration: totalDuration,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String userId,
            Value<String?> plannedWorkoutId = const Value.absent(),
            Value<String?> workoutName = const Value.absent(),
            Value<DateTime> workoutDate = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<int?> totalDuration = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutsCompanion.insert(
            id: id,
            userId: userId,
            plannedWorkoutId: plannedWorkoutId,
            workoutName: workoutName,
            workoutDate: workoutDate,
            startTime: startTime,
            endTime: endTime,
            totalDuration: totalDuration,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CompletedWorkoutsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {plannedWorkoutId = false,
              completedWorkoutExercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (completedWorkoutExercisesRefs) db.completedWorkoutExercises
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (plannedWorkoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.plannedWorkoutId,
                    referencedTable: $$CompletedWorkoutsTableReferences
                        ._plannedWorkoutIdTable(db),
                    referencedColumn: $$CompletedWorkoutsTableReferences
                        ._plannedWorkoutIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (completedWorkoutExercisesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CompletedWorkoutsTableReferences
                            ._completedWorkoutExercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompletedWorkoutsTableReferences(db, table, p0)
                                .completedWorkoutExercisesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CompletedWorkoutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CompletedWorkoutsTable,
    CompletedWorkout,
    $$CompletedWorkoutsTableFilterComposer,
    $$CompletedWorkoutsTableOrderingComposer,
    $$CompletedWorkoutsTableAnnotationComposer,
    $$CompletedWorkoutsTableCreateCompanionBuilder,
    $$CompletedWorkoutsTableUpdateCompanionBuilder,
    (CompletedWorkout, $$CompletedWorkoutsTableReferences),
    CompletedWorkout,
    PrefetchHooks Function(
        {bool plannedWorkoutId, bool completedWorkoutExercisesRefs})>;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<String?> startPositionImagePath,
  Value<String?> endPositionImagePath,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> startPositionImagePath,
  Value<String?> endPositionImagePath,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CompletedWorkoutExercisesTable,
      List<CompletedWorkoutExercise>> _completedWorkoutExercisesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.completedWorkoutExercises,
          aliasName: $_aliasNameGenerator(
              db.exercises.id, db.completedWorkoutExercises.exerciseId));

  $$CompletedWorkoutExercisesTableProcessedTableManager
      get completedWorkoutExercisesRefs {
    final manager = $$CompletedWorkoutExercisesTableTableManager(
            $_db, $_db.completedWorkoutExercises)
        .filter((f) => f.exerciseId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_completedWorkoutExercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PlannedWorkoutExercisesTable,
      List<PlannedWorkoutExercise>> _plannedWorkoutExercisesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.plannedWorkoutExercises,
          aliasName: $_aliasNameGenerator(
              db.exercises.id, db.plannedWorkoutExercises.exerciseId));

  $$PlannedWorkoutExercisesTableProcessedTableManager
      get plannedWorkoutExercisesRefs {
    final manager = $$PlannedWorkoutExercisesTableTableManager(
            $_db, $_db.plannedWorkoutExercises)
        .filter((f) => f.exerciseId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_plannedWorkoutExercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExerciseMusclesTable, List<ExerciseMuscle>>
      _exerciseMusclesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.exerciseMuscles,
              aliasName: $_aliasNameGenerator(
                  db.exercises.id, db.exerciseMuscles.exerciseId));

  $$ExerciseMusclesTableProcessedTableManager get exerciseMusclesRefs {
    final manager =
        $$ExerciseMusclesTableTableManager($_db, $_db.exerciseMuscles)
            .filter((f) => f.exerciseId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_exerciseMusclesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startPositionImagePath => $composableBuilder(
      column: $table.startPositionImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endPositionImagePath => $composableBuilder(
      column: $table.endPositionImagePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> completedWorkoutExercisesRefs(
      Expression<bool> Function(
              $$CompletedWorkoutExercisesTableFilterComposer f)
          f) {
    final $$CompletedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutExercisesTableFilterComposer(
                  $db: $db,
                  $table: $db.completedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> plannedWorkoutExercisesRefs(
      Expression<bool> Function($$PlannedWorkoutExercisesTableFilterComposer f)
          f) {
    final $$PlannedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.plannedWorkoutExercises,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlannedWorkoutExercisesTableFilterComposer(
                  $db: $db,
                  $table: $db.plannedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> exerciseMusclesRefs(
      Expression<bool> Function($$ExerciseMusclesTableFilterComposer f) f) {
    final $$ExerciseMusclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseMuscles,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseMusclesTableFilterComposer(
              $db: $db,
              $table: $db.exerciseMuscles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startPositionImagePath => $composableBuilder(
      column: $table.startPositionImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endPositionImagePath => $composableBuilder(
      column: $table.endPositionImagePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get startPositionImagePath => $composableBuilder(
      column: $table.startPositionImagePath, builder: (column) => column);

  GeneratedColumn<String> get endPositionImagePath => $composableBuilder(
      column: $table.endPositionImagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> completedWorkoutExercisesRefs<T extends Object>(
      Expression<T> Function(
              $$CompletedWorkoutExercisesTableAnnotationComposer a)
          f) {
    final $$CompletedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutExercisesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.completedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> plannedWorkoutExercisesRefs<T extends Object>(
      Expression<T> Function($$PlannedWorkoutExercisesTableAnnotationComposer a)
          f) {
    final $$PlannedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.plannedWorkoutExercises,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlannedWorkoutExercisesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.plannedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> exerciseMusclesRefs<T extends Object>(
      Expression<T> Function($$ExerciseMusclesTableAnnotationComposer a) f) {
    final $$ExerciseMusclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseMuscles,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseMusclesTableAnnotationComposer(
              $db: $db,
              $table: $db.exerciseMuscles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function(
        {bool completedWorkoutExercisesRefs,
        bool plannedWorkoutExercisesRefs,
        bool exerciseMusclesRefs})> {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> startPositionImagePath = const Value.absent(),
            Value<String?> endPositionImagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            name: name,
            description: description,
            startPositionImagePath: startPositionImagePath,
            endPositionImagePath: endPositionImagePath,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> startPositionImagePath = const Value.absent(),
            Value<String?> endPositionImagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              ExercisesCompanion.insert(
            id: id,
            name: name,
            description: description,
            startPositionImagePath: startPositionImagePath,
            endPositionImagePath: endPositionImagePath,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExercisesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {completedWorkoutExercisesRefs = false,
              plannedWorkoutExercisesRefs = false,
              exerciseMusclesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (completedWorkoutExercisesRefs) db.completedWorkoutExercises,
                if (plannedWorkoutExercisesRefs) db.plannedWorkoutExercises,
                if (exerciseMusclesRefs) db.exerciseMuscles
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (completedWorkoutExercisesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ExercisesTableReferences
                            ._completedWorkoutExercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExercisesTableReferences(db, table, p0)
                                .completedWorkoutExercisesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseId == item.id),
                        typedResults: items),
                  if (plannedWorkoutExercisesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ExercisesTableReferences
                            ._plannedWorkoutExercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExercisesTableReferences(db, table, p0)
                                .plannedWorkoutExercisesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseId == item.id),
                        typedResults: items),
                  if (exerciseMusclesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ExercisesTableReferences
                            ._exerciseMusclesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExercisesTableReferences(db, table, p0)
                                .exerciseMusclesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExercisesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function(
        {bool completedWorkoutExercisesRefs,
        bool plannedWorkoutExercisesRefs,
        bool exerciseMusclesRefs})>;
typedef $$CompletedWorkoutExercisesTableCreateCompanionBuilder
    = CompletedWorkoutExercisesCompanion Function({
  Value<String> id,
  required String userId,
  required String workoutId,
  required int exerciseId,
  required int exerciseOrder,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$CompletedWorkoutExercisesTableUpdateCompanionBuilder
    = CompletedWorkoutExercisesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String> workoutId,
  Value<int> exerciseId,
  Value<int> exerciseOrder,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$CompletedWorkoutExercisesTableReferences extends BaseReferences<
    _$AppDatabase, $CompletedWorkoutExercisesTable, CompletedWorkoutExercise> {
  $$CompletedWorkoutExercisesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CompletedWorkoutsTable _workoutIdTable(_$AppDatabase db) =>
      db.completedWorkouts.createAlias($_aliasNameGenerator(
          db.completedWorkoutExercises.workoutId, db.completedWorkouts.id));

  $$CompletedWorkoutsTableProcessedTableManager get workoutId {
    final manager =
        $$CompletedWorkoutsTableTableManager($_db, $_db.completedWorkouts)
            .filter((f) => f.id($_item.workoutId));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias($_aliasNameGenerator(
          db.completedWorkoutExercises.exerciseId, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exerciseId {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exerciseId));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CompletedSetsTable, List<CompletedSet>>
      _completedSetsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.completedSets,
              aliasName: $_aliasNameGenerator(db.completedWorkoutExercises.id,
                  db.completedSets.workoutExerciseId));

  $$CompletedSetsTableProcessedTableManager get completedSetsRefs {
    final manager = $$CompletedSetsTableTableManager($_db, $_db.completedSets)
        .filter((f) => f.workoutExerciseId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_completedSetsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CompletedWorkoutExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $CompletedWorkoutExercisesTable> {
  $$CompletedWorkoutExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseOrder => $composableBuilder(
      column: $table.exerciseOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$CompletedWorkoutsTableFilterComposer get workoutId {
    final $$CompletedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.completedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompletedWorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.completedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> completedSetsRefs(
      Expression<bool> Function($$CompletedSetsTableFilterComposer f) f) {
    final $$CompletedSetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.completedSets,
        getReferencedColumn: (t) => t.workoutExerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompletedSetsTableFilterComposer(
              $db: $db,
              $table: $db.completedSets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CompletedWorkoutExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompletedWorkoutExercisesTable> {
  $$CompletedWorkoutExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseOrder => $composableBuilder(
      column: $table.exerciseOrder,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$CompletedWorkoutsTableOrderingComposer get workoutId {
    final $$CompletedWorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.completedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompletedWorkoutsTableOrderingComposer(
              $db: $db,
              $table: $db.completedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableOrderingComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CompletedWorkoutExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompletedWorkoutExercisesTable> {
  $$CompletedWorkoutExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get exerciseOrder => $composableBuilder(
      column: $table.exerciseOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CompletedWorkoutsTableAnnotationComposer get workoutId {
    final $$CompletedWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workoutId,
            referencedTable: $db.completedWorkouts,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.completedWorkouts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> completedSetsRefs<T extends Object>(
      Expression<T> Function($$CompletedSetsTableAnnotationComposer a) f) {
    final $$CompletedSetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.completedSets,
        getReferencedColumn: (t) => t.workoutExerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CompletedSetsTableAnnotationComposer(
              $db: $db,
              $table: $db.completedSets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CompletedWorkoutExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CompletedWorkoutExercisesTable,
    CompletedWorkoutExercise,
    $$CompletedWorkoutExercisesTableFilterComposer,
    $$CompletedWorkoutExercisesTableOrderingComposer,
    $$CompletedWorkoutExercisesTableAnnotationComposer,
    $$CompletedWorkoutExercisesTableCreateCompanionBuilder,
    $$CompletedWorkoutExercisesTableUpdateCompanionBuilder,
    (CompletedWorkoutExercise, $$CompletedWorkoutExercisesTableReferences),
    CompletedWorkoutExercise,
    PrefetchHooks Function(
        {bool workoutId, bool exerciseId, bool completedSetsRefs})> {
  $$CompletedWorkoutExercisesTableTableManager(
      _$AppDatabase db, $CompletedWorkoutExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompletedWorkoutExercisesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CompletedWorkoutExercisesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompletedWorkoutExercisesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> workoutId = const Value.absent(),
            Value<int> exerciseId = const Value.absent(),
            Value<int> exerciseOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutExercisesCompanion(
            id: id,
            userId: userId,
            workoutId: workoutId,
            exerciseId: exerciseId,
            exerciseOrder: exerciseOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String userId,
            required String workoutId,
            required int exerciseId,
            required int exerciseOrder,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutExercisesCompanion.insert(
            id: id,
            userId: userId,
            workoutId: workoutId,
            exerciseId: exerciseId,
            exerciseOrder: exerciseOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CompletedWorkoutExercisesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workoutId = false,
              exerciseId = false,
              completedSetsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (completedSetsRefs) db.completedSets
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutId,
                    referencedTable: $$CompletedWorkoutExercisesTableReferences
                        ._workoutIdTable(db),
                    referencedColumn: $$CompletedWorkoutExercisesTableReferences
                        ._workoutIdTable(db)
                        .id,
                  ) as T;
                }
                if (exerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseId,
                    referencedTable: $$CompletedWorkoutExercisesTableReferences
                        ._exerciseIdTable(db),
                    referencedColumn: $$CompletedWorkoutExercisesTableReferences
                        ._exerciseIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (completedSetsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CompletedWorkoutExercisesTableReferences
                                ._completedSetsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CompletedWorkoutExercisesTableReferences(
                                    db, table, p0)
                                .completedSetsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutExerciseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CompletedWorkoutExercisesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CompletedWorkoutExercisesTable,
        CompletedWorkoutExercise,
        $$CompletedWorkoutExercisesTableFilterComposer,
        $$CompletedWorkoutExercisesTableOrderingComposer,
        $$CompletedWorkoutExercisesTableAnnotationComposer,
        $$CompletedWorkoutExercisesTableCreateCompanionBuilder,
        $$CompletedWorkoutExercisesTableUpdateCompanionBuilder,
        (CompletedWorkoutExercise, $$CompletedWorkoutExercisesTableReferences),
        CompletedWorkoutExercise,
        PrefetchHooks Function(
            {bool workoutId, bool exerciseId, bool completedSetsRefs})>;
typedef $$CompletedSetsTableCreateCompanionBuilder = CompletedSetsCompanion
    Function({
  Value<String> id,
  required String userId,
  required String workoutExerciseId,
  required int setNumber,
  required int repetitions,
  Value<int?> durationSeconds,
  Value<double?> weight,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$CompletedSetsTableUpdateCompanionBuilder = CompletedSetsCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> workoutExerciseId,
  Value<int> setNumber,
  Value<int> repetitions,
  Value<int?> durationSeconds,
  Value<double?> weight,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$CompletedSetsTableReferences
    extends BaseReferences<_$AppDatabase, $CompletedSetsTable, CompletedSet> {
  $$CompletedSetsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CompletedWorkoutExercisesTable _workoutExerciseIdTable(
          _$AppDatabase db) =>
      db.completedWorkoutExercises.createAlias($_aliasNameGenerator(
          db.completedSets.workoutExerciseId, db.completedWorkoutExercises.id));

  $$CompletedWorkoutExercisesTableProcessedTableManager get workoutExerciseId {
    final manager = $$CompletedWorkoutExercisesTableTableManager(
            $_db, $_db.completedWorkoutExercises)
        .filter((f) => f.id($_item.workoutExerciseId));
    final item = $_typedResult.readTableOrNull(_workoutExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CompletedSetsTableFilterComposer
    extends Composer<_$AppDatabase, $CompletedSetsTable> {
  $$CompletedSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get setNumber => $composableBuilder(
      column: $table.setNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$CompletedWorkoutExercisesTableFilterComposer get workoutExerciseId {
    final $$CompletedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workoutExerciseId,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutExercisesTableFilterComposer(
                  $db: $db,
                  $table: $db.completedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$CompletedSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $CompletedSetsTable> {
  $$CompletedSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get setNumber => $composableBuilder(
      column: $table.setNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$CompletedWorkoutExercisesTableOrderingComposer get workoutExerciseId {
    final $$CompletedWorkoutExercisesTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workoutExerciseId,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutExercisesTableOrderingComposer(
                  $db: $db,
                  $table: $db.completedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$CompletedSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompletedSetsTable> {
  $$CompletedSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CompletedWorkoutExercisesTableAnnotationComposer get workoutExerciseId {
    final $$CompletedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workoutExerciseId,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CompletedWorkoutExercisesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.completedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$CompletedSetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CompletedSetsTable,
    CompletedSet,
    $$CompletedSetsTableFilterComposer,
    $$CompletedSetsTableOrderingComposer,
    $$CompletedSetsTableAnnotationComposer,
    $$CompletedSetsTableCreateCompanionBuilder,
    $$CompletedSetsTableUpdateCompanionBuilder,
    (CompletedSet, $$CompletedSetsTableReferences),
    CompletedSet,
    PrefetchHooks Function({bool workoutExerciseId})> {
  $$CompletedSetsTableTableManager(_$AppDatabase db, $CompletedSetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompletedSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompletedSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompletedSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> workoutExerciseId = const Value.absent(),
            Value<int> setNumber = const Value.absent(),
            Value<int> repetitions = const Value.absent(),
            Value<int?> durationSeconds = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedSetsCompanion(
            id: id,
            userId: userId,
            workoutExerciseId: workoutExerciseId,
            setNumber: setNumber,
            repetitions: repetitions,
            durationSeconds: durationSeconds,
            weight: weight,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String userId,
            required String workoutExerciseId,
            required int setNumber,
            required int repetitions,
            Value<int?> durationSeconds = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedSetsCompanion.insert(
            id: id,
            userId: userId,
            workoutExerciseId: workoutExerciseId,
            setNumber: setNumber,
            repetitions: repetitions,
            durationSeconds: durationSeconds,
            weight: weight,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CompletedSetsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutExerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutExerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutExerciseId,
                    referencedTable: $$CompletedSetsTableReferences
                        ._workoutExerciseIdTable(db),
                    referencedColumn: $$CompletedSetsTableReferences
                        ._workoutExerciseIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CompletedSetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CompletedSetsTable,
    CompletedSet,
    $$CompletedSetsTableFilterComposer,
    $$CompletedSetsTableOrderingComposer,
    $$CompletedSetsTableAnnotationComposer,
    $$CompletedSetsTableCreateCompanionBuilder,
    $$CompletedSetsTableUpdateCompanionBuilder,
    (CompletedSet, $$CompletedSetsTableReferences),
    CompletedSet,
    PrefetchHooks Function({bool workoutExerciseId})>;
typedef $$PlannedWorkoutExercisesTableCreateCompanionBuilder
    = PlannedWorkoutExercisesCompanion Function({
  Value<String> id,
  required String userId,
  required String workoutId,
  required int exerciseId,
  required int exerciseOrder,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$PlannedWorkoutExercisesTableUpdateCompanionBuilder
    = PlannedWorkoutExercisesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String> workoutId,
  Value<int> exerciseId,
  Value<int> exerciseOrder,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$PlannedWorkoutExercisesTableReferences extends BaseReferences<
    _$AppDatabase, $PlannedWorkoutExercisesTable, PlannedWorkoutExercise> {
  $$PlannedWorkoutExercisesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlannedWorkoutsTable _workoutIdTable(_$AppDatabase db) =>
      db.plannedWorkouts.createAlias($_aliasNameGenerator(
          db.plannedWorkoutExercises.workoutId, db.plannedWorkouts.id));

  $$PlannedWorkoutsTableProcessedTableManager get workoutId {
    final manager =
        $$PlannedWorkoutsTableTableManager($_db, $_db.plannedWorkouts)
            .filter((f) => f.id($_item.workoutId));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias($_aliasNameGenerator(
          db.plannedWorkoutExercises.exerciseId, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exerciseId {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exerciseId));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PlannedSetsTable, List<PlannedSet>>
      _plannedSetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.plannedSets,
          aliasName: $_aliasNameGenerator(
              db.plannedWorkoutExercises.id, db.plannedSets.workoutExerciseId));

  $$PlannedSetsTableProcessedTableManager get plannedSetsRefs {
    final manager = $$PlannedSetsTableTableManager($_db, $_db.plannedSets)
        .filter((f) => f.workoutExerciseId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_plannedSetsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlannedWorkoutExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $PlannedWorkoutExercisesTable> {
  $$PlannedWorkoutExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseOrder => $composableBuilder(
      column: $table.exerciseOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$PlannedWorkoutsTableFilterComposer get workoutId {
    final $$PlannedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> plannedSetsRefs(
      Expression<bool> Function($$PlannedSetsTableFilterComposer f) f) {
    final $$PlannedSetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plannedSets,
        getReferencedColumn: (t) => t.workoutExerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedSetsTableFilterComposer(
              $db: $db,
              $table: $db.plannedSets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlannedWorkoutExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlannedWorkoutExercisesTable> {
  $$PlannedWorkoutExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseOrder => $composableBuilder(
      column: $table.exerciseOrder,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$PlannedWorkoutsTableOrderingComposer get workoutId {
    final $$PlannedWorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableOrderingComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableOrderingComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlannedWorkoutExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlannedWorkoutExercisesTable> {
  $$PlannedWorkoutExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get exerciseOrder => $composableBuilder(
      column: $table.exerciseOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PlannedWorkoutsTableAnnotationComposer get workoutId {
    final $$PlannedWorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedWorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.plannedWorkouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> plannedSetsRefs<T extends Object>(
      Expression<T> Function($$PlannedSetsTableAnnotationComposer a) f) {
    final $$PlannedSetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plannedSets,
        getReferencedColumn: (t) => t.workoutExerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlannedSetsTableAnnotationComposer(
              $db: $db,
              $table: $db.plannedSets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlannedWorkoutExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlannedWorkoutExercisesTable,
    PlannedWorkoutExercise,
    $$PlannedWorkoutExercisesTableFilterComposer,
    $$PlannedWorkoutExercisesTableOrderingComposer,
    $$PlannedWorkoutExercisesTableAnnotationComposer,
    $$PlannedWorkoutExercisesTableCreateCompanionBuilder,
    $$PlannedWorkoutExercisesTableUpdateCompanionBuilder,
    (PlannedWorkoutExercise, $$PlannedWorkoutExercisesTableReferences),
    PlannedWorkoutExercise,
    PrefetchHooks Function(
        {bool workoutId, bool exerciseId, bool plannedSetsRefs})> {
  $$PlannedWorkoutExercisesTableTableManager(
      _$AppDatabase db, $PlannedWorkoutExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlannedWorkoutExercisesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$PlannedWorkoutExercisesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlannedWorkoutExercisesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> workoutId = const Value.absent(),
            Value<int> exerciseId = const Value.absent(),
            Value<int> exerciseOrder = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutExercisesCompanion(
            id: id,
            userId: userId,
            workoutId: workoutId,
            exerciseId: exerciseId,
            exerciseOrder: exerciseOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String userId,
            required String workoutId,
            required int exerciseId,
            required int exerciseOrder,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutExercisesCompanion.insert(
            id: id,
            userId: userId,
            workoutId: workoutId,
            exerciseId: exerciseId,
            exerciseOrder: exerciseOrder,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlannedWorkoutExercisesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workoutId = false,
              exerciseId = false,
              plannedSetsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (plannedSetsRefs) db.plannedSets],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutId,
                    referencedTable: $$PlannedWorkoutExercisesTableReferences
                        ._workoutIdTable(db),
                    referencedColumn: $$PlannedWorkoutExercisesTableReferences
                        ._workoutIdTable(db)
                        .id,
                  ) as T;
                }
                if (exerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseId,
                    referencedTable: $$PlannedWorkoutExercisesTableReferences
                        ._exerciseIdTable(db),
                    referencedColumn: $$PlannedWorkoutExercisesTableReferences
                        ._exerciseIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (plannedSetsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PlannedWorkoutExercisesTableReferences
                                ._plannedSetsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlannedWorkoutExercisesTableReferences(
                                    db, table, p0)
                                .plannedSetsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutExerciseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlannedWorkoutExercisesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PlannedWorkoutExercisesTable,
        PlannedWorkoutExercise,
        $$PlannedWorkoutExercisesTableFilterComposer,
        $$PlannedWorkoutExercisesTableOrderingComposer,
        $$PlannedWorkoutExercisesTableAnnotationComposer,
        $$PlannedWorkoutExercisesTableCreateCompanionBuilder,
        $$PlannedWorkoutExercisesTableUpdateCompanionBuilder,
        (PlannedWorkoutExercise, $$PlannedWorkoutExercisesTableReferences),
        PlannedWorkoutExercise,
        PrefetchHooks Function(
            {bool workoutId, bool exerciseId, bool plannedSetsRefs})>;
typedef $$MuscleGroupsTableCreateCompanionBuilder = MuscleGroupsCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$MuscleGroupsTableUpdateCompanionBuilder = MuscleGroupsCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

final class $$MuscleGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $MuscleGroupsTable, MuscleGroup> {
  $$MuscleGroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExerciseMusclesTable, List<ExerciseMuscle>>
      _exerciseMusclesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.exerciseMuscles,
              aliasName: $_aliasNameGenerator(
                  db.muscleGroups.id, db.exerciseMuscles.muscleGroupId));

  $$ExerciseMusclesTableProcessedTableManager get exerciseMusclesRefs {
    final manager =
        $$ExerciseMusclesTableTableManager($_db, $_db.exerciseMuscles)
            .filter((f) => f.muscleGroupId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_exerciseMusclesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MuscleGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $MuscleGroupsTable> {
  $$MuscleGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> exerciseMusclesRefs(
      Expression<bool> Function($$ExerciseMusclesTableFilterComposer f) f) {
    final $$ExerciseMusclesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseMuscles,
        getReferencedColumn: (t) => t.muscleGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseMusclesTableFilterComposer(
              $db: $db,
              $table: $db.exerciseMuscles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MuscleGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $MuscleGroupsTable> {
  $$MuscleGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$MuscleGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MuscleGroupsTable> {
  $$MuscleGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> exerciseMusclesRefs<T extends Object>(
      Expression<T> Function($$ExerciseMusclesTableAnnotationComposer a) f) {
    final $$ExerciseMusclesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseMuscles,
        getReferencedColumn: (t) => t.muscleGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseMusclesTableAnnotationComposer(
              $db: $db,
              $table: $db.exerciseMuscles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MuscleGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MuscleGroupsTable,
    MuscleGroup,
    $$MuscleGroupsTableFilterComposer,
    $$MuscleGroupsTableOrderingComposer,
    $$MuscleGroupsTableAnnotationComposer,
    $$MuscleGroupsTableCreateCompanionBuilder,
    $$MuscleGroupsTableUpdateCompanionBuilder,
    (MuscleGroup, $$MuscleGroupsTableReferences),
    MuscleGroup,
    PrefetchHooks Function({bool exerciseMusclesRefs})> {
  $$MuscleGroupsTableTableManager(_$AppDatabase db, $MuscleGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MuscleGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MuscleGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MuscleGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              MuscleGroupsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              MuscleGroupsCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MuscleGroupsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({exerciseMusclesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (exerciseMusclesRefs) db.exerciseMuscles
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (exerciseMusclesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MuscleGroupsTableReferences
                            ._exerciseMusclesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MuscleGroupsTableReferences(db, table, p0)
                                .exerciseMusclesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.muscleGroupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MuscleGroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MuscleGroupsTable,
    MuscleGroup,
    $$MuscleGroupsTableFilterComposer,
    $$MuscleGroupsTableOrderingComposer,
    $$MuscleGroupsTableAnnotationComposer,
    $$MuscleGroupsTableCreateCompanionBuilder,
    $$MuscleGroupsTableUpdateCompanionBuilder,
    (MuscleGroup, $$MuscleGroupsTableReferences),
    MuscleGroup,
    PrefetchHooks Function({bool exerciseMusclesRefs})>;
typedef $$ExerciseMusclesTableCreateCompanionBuilder = ExerciseMusclesCompanion
    Function({
  required int exerciseId,
  required int muscleGroupId,
  Value<int> rowid,
});
typedef $$ExerciseMusclesTableUpdateCompanionBuilder = ExerciseMusclesCompanion
    Function({
  Value<int> exerciseId,
  Value<int> muscleGroupId,
  Value<int> rowid,
});

final class $$ExerciseMusclesTableReferences extends BaseReferences<
    _$AppDatabase, $ExerciseMusclesTable, ExerciseMuscle> {
  $$ExerciseMusclesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
          $_aliasNameGenerator(db.exerciseMuscles.exerciseId, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exerciseId {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exerciseId));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MuscleGroupsTable _muscleGroupIdTable(_$AppDatabase db) =>
      db.muscleGroups.createAlias($_aliasNameGenerator(
          db.exerciseMuscles.muscleGroupId, db.muscleGroups.id));

  $$MuscleGroupsTableProcessedTableManager get muscleGroupId {
    final manager = $$MuscleGroupsTableTableManager($_db, $_db.muscleGroups)
        .filter((f) => f.id($_item.muscleGroupId));
    final item = $_typedResult.readTableOrNull(_muscleGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExerciseMusclesTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseMusclesTable> {
  $$ExerciseMusclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MuscleGroupsTableFilterComposer get muscleGroupId {
    final $$MuscleGroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleGroupId,
        referencedTable: $db.muscleGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MuscleGroupsTableFilterComposer(
              $db: $db,
              $table: $db.muscleGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExerciseMusclesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseMusclesTable> {
  $$ExerciseMusclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableOrderingComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MuscleGroupsTableOrderingComposer get muscleGroupId {
    final $$MuscleGroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleGroupId,
        referencedTable: $db.muscleGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MuscleGroupsTableOrderingComposer(
              $db: $db,
              $table: $db.muscleGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExerciseMusclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseMusclesTable> {
  $$ExerciseMusclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MuscleGroupsTableAnnotationComposer get muscleGroupId {
    final $$MuscleGroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscleGroupId,
        referencedTable: $db.muscleGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MuscleGroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.muscleGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExerciseMusclesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseMusclesTable,
    ExerciseMuscle,
    $$ExerciseMusclesTableFilterComposer,
    $$ExerciseMusclesTableOrderingComposer,
    $$ExerciseMusclesTableAnnotationComposer,
    $$ExerciseMusclesTableCreateCompanionBuilder,
    $$ExerciseMusclesTableUpdateCompanionBuilder,
    (ExerciseMuscle, $$ExerciseMusclesTableReferences),
    ExerciseMuscle,
    PrefetchHooks Function({bool exerciseId, bool muscleGroupId})> {
  $$ExerciseMusclesTableTableManager(
      _$AppDatabase db, $ExerciseMusclesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseMusclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseMusclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseMusclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> exerciseId = const Value.absent(),
            Value<int> muscleGroupId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseMusclesCompanion(
            exerciseId: exerciseId,
            muscleGroupId: muscleGroupId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int exerciseId,
            required int muscleGroupId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseMusclesCompanion.insert(
            exerciseId: exerciseId,
            muscleGroupId: muscleGroupId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExerciseMusclesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({exerciseId = false, muscleGroupId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (exerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseId,
                    referencedTable:
                        $$ExerciseMusclesTableReferences._exerciseIdTable(db),
                    referencedColumn: $$ExerciseMusclesTableReferences
                        ._exerciseIdTable(db)
                        .id,
                  ) as T;
                }
                if (muscleGroupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.muscleGroupId,
                    referencedTable: $$ExerciseMusclesTableReferences
                        ._muscleGroupIdTable(db),
                    referencedColumn: $$ExerciseMusclesTableReferences
                        ._muscleGroupIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExerciseMusclesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExerciseMusclesTable,
    ExerciseMuscle,
    $$ExerciseMusclesTableFilterComposer,
    $$ExerciseMusclesTableOrderingComposer,
    $$ExerciseMusclesTableAnnotationComposer,
    $$ExerciseMusclesTableCreateCompanionBuilder,
    $$ExerciseMusclesTableUpdateCompanionBuilder,
    (ExerciseMuscle, $$ExerciseMusclesTableReferences),
    ExerciseMuscle,
    PrefetchHooks Function({bool exerciseId, bool muscleGroupId})>;
typedef $$PlannedSetsTableCreateCompanionBuilder = PlannedSetsCompanion
    Function({
  Value<String> id,
  required String userId,
  required String workoutExerciseId,
  required int setNumber,
  required int minRepetitions,
  required int maxRepetitions,
  required double rpe,
  Value<int> rowid,
});
typedef $$PlannedSetsTableUpdateCompanionBuilder = PlannedSetsCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> workoutExerciseId,
  Value<int> setNumber,
  Value<int> minRepetitions,
  Value<int> maxRepetitions,
  Value<double> rpe,
  Value<int> rowid,
});

final class $$PlannedSetsTableReferences
    extends BaseReferences<_$AppDatabase, $PlannedSetsTable, PlannedSet> {
  $$PlannedSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlannedWorkoutExercisesTable _workoutExerciseIdTable(
          _$AppDatabase db) =>
      db.plannedWorkoutExercises.createAlias($_aliasNameGenerator(
          db.plannedSets.workoutExerciseId, db.plannedWorkoutExercises.id));

  $$PlannedWorkoutExercisesTableProcessedTableManager get workoutExerciseId {
    final manager = $$PlannedWorkoutExercisesTableTableManager(
            $_db, $_db.plannedWorkoutExercises)
        .filter((f) => f.id($_item.workoutExerciseId));
    final item = $_typedResult.readTableOrNull(_workoutExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PlannedSetsTableFilterComposer
    extends Composer<_$AppDatabase, $PlannedSetsTable> {
  $$PlannedSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get setNumber => $composableBuilder(
      column: $table.setNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minRepetitions => $composableBuilder(
      column: $table.minRepetitions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxRepetitions => $composableBuilder(
      column: $table.maxRepetitions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rpe => $composableBuilder(
      column: $table.rpe, builder: (column) => ColumnFilters(column));

  $$PlannedWorkoutExercisesTableFilterComposer get workoutExerciseId {
    final $$PlannedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workoutExerciseId,
            referencedTable: $db.plannedWorkoutExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlannedWorkoutExercisesTableFilterComposer(
                  $db: $db,
                  $table: $db.plannedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$PlannedSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlannedSetsTable> {
  $$PlannedSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get setNumber => $composableBuilder(
      column: $table.setNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minRepetitions => $composableBuilder(
      column: $table.minRepetitions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxRepetitions => $composableBuilder(
      column: $table.maxRepetitions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rpe => $composableBuilder(
      column: $table.rpe, builder: (column) => ColumnOrderings(column));

  $$PlannedWorkoutExercisesTableOrderingComposer get workoutExerciseId {
    final $$PlannedWorkoutExercisesTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workoutExerciseId,
            referencedTable: $db.plannedWorkoutExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlannedWorkoutExercisesTableOrderingComposer(
                  $db: $db,
                  $table: $db.plannedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$PlannedSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlannedSetsTable> {
  $$PlannedSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get minRepetitions => $composableBuilder(
      column: $table.minRepetitions, builder: (column) => column);

  GeneratedColumn<int> get maxRepetitions => $composableBuilder(
      column: $table.maxRepetitions, builder: (column) => column);

  GeneratedColumn<double> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  $$PlannedWorkoutExercisesTableAnnotationComposer get workoutExerciseId {
    final $$PlannedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workoutExerciseId,
            referencedTable: $db.plannedWorkoutExercises,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlannedWorkoutExercisesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.plannedWorkoutExercises,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$PlannedSetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlannedSetsTable,
    PlannedSet,
    $$PlannedSetsTableFilterComposer,
    $$PlannedSetsTableOrderingComposer,
    $$PlannedSetsTableAnnotationComposer,
    $$PlannedSetsTableCreateCompanionBuilder,
    $$PlannedSetsTableUpdateCompanionBuilder,
    (PlannedSet, $$PlannedSetsTableReferences),
    PlannedSet,
    PrefetchHooks Function({bool workoutExerciseId})> {
  $$PlannedSetsTableTableManager(_$AppDatabase db, $PlannedSetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlannedSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlannedSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlannedSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> workoutExerciseId = const Value.absent(),
            Value<int> setNumber = const Value.absent(),
            Value<int> minRepetitions = const Value.absent(),
            Value<int> maxRepetitions = const Value.absent(),
            Value<double> rpe = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedSetsCompanion(
            id: id,
            userId: userId,
            workoutExerciseId: workoutExerciseId,
            setNumber: setNumber,
            minRepetitions: minRepetitions,
            maxRepetitions: maxRepetitions,
            rpe: rpe,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String userId,
            required String workoutExerciseId,
            required int setNumber,
            required int minRepetitions,
            required int maxRepetitions,
            required double rpe,
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedSetsCompanion.insert(
            id: id,
            userId: userId,
            workoutExerciseId: workoutExerciseId,
            setNumber: setNumber,
            minRepetitions: minRepetitions,
            maxRepetitions: maxRepetitions,
            rpe: rpe,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlannedSetsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutExerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutExerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutExerciseId,
                    referencedTable: $$PlannedSetsTableReferences
                        ._workoutExerciseIdTable(db),
                    referencedColumn: $$PlannedSetsTableReferences
                        ._workoutExerciseIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PlannedSetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlannedSetsTable,
    PlannedSet,
    $$PlannedSetsTableFilterComposer,
    $$PlannedSetsTableOrderingComposer,
    $$PlannedSetsTableAnnotationComposer,
    $$PlannedSetsTableCreateCompanionBuilder,
    $$PlannedSetsTableUpdateCompanionBuilder,
    (PlannedSet, $$PlannedSetsTableReferences),
    PlannedSet,
    PrefetchHooks Function({bool workoutExerciseId})>;
typedef $$UserPreferencesTableTableCreateCompanionBuilder
    = UserPreferencesTableCompanion Function({
  required String userId,
  required bool isDarkMode,
  required bool isMetric,
  Value<int> rowid,
});
typedef $$UserPreferencesTableTableUpdateCompanionBuilder
    = UserPreferencesTableCompanion Function({
  Value<String> userId,
  Value<bool> isDarkMode,
  Value<bool> isMetric,
  Value<int> rowid,
});

class $$UserPreferencesTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserPreferencesTableTable> {
  $$UserPreferencesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDarkMode => $composableBuilder(
      column: $table.isDarkMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMetric => $composableBuilder(
      column: $table.isMetric, builder: (column) => ColumnFilters(column));
}

class $$UserPreferencesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserPreferencesTableTable> {
  $$UserPreferencesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDarkMode => $composableBuilder(
      column: $table.isDarkMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMetric => $composableBuilder(
      column: $table.isMetric, builder: (column) => ColumnOrderings(column));
}

class $$UserPreferencesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserPreferencesTableTable> {
  $$UserPreferencesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get isDarkMode => $composableBuilder(
      column: $table.isDarkMode, builder: (column) => column);

  GeneratedColumn<bool> get isMetric =>
      $composableBuilder(column: $table.isMetric, builder: (column) => column);
}

class $$UserPreferencesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserPreferencesTableTable,
    UserPreferences,
    $$UserPreferencesTableTableFilterComposer,
    $$UserPreferencesTableTableOrderingComposer,
    $$UserPreferencesTableTableAnnotationComposer,
    $$UserPreferencesTableTableCreateCompanionBuilder,
    $$UserPreferencesTableTableUpdateCompanionBuilder,
    (
      UserPreferences,
      BaseReferences<_$AppDatabase, $UserPreferencesTableTable, UserPreferences>
    ),
    UserPreferences,
    PrefetchHooks Function()> {
  $$UserPreferencesTableTableTableManager(
      _$AppDatabase db, $UserPreferencesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserPreferencesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserPreferencesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserPreferencesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<bool> isDarkMode = const Value.absent(),
            Value<bool> isMetric = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserPreferencesTableCompanion(
            userId: userId,
            isDarkMode: isDarkMode,
            isMetric: isMetric,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required bool isDarkMode,
            required bool isMetric,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserPreferencesTableCompanion.insert(
            userId: userId,
            isDarkMode: isDarkMode,
            isMetric: isMetric,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserPreferencesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $UserPreferencesTableTable,
        UserPreferences,
        $$UserPreferencesTableTableFilterComposer,
        $$UserPreferencesTableTableOrderingComposer,
        $$UserPreferencesTableTableAnnotationComposer,
        $$UserPreferencesTableTableCreateCompanionBuilder,
        $$UserPreferencesTableTableUpdateCompanionBuilder,
        (
          UserPreferences,
          BaseReferences<_$AppDatabase, $UserPreferencesTableTable,
              UserPreferences>
        ),
        UserPreferences,
        PrefetchHooks Function()>;
typedef $$UserWorkoutPlansTableTableCreateCompanionBuilder
    = UserWorkoutPlansTableCompanion Function({
  required String userId,
  required String workoutPlanId,
  Value<int> rowid,
});
typedef $$UserWorkoutPlansTableTableUpdateCompanionBuilder
    = UserWorkoutPlansTableCompanion Function({
  Value<String> userId,
  Value<String> workoutPlanId,
  Value<int> rowid,
});

final class $$UserWorkoutPlansTableTableReferences extends BaseReferences<
    _$AppDatabase, $UserWorkoutPlansTableTable, UserWorkoutPlansTableData> {
  $$UserWorkoutPlansTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutPlansTable _workoutPlanIdTable(_$AppDatabase db) =>
      db.workoutPlans.createAlias($_aliasNameGenerator(
          db.userWorkoutPlansTable.workoutPlanId, db.workoutPlans.id));

  $$WorkoutPlansTableProcessedTableManager get workoutPlanId {
    final manager = $$WorkoutPlansTableTableManager($_db, $_db.workoutPlans)
        .filter((f) => f.id($_item.workoutPlanId));
    final item = $_typedResult.readTableOrNull(_workoutPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$UserWorkoutPlansTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserWorkoutPlansTableTable> {
  $$UserWorkoutPlansTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  $$WorkoutPlansTableFilterComposer get workoutPlanId {
    final $$WorkoutPlansTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutPlansTableFilterComposer(
              $db: $db,
              $table: $db.workoutPlans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserWorkoutPlansTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserWorkoutPlansTableTable> {
  $$UserWorkoutPlansTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  $$WorkoutPlansTableOrderingComposer get workoutPlanId {
    final $$WorkoutPlansTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutPlansTableOrderingComposer(
              $db: $db,
              $table: $db.workoutPlans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserWorkoutPlansTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserWorkoutPlansTableTable> {
  $$UserWorkoutPlansTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  $$WorkoutPlansTableAnnotationComposer get workoutPlanId {
    final $$WorkoutPlansTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutPlanId,
        referencedTable: $db.workoutPlans,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutPlansTableAnnotationComposer(
              $db: $db,
              $table: $db.workoutPlans,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UserWorkoutPlansTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserWorkoutPlansTableTable,
    UserWorkoutPlansTableData,
    $$UserWorkoutPlansTableTableFilterComposer,
    $$UserWorkoutPlansTableTableOrderingComposer,
    $$UserWorkoutPlansTableTableAnnotationComposer,
    $$UserWorkoutPlansTableTableCreateCompanionBuilder,
    $$UserWorkoutPlansTableTableUpdateCompanionBuilder,
    (UserWorkoutPlansTableData, $$UserWorkoutPlansTableTableReferences),
    UserWorkoutPlansTableData,
    PrefetchHooks Function({bool workoutPlanId})> {
  $$UserWorkoutPlansTableTableTableManager(
      _$AppDatabase db, $UserWorkoutPlansTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserWorkoutPlansTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$UserWorkoutPlansTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserWorkoutPlansTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<String> workoutPlanId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWorkoutPlansTableCompanion(
            userId: userId,
            workoutPlanId: workoutPlanId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String workoutPlanId,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWorkoutPlansTableCompanion.insert(
            userId: userId,
            workoutPlanId: workoutPlanId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserWorkoutPlansTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutPlanId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutPlanId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutPlanId,
                    referencedTable: $$UserWorkoutPlansTableTableReferences
                        ._workoutPlanIdTable(db),
                    referencedColumn: $$UserWorkoutPlansTableTableReferences
                        ._workoutPlanIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$UserWorkoutPlansTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $UserWorkoutPlansTableTable,
        UserWorkoutPlansTableData,
        $$UserWorkoutPlansTableTableFilterComposer,
        $$UserWorkoutPlansTableTableOrderingComposer,
        $$UserWorkoutPlansTableTableAnnotationComposer,
        $$UserWorkoutPlansTableTableCreateCompanionBuilder,
        $$UserWorkoutPlansTableTableUpdateCompanionBuilder,
        (UserWorkoutPlansTableData, $$UserWorkoutPlansTableTableReferences),
        UserWorkoutPlansTableData,
        PrefetchHooks Function({bool workoutPlanId})>;
typedef $$OfflineUserDataTableTableCreateCompanionBuilder
    = OfflineUserDataTableCompanion Function({
  required String userId,
  Value<int> rowid,
});
typedef $$OfflineUserDataTableTableUpdateCompanionBuilder
    = OfflineUserDataTableCompanion Function({
  Value<String> userId,
  Value<int> rowid,
});

class $$OfflineUserDataTableTableFilterComposer
    extends Composer<_$AppDatabase, $OfflineUserDataTableTable> {
  $$OfflineUserDataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));
}

class $$OfflineUserDataTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OfflineUserDataTableTable> {
  $$OfflineUserDataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));
}

class $$OfflineUserDataTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfflineUserDataTableTable> {
  $$OfflineUserDataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);
}

class $$OfflineUserDataTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OfflineUserDataTableTable,
    OfflineUserData,
    $$OfflineUserDataTableTableFilterComposer,
    $$OfflineUserDataTableTableOrderingComposer,
    $$OfflineUserDataTableTableAnnotationComposer,
    $$OfflineUserDataTableTableCreateCompanionBuilder,
    $$OfflineUserDataTableTableUpdateCompanionBuilder,
    (
      OfflineUserData,
      BaseReferences<_$AppDatabase, $OfflineUserDataTableTable, OfflineUserData>
    ),
    OfflineUserData,
    PrefetchHooks Function()> {
  $$OfflineUserDataTableTableTableManager(
      _$AppDatabase db, $OfflineUserDataTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflineUserDataTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflineUserDataTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflineUserDataTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineUserDataTableCompanion(
            userId: userId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineUserDataTableCompanion.insert(
            userId: userId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OfflineUserDataTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $OfflineUserDataTableTable,
        OfflineUserData,
        $$OfflineUserDataTableTableFilterComposer,
        $$OfflineUserDataTableTableOrderingComposer,
        $$OfflineUserDataTableTableAnnotationComposer,
        $$OfflineUserDataTableTableCreateCompanionBuilder,
        $$OfflineUserDataTableTableUpdateCompanionBuilder,
        (
          OfflineUserData,
          BaseReferences<_$AppDatabase, $OfflineUserDataTableTable,
              OfflineUserData>
        ),
        OfflineUserData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorkoutPlansTableTableManager get workoutPlans =>
      $$WorkoutPlansTableTableManager(_db, _db.workoutPlans);
  $$PlannedWorkoutsTableTableManager get plannedWorkouts =>
      $$PlannedWorkoutsTableTableManager(_db, _db.plannedWorkouts);
  $$CompletedWorkoutsTableTableManager get completedWorkouts =>
      $$CompletedWorkoutsTableTableManager(_db, _db.completedWorkouts);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$CompletedWorkoutExercisesTableTableManager get completedWorkoutExercises =>
      $$CompletedWorkoutExercisesTableTableManager(
          _db, _db.completedWorkoutExercises);
  $$CompletedSetsTableTableManager get completedSets =>
      $$CompletedSetsTableTableManager(_db, _db.completedSets);
  $$PlannedWorkoutExercisesTableTableManager get plannedWorkoutExercises =>
      $$PlannedWorkoutExercisesTableTableManager(
          _db, _db.plannedWorkoutExercises);
  $$MuscleGroupsTableTableManager get muscleGroups =>
      $$MuscleGroupsTableTableManager(_db, _db.muscleGroups);
  $$ExerciseMusclesTableTableManager get exerciseMuscles =>
      $$ExerciseMusclesTableTableManager(_db, _db.exerciseMuscles);
  $$PlannedSetsTableTableManager get plannedSets =>
      $$PlannedSetsTableTableManager(_db, _db.plannedSets);
  $$UserPreferencesTableTableTableManager get userPreferencesTable =>
      $$UserPreferencesTableTableTableManager(_db, _db.userPreferencesTable);
  $$UserWorkoutPlansTableTableTableManager get userWorkoutPlansTable =>
      $$UserWorkoutPlansTableTableTableManager(_db, _db.userWorkoutPlansTable);
  $$OfflineUserDataTableTableTableManager get offlineUserDataTable =>
      $$OfflineUserDataTableTableTableManager(_db, _db.offlineUserDataTable);
}
