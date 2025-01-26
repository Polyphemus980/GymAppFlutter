// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WorkoutPlansTable extends WorkoutPlans
    with TableInfo<$WorkoutPlansTable, WorkoutPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
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
  static const VerificationMeta _num_weeksMeta =
      const VerificationMeta('num_weeks');
  @override
  late final GeneratedColumn<int> num_weeks = GeneratedColumn<int>(
      'num_weeks', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _days_per_weekMeta =
      const VerificationMeta('days_per_week');
  @override
  late final GeneratedColumn<int> days_per_week = GeneratedColumn<int>(
      'days_per_week', aliasedName, false,
      check: () => ComparableExpr(days_per_week).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        description,
        name,
        num_weeks,
        days_per_week,
        created_at,
        updated_at
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
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
      context.handle(_num_weeksMeta,
          num_weeks.isAcceptableOrUnknown(data['num_weeks']!, _num_weeksMeta));
    } else if (isInserting) {
      context.missing(_num_weeksMeta);
    }
    if (data.containsKey('days_per_week')) {
      context.handle(
          _days_per_weekMeta,
          days_per_week.isAcceptableOrUnknown(
              data['days_per_week']!, _days_per_weekMeta));
    } else if (isInserting) {
      context.missing(_days_per_weekMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlan(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      num_weeks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num_weeks'])!,
      days_per_week: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}days_per_week'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $WorkoutPlansTable createAlias(String alias) {
    return $WorkoutPlansTable(attachedDatabase, alias);
  }
}

class WorkoutPlansCompanion extends UpdateCompanion<WorkoutPlan> {
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String> user_id;
  final Value<String> description;
  final Value<String> name;
  final Value<int> num_weeks;
  final Value<int> days_per_week;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<int> rowid;
  const WorkoutPlansCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.description = const Value.absent(),
    this.name = const Value.absent(),
    this.num_weeks = const Value.absent(),
    this.days_per_week = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutPlansCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    required String user_id,
    required String description,
    required String name,
    required int num_weeks,
    required int days_per_week,
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        description = Value(description),
        name = Value(name),
        num_weeks = Value(num_weeks),
        days_per_week = Value(days_per_week);
  static Insertable<WorkoutPlan> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? description,
    Expression<String>? name,
    Expression<int>? num_weeks,
    Expression<int>? days_per_week,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (num_weeks != null) 'num_weeks': num_weeks,
      if (days_per_week != null) 'days_per_week': days_per_week,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutPlansCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String>? user_id,
      Value<String>? description,
      Value<String>? name,
      Value<int>? num_weeks,
      Value<int>? days_per_week,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<int>? rowid}) {
    return WorkoutPlansCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      description: description ?? this.description,
      name: name ?? this.name,
      num_weeks: num_weeks ?? this.num_weeks,
      days_per_week: days_per_week ?? this.days_per_week,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (num_weeks.present) {
      map['num_weeks'] = Variable<int>(num_weeks.value);
    }
    if (days_per_week.present) {
      map['days_per_week'] = Variable<int>(days_per_week.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlansCompanion(')
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('description: $description, ')
          ..write('name: $name, ')
          ..write('num_weeks: $num_weeks, ')
          ..write('days_per_week: $days_per_week, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workout_plan_idMeta =
      const VerificationMeta('workout_plan_id');
  @override
  late final GeneratedColumn<String> workout_plan_id = GeneratedColumn<String>(
      'workout_plan_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout_plans (id)'));
  static const VerificationMeta _workout_nameMeta =
      const VerificationMeta('workout_name');
  @override
  late final GeneratedColumn<String> workout_name = GeneratedColumn<String>(
      'workout_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _day_numberMeta =
      const VerificationMeta('day_number');
  @override
  late final GeneratedColumn<int> day_number = GeneratedColumn<int>(
      'day_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _week_numberMeta =
      const VerificationMeta('week_number');
  @override
  late final GeneratedColumn<int> week_number = GeneratedColumn<int>(
      'week_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        workout_plan_id,
        workout_name,
        day_number,
        week_number,
        description,
        created_at,
        updated_at
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('workout_plan_id')) {
      context.handle(
          _workout_plan_idMeta,
          workout_plan_id.isAcceptableOrUnknown(
              data['workout_plan_id']!, _workout_plan_idMeta));
    } else if (isInserting) {
      context.missing(_workout_plan_idMeta);
    }
    if (data.containsKey('workout_name')) {
      context.handle(
          _workout_nameMeta,
          workout_name.isAcceptableOrUnknown(
              data['workout_name']!, _workout_nameMeta));
    }
    if (data.containsKey('day_number')) {
      context.handle(
          _day_numberMeta,
          day_number.isAcceptableOrUnknown(
              data['day_number']!, _day_numberMeta));
    } else if (isInserting) {
      context.missing(_day_numberMeta);
    }
    if (data.containsKey('week_number')) {
      context.handle(
          _week_numberMeta,
          week_number.isAcceptableOrUnknown(
              data['week_number']!, _week_numberMeta));
    } else if (isInserting) {
      context.missing(_week_numberMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlannedWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannedWorkout(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workout_plan_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_plan_id'])!,
      workout_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_name']),
      day_number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_number'])!,
      week_number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}week_number'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $PlannedWorkoutsTable createAlias(String alias) {
    return $PlannedWorkoutsTable(attachedDatabase, alias);
  }
}

class PlannedWorkoutsCompanion extends UpdateCompanion<PlannedWorkout> {
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String> user_id;
  final Value<String> workout_plan_id;
  final Value<String?> workout_name;
  final Value<int> day_number;
  final Value<int> week_number;
  final Value<String?> description;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<int> rowid;
  const PlannedWorkoutsCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.workout_plan_id = const Value.absent(),
    this.workout_name = const Value.absent(),
    this.day_number = const Value.absent(),
    this.week_number = const Value.absent(),
    this.description = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannedWorkoutsCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    required String user_id,
    required String workout_plan_id,
    this.workout_name = const Value.absent(),
    required int day_number,
    required int week_number,
    this.description = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        workout_plan_id = Value(workout_plan_id),
        day_number = Value(day_number),
        week_number = Value(week_number);
  static Insertable<PlannedWorkout> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? workout_plan_id,
    Expression<String>? workout_name,
    Expression<int>? day_number,
    Expression<int>? week_number,
    Expression<String>? description,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (workout_plan_id != null) 'workout_plan_id': workout_plan_id,
      if (workout_name != null) 'workout_name': workout_name,
      if (day_number != null) 'day_number': day_number,
      if (week_number != null) 'week_number': week_number,
      if (description != null) 'description': description,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannedWorkoutsCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String>? user_id,
      Value<String>? workout_plan_id,
      Value<String?>? workout_name,
      Value<int>? day_number,
      Value<int>? week_number,
      Value<String?>? description,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<int>? rowid}) {
    return PlannedWorkoutsCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      workout_plan_id: workout_plan_id ?? this.workout_plan_id,
      workout_name: workout_name ?? this.workout_name,
      day_number: day_number ?? this.day_number,
      week_number: week_number ?? this.week_number,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (workout_plan_id.present) {
      map['workout_plan_id'] = Variable<String>(workout_plan_id.value);
    }
    if (workout_name.present) {
      map['workout_name'] = Variable<String>(workout_name.value);
    }
    if (day_number.present) {
      map['day_number'] = Variable<int>(day_number.value);
    }
    if (week_number.present) {
      map['week_number'] = Variable<int>(week_number.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannedWorkoutsCompanion(')
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('workout_plan_id: $workout_plan_id, ')
          ..write('workout_name: $workout_name, ')
          ..write('day_number: $day_number, ')
          ..write('week_number: $week_number, ')
          ..write('description: $description, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _planned_workout_idMeta =
      const VerificationMeta('planned_workout_id');
  @override
  late final GeneratedColumn<String> planned_workout_id =
      GeneratedColumn<String>('planned_workout_id', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES planned_workouts (id)'));
  static const VerificationMeta _workout_nameMeta =
      const VerificationMeta('workout_name');
  @override
  late final GeneratedColumn<String> workout_name = GeneratedColumn<String>(
      'workout_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _workout_dateMeta =
      const VerificationMeta('workout_date');
  @override
  late final GeneratedColumn<DateTime> workout_date = GeneratedColumn<DateTime>(
      'workout_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _start_timeMeta =
      const VerificationMeta('start_time');
  @override
  late final GeneratedColumn<DateTime> start_time = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _end_timeMeta =
      const VerificationMeta('end_time');
  @override
  late final GeneratedColumn<DateTime> end_time = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _total_durationMeta =
      const VerificationMeta('total_duration');
  @override
  late final GeneratedColumn<int> total_duration = GeneratedColumn<int>(
      'total_duration', aliasedName, true,
      check: () => ComparableExpr(total_duration).isBiggerThanValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        planned_workout_id,
        workout_name,
        workout_date,
        start_time,
        end_time,
        total_duration,
        notes,
        created_at,
        updated_at
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('planned_workout_id')) {
      context.handle(
          _planned_workout_idMeta,
          planned_workout_id.isAcceptableOrUnknown(
              data['planned_workout_id']!, _planned_workout_idMeta));
    }
    if (data.containsKey('workout_name')) {
      context.handle(
          _workout_nameMeta,
          workout_name.isAcceptableOrUnknown(
              data['workout_name']!, _workout_nameMeta));
    }
    if (data.containsKey('workout_date')) {
      context.handle(
          _workout_dateMeta,
          workout_date.isAcceptableOrUnknown(
              data['workout_date']!, _workout_dateMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(
          _start_timeMeta,
          start_time.isAcceptableOrUnknown(
              data['start_time']!, _start_timeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_end_timeMeta,
          end_time.isAcceptableOrUnknown(data['end_time']!, _end_timeMeta));
    }
    if (data.containsKey('total_duration')) {
      context.handle(
          _total_durationMeta,
          total_duration.isAcceptableOrUnknown(
              data['total_duration']!, _total_durationMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompletedWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletedWorkout(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      planned_workout_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}planned_workout_id']),
      workout_name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_name']),
      workout_date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}workout_date'])!,
      start_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      end_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      total_duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_duration']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $CompletedWorkoutsTable createAlias(String alias) {
    return $CompletedWorkoutsTable(attachedDatabase, alias);
  }
}

class CompletedWorkoutsCompanion extends UpdateCompanion<CompletedWorkout> {
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String> user_id;
  final Value<String?> planned_workout_id;
  final Value<String?> workout_name;
  final Value<DateTime> workout_date;
  final Value<DateTime?> start_time;
  final Value<DateTime?> end_time;
  final Value<int?> total_duration;
  final Value<String?> notes;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<int> rowid;
  const CompletedWorkoutsCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.planned_workout_id = const Value.absent(),
    this.workout_name = const Value.absent(),
    this.workout_date = const Value.absent(),
    this.start_time = const Value.absent(),
    this.end_time = const Value.absent(),
    this.total_duration = const Value.absent(),
    this.notes = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletedWorkoutsCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    required String user_id,
    this.planned_workout_id = const Value.absent(),
    this.workout_name = const Value.absent(),
    this.workout_date = const Value.absent(),
    this.start_time = const Value.absent(),
    this.end_time = const Value.absent(),
    this.total_duration = const Value.absent(),
    this.notes = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id);
  static Insertable<CompletedWorkout> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? planned_workout_id,
    Expression<String>? workout_name,
    Expression<DateTime>? workout_date,
    Expression<DateTime>? start_time,
    Expression<DateTime>? end_time,
    Expression<int>? total_duration,
    Expression<String>? notes,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (planned_workout_id != null) 'planned_workout_id': planned_workout_id,
      if (workout_name != null) 'workout_name': workout_name,
      if (workout_date != null) 'workout_date': workout_date,
      if (start_time != null) 'start_time': start_time,
      if (end_time != null) 'end_time': end_time,
      if (total_duration != null) 'total_duration': total_duration,
      if (notes != null) 'notes': notes,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletedWorkoutsCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String>? user_id,
      Value<String?>? planned_workout_id,
      Value<String?>? workout_name,
      Value<DateTime>? workout_date,
      Value<DateTime?>? start_time,
      Value<DateTime?>? end_time,
      Value<int?>? total_duration,
      Value<String?>? notes,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<int>? rowid}) {
    return CompletedWorkoutsCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      planned_workout_id: planned_workout_id ?? this.planned_workout_id,
      workout_name: workout_name ?? this.workout_name,
      workout_date: workout_date ?? this.workout_date,
      start_time: start_time ?? this.start_time,
      end_time: end_time ?? this.end_time,
      total_duration: total_duration ?? this.total_duration,
      notes: notes ?? this.notes,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (planned_workout_id.present) {
      map['planned_workout_id'] = Variable<String>(planned_workout_id.value);
    }
    if (workout_name.present) {
      map['workout_name'] = Variable<String>(workout_name.value);
    }
    if (workout_date.present) {
      map['workout_date'] = Variable<DateTime>(workout_date.value);
    }
    if (start_time.present) {
      map['start_time'] = Variable<DateTime>(start_time.value);
    }
    if (end_time.present) {
      map['end_time'] = Variable<DateTime>(end_time.value);
    }
    if (total_duration.present) {
      map['total_duration'] = Variable<int>(total_duration.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletedWorkoutsCompanion(')
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('planned_workout_id: $planned_workout_id, ')
          ..write('workout_name: $workout_name, ')
          ..write('workout_date: $workout_date, ')
          ..write('start_time: $start_time, ')
          ..write('end_time: $end_time, ')
          ..write('total_duration: $total_duration, ')
          ..write('notes: $notes, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _start_position_image_pathMeta =
      const VerificationMeta('start_position_image_path');
  @override
  late final GeneratedColumn<String> start_position_image_path =
      GeneratedColumn<String>('start_position_image_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _end_position_image_pathMeta =
      const VerificationMeta('end_position_image_path');
  @override
  late final GeneratedColumn<String> end_position_image_path =
      GeneratedColumn<String>('end_position_image_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        name,
        description,
        start_position_image_path,
        end_position_image_path,
        created_at,
        updated_at
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
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
          _start_position_image_pathMeta,
          start_position_image_path.isAcceptableOrUnknown(
              data['start_position_image_path']!,
              _start_position_image_pathMeta));
    }
    if (data.containsKey('end_position_image_path')) {
      context.handle(
          _end_position_image_pathMeta,
          end_position_image_path.isAcceptableOrUnknown(
              data['end_position_image_path']!, _end_position_image_pathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      start_position_image_path: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}start_position_image_path']),
      end_position_image_path: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}end_position_image_path']),
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String?> user_id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> start_position_image_path;
  final Value<String?> end_position_image_path;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.start_position_image_path = const Value.absent(),
    this.end_position_image_path = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.start_position_image_path = const Value.absent(),
    this.end_position_image_path = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        name = Value(name);
  static Insertable<Exercise> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? start_position_image_path,
    Expression<String>? end_position_image_path,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (start_position_image_path != null)
        'start_position_image_path': start_position_image_path,
      if (end_position_image_path != null)
        'end_position_image_path': end_position_image_path,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String?>? user_id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? start_position_image_path,
      Value<String?>? end_position_image_path,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<int>? rowid}) {
    return ExercisesCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      description: description ?? this.description,
      start_position_image_path:
          start_position_image_path ?? this.start_position_image_path,
      end_position_image_path:
          end_position_image_path ?? this.end_position_image_path,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (start_position_image_path.present) {
      map['start_position_image_path'] =
          Variable<String>(start_position_image_path.value);
    }
    if (end_position_image_path.present) {
      map['end_position_image_path'] =
          Variable<String>(end_position_image_path.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('start_position_image_path: $start_position_image_path, ')
          ..write('end_position_image_path: $end_position_image_path, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workout_idMeta =
      const VerificationMeta('workout_id');
  @override
  late final GeneratedColumn<String> workout_id = GeneratedColumn<String>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES completed_workouts (id)'));
  static const VerificationMeta _exercise_idMeta =
      const VerificationMeta('exercise_id');
  @override
  late final GeneratedColumn<String> exercise_id = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _exercise_orderMeta =
      const VerificationMeta('exercise_order');
  @override
  late final GeneratedColumn<int> exercise_order = GeneratedColumn<int>(
      'exercise_order', aliasedName, false,
      check: () => ComparableExpr(exercise_order).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        workout_id,
        exercise_id,
        exercise_order,
        created_at,
        updated_at,
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(
          _workout_idMeta,
          workout_id.isAcceptableOrUnknown(
              data['workout_id']!, _workout_idMeta));
    } else if (isInserting) {
      context.missing(_workout_idMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exercise_idMeta,
          exercise_id.isAcceptableOrUnknown(
              data['exercise_id']!, _exercise_idMeta));
    } else if (isInserting) {
      context.missing(_exercise_idMeta);
    }
    if (data.containsKey('exercise_order')) {
      context.handle(
          _exercise_orderMeta,
          exercise_order.isAcceptableOrUnknown(
              data['exercise_order']!, _exercise_orderMeta));
    } else if (isInserting) {
      context.missing(_exercise_orderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompletedWorkoutExercise map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletedWorkoutExercise(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      workout_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id'])!,
      exercise_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
      exercise_order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_order'])!,
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      updated_at: attachedDatabase.typeMapping
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
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String> user_id;
  final Value<String> workout_id;
  final Value<String> exercise_id;
  final Value<int> exercise_order;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<String?> notes;
  final Value<int> rowid;
  const CompletedWorkoutExercisesCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.workout_id = const Value.absent(),
    this.exercise_id = const Value.absent(),
    this.exercise_order = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletedWorkoutExercisesCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    required String user_id,
    required String workout_id,
    required String exercise_id,
    required int exercise_order,
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        workout_id = Value(workout_id),
        exercise_id = Value(exercise_id),
        exercise_order = Value(exercise_order);
  static Insertable<CompletedWorkoutExercise> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? workout_id,
    Expression<String>? exercise_id,
    Expression<int>? exercise_order,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (workout_id != null) 'workout_id': workout_id,
      if (exercise_id != null) 'exercise_id': exercise_id,
      if (exercise_order != null) 'exercise_order': exercise_order,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletedWorkoutExercisesCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String>? user_id,
      Value<String>? workout_id,
      Value<String>? exercise_id,
      Value<int>? exercise_order,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return CompletedWorkoutExercisesCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      workout_id: workout_id ?? this.workout_id,
      exercise_id: exercise_id ?? this.exercise_id,
      exercise_order: exercise_order ?? this.exercise_order,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (workout_id.present) {
      map['workout_id'] = Variable<String>(workout_id.value);
    }
    if (exercise_id.present) {
      map['exercise_id'] = Variable<String>(exercise_id.value);
    }
    if (exercise_order.present) {
      map['exercise_order'] = Variable<int>(exercise_order.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
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
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('workout_id: $workout_id, ')
          ..write('exercise_id: $exercise_id, ')
          ..write('exercise_order: $exercise_order, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workout_exercise_idMeta =
      const VerificationMeta('workout_exercise_id');
  @override
  late final GeneratedColumn<String> workout_exercise_id =
      GeneratedColumn<String>('workout_exercise_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES completed_workout_exercises (id)'));
  static const VerificationMeta _set_numberMeta =
      const VerificationMeta('set_number');
  @override
  late final GeneratedColumn<int> set_number = GeneratedColumn<int>(
      'set_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _duration_secondsMeta =
      const VerificationMeta('duration_seconds');
  @override
  late final GeneratedColumn<int> duration_seconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        workout_exercise_id,
        set_number,
        repetitions,
        duration_seconds,
        weight,
        created_at,
        updated_at
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('workout_exercise_id')) {
      context.handle(
          _workout_exercise_idMeta,
          workout_exercise_id.isAcceptableOrUnknown(
              data['workout_exercise_id']!, _workout_exercise_idMeta));
    } else if (isInserting) {
      context.missing(_workout_exercise_idMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
          _set_numberMeta,
          set_number.isAcceptableOrUnknown(
              data['set_number']!, _set_numberMeta));
    } else if (isInserting) {
      context.missing(_set_numberMeta);
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
          _duration_secondsMeta,
          duration_seconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _duration_secondsMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompletedSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletedSet(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workout_exercise_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_exercise_id'])!,
      set_number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_number'])!,
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetitions'])!,
      duration_seconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $CompletedSetsTable createAlias(String alias) {
    return $CompletedSetsTable(attachedDatabase, alias);
  }
}

class CompletedSetsCompanion extends UpdateCompanion<CompletedSet> {
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String> user_id;
  final Value<String> workout_exercise_id;
  final Value<int> set_number;
  final Value<int> repetitions;
  final Value<int?> duration_seconds;
  final Value<double?> weight;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<int> rowid;
  const CompletedSetsCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.workout_exercise_id = const Value.absent(),
    this.set_number = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.duration_seconds = const Value.absent(),
    this.weight = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompletedSetsCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    required String user_id,
    required String workout_exercise_id,
    required int set_number,
    required int repetitions,
    this.duration_seconds = const Value.absent(),
    this.weight = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        workout_exercise_id = Value(workout_exercise_id),
        set_number = Value(set_number),
        repetitions = Value(repetitions);
  static Insertable<CompletedSet> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? workout_exercise_id,
    Expression<int>? set_number,
    Expression<int>? repetitions,
    Expression<int>? duration_seconds,
    Expression<double>? weight,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (workout_exercise_id != null)
        'workout_exercise_id': workout_exercise_id,
      if (set_number != null) 'set_number': set_number,
      if (repetitions != null) 'repetitions': repetitions,
      if (duration_seconds != null) 'duration_seconds': duration_seconds,
      if (weight != null) 'weight': weight,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompletedSetsCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String>? user_id,
      Value<String>? workout_exercise_id,
      Value<int>? set_number,
      Value<int>? repetitions,
      Value<int?>? duration_seconds,
      Value<double?>? weight,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<int>? rowid}) {
    return CompletedSetsCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      workout_exercise_id: workout_exercise_id ?? this.workout_exercise_id,
      set_number: set_number ?? this.set_number,
      repetitions: repetitions ?? this.repetitions,
      duration_seconds: duration_seconds ?? this.duration_seconds,
      weight: weight ?? this.weight,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (workout_exercise_id.present) {
      map['workout_exercise_id'] = Variable<String>(workout_exercise_id.value);
    }
    if (set_number.present) {
      map['set_number'] = Variable<int>(set_number.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (duration_seconds.present) {
      map['duration_seconds'] = Variable<int>(duration_seconds.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletedSetsCompanion(')
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('workout_exercise_id: $workout_exercise_id, ')
          ..write('set_number: $set_number, ')
          ..write('repetitions: $repetitions, ')
          ..write('duration_seconds: $duration_seconds, ')
          ..write('weight: $weight, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workout_idMeta =
      const VerificationMeta('workout_id');
  @override
  late final GeneratedColumn<String> workout_id = GeneratedColumn<String>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES planned_workouts (id)'));
  static const VerificationMeta _exercise_idMeta =
      const VerificationMeta('exercise_id');
  @override
  late final GeneratedColumn<String> exercise_id = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _exercise_orderMeta =
      const VerificationMeta('exercise_order');
  @override
  late final GeneratedColumn<int> exercise_order = GeneratedColumn<int>(
      'exercise_order', aliasedName, false,
      check: () => ComparableExpr(exercise_order).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _created_atMeta =
      const VerificationMeta('created_at');
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updated_atMeta =
      const VerificationMeta('updated_at');
  @override
  late final GeneratedColumn<DateTime> updated_at = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        workout_id,
        exercise_id,
        exercise_order,
        created_at,
        updated_at
      ];
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(
          _workout_idMeta,
          workout_id.isAcceptableOrUnknown(
              data['workout_id']!, _workout_idMeta));
    } else if (isInserting) {
      context.missing(_workout_idMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exercise_idMeta,
          exercise_id.isAcceptableOrUnknown(
              data['exercise_id']!, _exercise_idMeta));
    } else if (isInserting) {
      context.missing(_exercise_idMeta);
    }
    if (data.containsKey('exercise_order')) {
      context.handle(
          _exercise_orderMeta,
          exercise_order.isAcceptableOrUnknown(
              data['exercise_order']!, _exercise_orderMeta));
    } else if (isInserting) {
      context.missing(_exercise_orderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at']!, _created_atMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
          _updated_atMeta,
          updated_at.isAcceptableOrUnknown(
              data['updated_at']!, _updated_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlannedWorkoutExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannedWorkoutExercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      workout_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id'])!,
      exercise_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
      exercise_order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_order'])!,
      created_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updated_at: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
    );
  }

  @override
  $PlannedWorkoutExercisesTable createAlias(String alias) {
    return $PlannedWorkoutExercisesTable(attachedDatabase, alias);
  }
}

class PlannedWorkoutExercisesCompanion
    extends UpdateCompanion<PlannedWorkoutExercise> {
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String> user_id;
  final Value<String> workout_id;
  final Value<String> exercise_id;
  final Value<int> exercise_order;
  final Value<DateTime> created_at;
  final Value<DateTime?> updated_at;
  final Value<int> rowid;
  const PlannedWorkoutExercisesCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.workout_id = const Value.absent(),
    this.exercise_id = const Value.absent(),
    this.exercise_order = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannedWorkoutExercisesCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    required String user_id,
    required String workout_id,
    required String exercise_id,
    required int exercise_order,
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        workout_id = Value(workout_id),
        exercise_id = Value(exercise_id),
        exercise_order = Value(exercise_order);
  static Insertable<PlannedWorkoutExercise> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? workout_id,
    Expression<String>? exercise_id,
    Expression<int>? exercise_order,
    Expression<DateTime>? created_at,
    Expression<DateTime>? updated_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (workout_id != null) 'workout_id': workout_id,
      if (exercise_id != null) 'exercise_id': exercise_id,
      if (exercise_order != null) 'exercise_order': exercise_order,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannedWorkoutExercisesCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String>? user_id,
      Value<String>? workout_id,
      Value<String>? exercise_id,
      Value<int>? exercise_order,
      Value<DateTime>? created_at,
      Value<DateTime?>? updated_at,
      Value<int>? rowid}) {
    return PlannedWorkoutExercisesCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      workout_id: workout_id ?? this.workout_id,
      exercise_id: exercise_id ?? this.exercise_id,
      exercise_order: exercise_order ?? this.exercise_order,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (workout_id.present) {
      map['workout_id'] = Variable<String>(workout_id.value);
    }
    if (exercise_id.present) {
      map['exercise_id'] = Variable<String>(exercise_id.value);
    }
    if (exercise_order.present) {
      map['exercise_order'] = Variable<int>(exercise_order.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<DateTime>(updated_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlannedWorkoutExercisesCompanion(')
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('workout_id: $workout_id, ')
          ..write('exercise_id: $exercise_id, ')
          ..write('exercise_order: $exercise_order, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _exercise_idMeta =
      const VerificationMeta('exercise_id');
  @override
  late final GeneratedColumn<String> exercise_id = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id) ON DELETE CASCADE'));
  static const VerificationMeta _muscle_group_idMeta =
      const VerificationMeta('muscle_group_id');
  @override
  late final GeneratedColumn<int> muscle_group_id = GeneratedColumn<int>(
      'muscle_group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES muscle_groups (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [dirty, exercise_id, muscle_group_id];
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exercise_idMeta,
          exercise_id.isAcceptableOrUnknown(
              data['exercise_id']!, _exercise_idMeta));
    } else if (isInserting) {
      context.missing(_exercise_idMeta);
    }
    if (data.containsKey('muscle_group_id')) {
      context.handle(
          _muscle_group_idMeta,
          muscle_group_id.isAcceptableOrUnknown(
              data['muscle_group_id']!, _muscle_group_idMeta));
    } else if (isInserting) {
      context.missing(_muscle_group_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {exercise_id, muscle_group_id};
  @override
  ExerciseMuscle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseMuscle(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      exercise_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
      muscle_group_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}muscle_group_id'])!,
    );
  }

  @override
  $ExerciseMusclesTable createAlias(String alias) {
    return $ExerciseMusclesTable(attachedDatabase, alias);
  }
}

class ExerciseMuscle extends DataClass implements Insertable<ExerciseMuscle> {
  final bool dirty;
  final String exercise_id;
  final int muscle_group_id;
  const ExerciseMuscle(
      {required this.dirty,
      required this.exercise_id,
      required this.muscle_group_id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dirty'] = Variable<bool>(dirty);
    map['exercise_id'] = Variable<String>(exercise_id);
    map['muscle_group_id'] = Variable<int>(muscle_group_id);
    return map;
  }

  ExerciseMusclesCompanion toCompanion(bool nullToAbsent) {
    return ExerciseMusclesCompanion(
      dirty: Value(dirty),
      exercise_id: Value(exercise_id),
      muscle_group_id: Value(muscle_group_id),
    );
  }

  factory ExerciseMuscle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseMuscle(
      dirty: serializer.fromJson<bool>(json['dirty']),
      exercise_id: serializer.fromJson<String>(json['exercise_id']),
      muscle_group_id: serializer.fromJson<int>(json['muscle_group_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dirty': serializer.toJson<bool>(dirty),
      'exercise_id': serializer.toJson<String>(exercise_id),
      'muscle_group_id': serializer.toJson<int>(muscle_group_id),
    };
  }

  ExerciseMuscle copyWith(
          {bool? dirty, String? exercise_id, int? muscle_group_id}) =>
      ExerciseMuscle(
        dirty: dirty ?? this.dirty,
        exercise_id: exercise_id ?? this.exercise_id,
        muscle_group_id: muscle_group_id ?? this.muscle_group_id,
      );
  ExerciseMuscle copyWithCompanion(ExerciseMusclesCompanion data) {
    return ExerciseMuscle(
      dirty: data.dirty.present ? data.dirty.value : this.dirty,
      exercise_id:
          data.exercise_id.present ? data.exercise_id.value : this.exercise_id,
      muscle_group_id: data.muscle_group_id.present
          ? data.muscle_group_id.value
          : this.muscle_group_id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseMuscle(')
          ..write('dirty: $dirty, ')
          ..write('exercise_id: $exercise_id, ')
          ..write('muscle_group_id: $muscle_group_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dirty, exercise_id, muscle_group_id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseMuscle &&
          other.dirty == this.dirty &&
          other.exercise_id == this.exercise_id &&
          other.muscle_group_id == this.muscle_group_id);
}

class ExerciseMusclesCompanion extends UpdateCompanion<ExerciseMuscle> {
  final Value<bool> dirty;
  final Value<String> exercise_id;
  final Value<int> muscle_group_id;
  final Value<int> rowid;
  const ExerciseMusclesCompanion({
    this.dirty = const Value.absent(),
    this.exercise_id = const Value.absent(),
    this.muscle_group_id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseMusclesCompanion.insert({
    required bool dirty,
    required String exercise_id,
    required int muscle_group_id,
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        exercise_id = Value(exercise_id),
        muscle_group_id = Value(muscle_group_id);
  static Insertable<ExerciseMuscle> custom({
    Expression<bool>? dirty,
    Expression<String>? exercise_id,
    Expression<int>? muscle_group_id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (exercise_id != null) 'exercise_id': exercise_id,
      if (muscle_group_id != null) 'muscle_group_id': muscle_group_id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseMusclesCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? exercise_id,
      Value<int>? muscle_group_id,
      Value<int>? rowid}) {
    return ExerciseMusclesCompanion(
      dirty: dirty ?? this.dirty,
      exercise_id: exercise_id ?? this.exercise_id,
      muscle_group_id: muscle_group_id ?? this.muscle_group_id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (exercise_id.present) {
      map['exercise_id'] = Variable<String>(exercise_id.value);
    }
    if (muscle_group_id.present) {
      map['muscle_group_id'] = Variable<int>(muscle_group_id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseMusclesCompanion(')
          ..write('dirty: $dirty, ')
          ..write('exercise_id: $exercise_id, ')
          ..write('muscle_group_id: $muscle_group_id, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workout_exercise_idMeta =
      const VerificationMeta('workout_exercise_id');
  @override
  late final GeneratedColumn<String> workout_exercise_id =
      GeneratedColumn<String>('workout_exercise_id', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES planned_workout_exercises (id)'));
  static const VerificationMeta _set_numberMeta =
      const VerificationMeta('set_number');
  @override
  late final GeneratedColumn<int> set_number = GeneratedColumn<int>(
      'set_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _min_repetitionsMeta =
      const VerificationMeta('min_repetitions');
  @override
  late final GeneratedColumn<int> min_repetitions = GeneratedColumn<int>(
      'min_repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _max_repetitionsMeta =
      const VerificationMeta('max_repetitions');
  @override
  late final GeneratedColumn<int> max_repetitions = GeneratedColumn<int>(
      'max_repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
      'rpe', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        dirty,
        id,
        user_id,
        workout_exercise_id,
        set_number,
        min_repetitions,
        max_repetitions,
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('workout_exercise_id')) {
      context.handle(
          _workout_exercise_idMeta,
          workout_exercise_id.isAcceptableOrUnknown(
              data['workout_exercise_id']!, _workout_exercise_idMeta));
    } else if (isInserting) {
      context.missing(_workout_exercise_idMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
          _set_numberMeta,
          set_number.isAcceptableOrUnknown(
              data['set_number']!, _set_numberMeta));
    } else if (isInserting) {
      context.missing(_set_numberMeta);
    }
    if (data.containsKey('min_repetitions')) {
      context.handle(
          _min_repetitionsMeta,
          min_repetitions.isAcceptableOrUnknown(
              data['min_repetitions']!, _min_repetitionsMeta));
    } else if (isInserting) {
      context.missing(_min_repetitionsMeta);
    }
    if (data.containsKey('max_repetitions')) {
      context.handle(
          _max_repetitionsMeta,
          max_repetitions.isAcceptableOrUnknown(
              data['max_repetitions']!, _max_repetitionsMeta));
    } else if (isInserting) {
      context.missing(_max_repetitionsMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlannedSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlannedSet(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      rpe: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rpe'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workout_exercise_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_exercise_id'])!,
      set_number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_number'])!,
      min_repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_repetitions'])!,
      max_repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_repetitions'])!,
    );
  }

  @override
  $PlannedSetsTable createAlias(String alias) {
    return $PlannedSetsTable(attachedDatabase, alias);
  }
}

class PlannedSetsCompanion extends UpdateCompanion<PlannedSet> {
  final Value<bool> dirty;
  final Value<String> id;
  final Value<String> user_id;
  final Value<String> workout_exercise_id;
  final Value<int> set_number;
  final Value<int> min_repetitions;
  final Value<int> max_repetitions;
  final Value<double> rpe;
  final Value<int> rowid;
  const PlannedSetsCompanion({
    this.dirty = const Value.absent(),
    this.id = const Value.absent(),
    this.user_id = const Value.absent(),
    this.workout_exercise_id = const Value.absent(),
    this.set_number = const Value.absent(),
    this.min_repetitions = const Value.absent(),
    this.max_repetitions = const Value.absent(),
    this.rpe = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlannedSetsCompanion.insert({
    required bool dirty,
    this.id = const Value.absent(),
    required String user_id,
    required String workout_exercise_id,
    required int set_number,
    required int min_repetitions,
    required int max_repetitions,
    required double rpe,
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        workout_exercise_id = Value(workout_exercise_id),
        set_number = Value(set_number),
        min_repetitions = Value(min_repetitions),
        max_repetitions = Value(max_repetitions),
        rpe = Value(rpe);
  static Insertable<PlannedSet> custom({
    Expression<bool>? dirty,
    Expression<String>? id,
    Expression<String>? user_id,
    Expression<String>? workout_exercise_id,
    Expression<int>? set_number,
    Expression<int>? min_repetitions,
    Expression<int>? max_repetitions,
    Expression<double>? rpe,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (id != null) 'id': id,
      if (user_id != null) 'user_id': user_id,
      if (workout_exercise_id != null)
        'workout_exercise_id': workout_exercise_id,
      if (set_number != null) 'set_number': set_number,
      if (min_repetitions != null) 'min_repetitions': min_repetitions,
      if (max_repetitions != null) 'max_repetitions': max_repetitions,
      if (rpe != null) 'rpe': rpe,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlannedSetsCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? id,
      Value<String>? user_id,
      Value<String>? workout_exercise_id,
      Value<int>? set_number,
      Value<int>? min_repetitions,
      Value<int>? max_repetitions,
      Value<double>? rpe,
      Value<int>? rowid}) {
    return PlannedSetsCompanion(
      dirty: dirty ?? this.dirty,
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      workout_exercise_id: workout_exercise_id ?? this.workout_exercise_id,
      set_number: set_number ?? this.set_number,
      min_repetitions: min_repetitions ?? this.min_repetitions,
      max_repetitions: max_repetitions ?? this.max_repetitions,
      rpe: rpe ?? this.rpe,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (workout_exercise_id.present) {
      map['workout_exercise_id'] = Variable<String>(workout_exercise_id.value);
    }
    if (set_number.present) {
      map['set_number'] = Variable<int>(set_number.value);
    }
    if (min_repetitions.present) {
      map['min_repetitions'] = Variable<int>(min_repetitions.value);
    }
    if (max_repetitions.present) {
      map['max_repetitions'] = Variable<int>(max_repetitions.value);
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
          ..write('dirty: $dirty, ')
          ..write('id: $id, ')
          ..write('user_id: $user_id, ')
          ..write('workout_exercise_id: $workout_exercise_id, ')
          ..write('set_number: $set_number, ')
          ..write('min_repetitions: $min_repetitions, ')
          ..write('max_repetitions: $max_repetitions, ')
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
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _is_dark_modeMeta =
      const VerificationMeta('is_dark_mode');
  @override
  late final GeneratedColumn<bool> is_dark_mode = GeneratedColumn<bool>(
      'is_dark_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_dark_mode" IN (0, 1))'));
  static const VerificationMeta _is_metricMeta =
      const VerificationMeta('is_metric');
  @override
  late final GeneratedColumn<bool> is_metric = GeneratedColumn<bool>(
      'is_metric', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_metric" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [dirty, user_id, is_dark_mode, is_metric];
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
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('is_dark_mode')) {
      context.handle(
          _is_dark_modeMeta,
          is_dark_mode.isAcceptableOrUnknown(
              data['is_dark_mode']!, _is_dark_modeMeta));
    } else if (isInserting) {
      context.missing(_is_dark_modeMeta);
    }
    if (data.containsKey('is_metric')) {
      context.handle(_is_metricMeta,
          is_metric.isAcceptableOrUnknown(data['is_metric']!, _is_metricMeta));
    } else if (isInserting) {
      context.missing(_is_metricMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {user_id};
  @override
  UserPreferences map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPreferences(
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      is_dark_mode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dark_mode'])!,
      is_metric: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_metric'])!,
    );
  }

  @override
  $UserPreferencesTableTable createAlias(String alias) {
    return $UserPreferencesTableTable(attachedDatabase, alias);
  }
}

class UserPreferencesTableCompanion extends UpdateCompanion<UserPreferences> {
  final Value<bool> dirty;
  final Value<String> user_id;
  final Value<bool> is_dark_mode;
  final Value<bool> is_metric;
  final Value<int> rowid;
  const UserPreferencesTableCompanion({
    this.dirty = const Value.absent(),
    this.user_id = const Value.absent(),
    this.is_dark_mode = const Value.absent(),
    this.is_metric = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPreferencesTableCompanion.insert({
    required bool dirty,
    required String user_id,
    required bool is_dark_mode,
    required bool is_metric,
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        is_dark_mode = Value(is_dark_mode),
        is_metric = Value(is_metric);
  static Insertable<UserPreferences> custom({
    Expression<bool>? dirty,
    Expression<String>? user_id,
    Expression<bool>? is_dark_mode,
    Expression<bool>? is_metric,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (user_id != null) 'user_id': user_id,
      if (is_dark_mode != null) 'is_dark_mode': is_dark_mode,
      if (is_metric != null) 'is_metric': is_metric,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPreferencesTableCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? user_id,
      Value<bool>? is_dark_mode,
      Value<bool>? is_metric,
      Value<int>? rowid}) {
    return UserPreferencesTableCompanion(
      dirty: dirty ?? this.dirty,
      user_id: user_id ?? this.user_id,
      is_dark_mode: is_dark_mode ?? this.is_dark_mode,
      is_metric: is_metric ?? this.is_metric,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (is_dark_mode.present) {
      map['is_dark_mode'] = Variable<bool>(is_dark_mode.value);
    }
    if (is_metric.present) {
      map['is_metric'] = Variable<bool>(is_metric.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPreferencesTableCompanion(')
          ..write('dirty: $dirty, ')
          ..write('user_id: $user_id, ')
          ..write('is_dark_mode: $is_dark_mode, ')
          ..write('is_metric: $is_metric, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserWorkoutPlansTableTable extends UserWorkoutPlansTable
    with TableInfo<$UserWorkoutPlansTableTable, UserWorkoutPlans> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserWorkoutPlansTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
      'dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("dirty" IN (0, 1))'));
  static const VerificationMeta _user_idMeta =
      const VerificationMeta('user_id');
  @override
  late final GeneratedColumn<String> user_id = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workout_plan_idMeta =
      const VerificationMeta('workout_plan_id');
  @override
  late final GeneratedColumn<String> workout_plan_id = GeneratedColumn<String>(
      'workout_plan_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workout_plans (id) ON DELETE CASCADE'));
  static const VerificationMeta _current_weekMeta =
      const VerificationMeta('current_week');
  @override
  late final GeneratedColumn<int> current_week = GeneratedColumn<int>(
      'current_week', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _current_dayMeta =
      const VerificationMeta('current_day');
  @override
  late final GeneratedColumn<int> current_day = GeneratedColumn<int>(
      'current_day', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [dirty, user_id, workout_plan_id, current_week, current_day];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_workout_plans_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserWorkoutPlans> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dirty')) {
      context.handle(
          _dirtyMeta, dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta));
    } else if (isInserting) {
      context.missing(_dirtyMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_user_idMeta,
          user_id.isAcceptableOrUnknown(data['user_id']!, _user_idMeta));
    } else if (isInserting) {
      context.missing(_user_idMeta);
    }
    if (data.containsKey('workout_plan_id')) {
      context.handle(
          _workout_plan_idMeta,
          workout_plan_id.isAcceptableOrUnknown(
              data['workout_plan_id']!, _workout_plan_idMeta));
    } else if (isInserting) {
      context.missing(_workout_plan_idMeta);
    }
    if (data.containsKey('current_week')) {
      context.handle(
          _current_weekMeta,
          current_week.isAcceptableOrUnknown(
              data['current_week']!, _current_weekMeta));
    }
    if (data.containsKey('current_day')) {
      context.handle(
          _current_dayMeta,
          current_day.isAcceptableOrUnknown(
              data['current_day']!, _current_dayMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {user_id, workout_plan_id};
  @override
  UserWorkoutPlans map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserWorkoutPlans(
      user_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      workout_plan_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}workout_plan_id'])!,
      dirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}dirty'])!,
      current_week: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_week'])!,
      current_day: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_day'])!,
    );
  }

  @override
  $UserWorkoutPlansTableTable createAlias(String alias) {
    return $UserWorkoutPlansTableTable(attachedDatabase, alias);
  }
}

class UserWorkoutPlansTableCompanion extends UpdateCompanion<UserWorkoutPlans> {
  final Value<bool> dirty;
  final Value<String> user_id;
  final Value<String> workout_plan_id;
  final Value<int> current_week;
  final Value<int> current_day;
  final Value<int> rowid;
  const UserWorkoutPlansTableCompanion({
    this.dirty = const Value.absent(),
    this.user_id = const Value.absent(),
    this.workout_plan_id = const Value.absent(),
    this.current_week = const Value.absent(),
    this.current_day = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserWorkoutPlansTableCompanion.insert({
    required bool dirty,
    required String user_id,
    required String workout_plan_id,
    this.current_week = const Value.absent(),
    this.current_day = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dirty = Value(dirty),
        user_id = Value(user_id),
        workout_plan_id = Value(workout_plan_id);
  static Insertable<UserWorkoutPlans> custom({
    Expression<bool>? dirty,
    Expression<String>? user_id,
    Expression<String>? workout_plan_id,
    Expression<int>? current_week,
    Expression<int>? current_day,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dirty != null) 'dirty': dirty,
      if (user_id != null) 'user_id': user_id,
      if (workout_plan_id != null) 'workout_plan_id': workout_plan_id,
      if (current_week != null) 'current_week': current_week,
      if (current_day != null) 'current_day': current_day,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserWorkoutPlansTableCompanion copyWith(
      {Value<bool>? dirty,
      Value<String>? user_id,
      Value<String>? workout_plan_id,
      Value<int>? current_week,
      Value<int>? current_day,
      Value<int>? rowid}) {
    return UserWorkoutPlansTableCompanion(
      dirty: dirty ?? this.dirty,
      user_id: user_id ?? this.user_id,
      workout_plan_id: workout_plan_id ?? this.workout_plan_id,
      current_week: current_week ?? this.current_week,
      current_day: current_day ?? this.current_day,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (user_id.present) {
      map['user_id'] = Variable<String>(user_id.value);
    }
    if (workout_plan_id.present) {
      map['workout_plan_id'] = Variable<String>(workout_plan_id.value);
    }
    if (current_week.present) {
      map['current_week'] = Variable<int>(current_week.value);
    }
    if (current_day.present) {
      map['current_day'] = Variable<int>(current_day.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserWorkoutPlansTableCompanion(')
          ..write('dirty: $dirty, ')
          ..write('user_id: $user_id, ')
          ..write('workout_plan_id: $workout_plan_id, ')
          ..write('current_week: $current_week, ')
          ..write('current_day: $current_day, ')
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, email];
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
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
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
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $OfflineUserDataTableTable createAlias(String alias) {
    return $OfflineUserDataTableTable(attachedDatabase, alias);
  }
}

class OfflineUserDataTableCompanion extends UpdateCompanion<OfflineUserData> {
  final Value<String> userId;
  final Value<String> email;
  final Value<int> rowid;
  const OfflineUserDataTableCompanion({
    this.userId = const Value.absent(),
    this.email = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfflineUserDataTableCompanion.insert({
    required String userId,
    required String email,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        email = Value(email);
  static Insertable<OfflineUserData> custom({
    Expression<String>? userId,
    Expression<String>? email,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (email != null) 'email': email,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfflineUserDataTableCompanion copyWith(
      {Value<String>? userId, Value<String>? email, Value<int>? rowid}) {
    return OfflineUserDataTableCompanion(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
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
          ..write('email: $email, ')
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
  required bool dirty,
  Value<String> id,
  required String user_id,
  required String description,
  required String name,
  required int num_weeks,
  required int days_per_week,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});
typedef $$WorkoutPlansTableUpdateCompanionBuilder = WorkoutPlansCompanion
    Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String> user_id,
  Value<String> description,
  Value<String> name,
  Value<int> num_weeks,
  Value<int> days_per_week,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});

final class $$WorkoutPlansTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutPlansTable, WorkoutPlan> {
  $$WorkoutPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlannedWorkoutsTable, List<PlannedWorkout>>
      _plannedWorkoutsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.plannedWorkouts,
              aliasName: $_aliasNameGenerator(
                  db.workoutPlans.id, db.plannedWorkouts.workout_plan_id));

  $$PlannedWorkoutsTableProcessedTableManager get plannedWorkoutsRefs {
    final manager =
        $$PlannedWorkoutsTableTableManager($_db, $_db.plannedWorkouts)
            .filter((f) => f.workout_plan_id.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_plannedWorkoutsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$UserWorkoutPlansTableTable,
      List<UserWorkoutPlans>> _userWorkoutPlansTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.userWorkoutPlansTable,
          aliasName: $_aliasNameGenerator(
              db.workoutPlans.id, db.userWorkoutPlansTable.workout_plan_id));

  $$UserWorkoutPlansTableTableProcessedTableManager
      get userWorkoutPlansTableRefs {
    final manager = $$UserWorkoutPlansTableTableTableManager(
            $_db, $_db.userWorkoutPlansTable)
        .filter((f) => f.workout_plan_id.id($_item.id));

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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get num_weeks => $composableBuilder(
      column: $table.num_weeks, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get days_per_week => $composableBuilder(
      column: $table.days_per_week, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnFilters(column));

  Expression<bool> plannedWorkoutsRefs(
      Expression<bool> Function($$PlannedWorkoutsTableFilterComposer f) f) {
    final $$PlannedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.workout_plan_id,
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
            getReferencedColumn: (t) => t.workout_plan_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get num_weeks => $composableBuilder(
      column: $table.num_weeks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get days_per_week => $composableBuilder(
      column: $table.days_per_week,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get num_weeks =>
      $composableBuilder(column: $table.num_weeks, builder: (column) => column);

  GeneratedColumn<int> get days_per_week => $composableBuilder(
      column: $table.days_per_week, builder: (column) => column);

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => column);

  GeneratedColumn<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => column);

  Expression<T> plannedWorkoutsRefs<T extends Object>(
      Expression<T> Function($$PlannedWorkoutsTableAnnotationComposer a) f) {
    final $$PlannedWorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plannedWorkouts,
        getReferencedColumn: (t) => t.workout_plan_id,
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
            getReferencedColumn: (t) => t.workout_plan_id,
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> num_weeks = const Value.absent(),
            Value<int> days_per_week = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            description: description,
            name: name,
            num_weeks: num_weeks,
            days_per_week: days_per_week,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            required String user_id,
            required String description,
            required String name,
            required int num_weeks,
            required int days_per_week,
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutPlansCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            description: description,
            name: name,
            num_weeks: num_weeks,
            days_per_week: days_per_week,
            created_at: created_at,
            updated_at: updated_at,
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
                                .where((e) => e.workout_plan_id == item.id),
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
                                .where((e) => e.workout_plan_id == item.id),
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
  required bool dirty,
  Value<String> id,
  required String user_id,
  required String workout_plan_id,
  Value<String?> workout_name,
  required int day_number,
  required int week_number,
  Value<String?> description,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});
typedef $$PlannedWorkoutsTableUpdateCompanionBuilder = PlannedWorkoutsCompanion
    Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String> user_id,
  Value<String> workout_plan_id,
  Value<String?> workout_name,
  Value<int> day_number,
  Value<int> week_number,
  Value<String?> description,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});

final class $$PlannedWorkoutsTableReferences extends BaseReferences<
    _$AppDatabase, $PlannedWorkoutsTable, PlannedWorkout> {
  $$PlannedWorkoutsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutPlansTable _workout_plan_idTable(_$AppDatabase db) =>
      db.workoutPlans.createAlias($_aliasNameGenerator(
          db.plannedWorkouts.workout_plan_id, db.workoutPlans.id));

  $$WorkoutPlansTableProcessedTableManager get workout_plan_id {
    final manager = $$WorkoutPlansTableTableManager($_db, $_db.workoutPlans)
        .filter((f) => f.id($_item.workout_plan_id!));
    final item = $_typedResult.readTableOrNull(_workout_plan_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CompletedWorkoutsTable, List<CompletedWorkout>>
      _completedWorkoutsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.completedWorkouts,
              aliasName: $_aliasNameGenerator(db.plannedWorkouts.id,
                  db.completedWorkouts.planned_workout_id));

  $$CompletedWorkoutsTableProcessedTableManager get completedWorkoutsRefs {
    final manager =
        $$CompletedWorkoutsTableTableManager($_db, $_db.completedWorkouts)
            .filter((f) => f.planned_workout_id.id($_item.id));

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
              db.plannedWorkouts.id, db.plannedWorkoutExercises.workout_id));

  $$PlannedWorkoutExercisesTableProcessedTableManager
      get plannedWorkoutExercisesRefs {
    final manager = $$PlannedWorkoutExercisesTableTableManager(
            $_db, $_db.plannedWorkoutExercises)
        .filter((f) => f.workout_id.id($_item.id));

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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workout_name => $composableBuilder(
      column: $table.workout_name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get day_number => $composableBuilder(
      column: $table.day_number, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get week_number => $composableBuilder(
      column: $table.week_number, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnFilters(column));

  $$WorkoutPlansTableFilterComposer get workout_plan_id {
    final $$WorkoutPlansTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_plan_id,
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
        getReferencedColumn: (t) => t.planned_workout_id,
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
            getReferencedColumn: (t) => t.workout_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workout_name => $composableBuilder(
      column: $table.workout_name,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get day_number => $composableBuilder(
      column: $table.day_number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get week_number => $composableBuilder(
      column: $table.week_number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnOrderings(column));

  $$WorkoutPlansTableOrderingComposer get workout_plan_id {
    final $$WorkoutPlansTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_plan_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<String> get workout_name => $composableBuilder(
      column: $table.workout_name, builder: (column) => column);

  GeneratedColumn<int> get day_number => $composableBuilder(
      column: $table.day_number, builder: (column) => column);

  GeneratedColumn<int> get week_number => $composableBuilder(
      column: $table.week_number, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => column);

  GeneratedColumn<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => column);

  $$WorkoutPlansTableAnnotationComposer get workout_plan_id {
    final $$WorkoutPlansTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_plan_id,
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
            getReferencedColumn: (t) => t.planned_workout_id,
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
            getReferencedColumn: (t) => t.workout_id,
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
        {bool workout_plan_id,
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String> workout_plan_id = const Value.absent(),
            Value<String?> workout_name = const Value.absent(),
            Value<int> day_number = const Value.absent(),
            Value<int> week_number = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutsCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_plan_id: workout_plan_id,
            workout_name: workout_name,
            day_number: day_number,
            week_number: week_number,
            description: description,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            required String user_id,
            required String workout_plan_id,
            Value<String?> workout_name = const Value.absent(),
            required int day_number,
            required int week_number,
            Value<String?> description = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutsCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_plan_id: workout_plan_id,
            workout_name: workout_name,
            day_number: day_number,
            week_number: week_number,
            description: description,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlannedWorkoutsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workout_plan_id = false,
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
                if (workout_plan_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workout_plan_id,
                    referencedTable: $$PlannedWorkoutsTableReferences
                        ._workout_plan_idTable(db),
                    referencedColumn: $$PlannedWorkoutsTableReferences
                        ._workout_plan_idTable(db)
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
                                .where((e) => e.planned_workout_id == item.id),
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
                                .where((e) => e.workout_id == item.id),
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
        {bool workout_plan_id,
        bool completedWorkoutsRefs,
        bool plannedWorkoutExercisesRefs})>;
typedef $$CompletedWorkoutsTableCreateCompanionBuilder
    = CompletedWorkoutsCompanion Function({
  required bool dirty,
  Value<String> id,
  required String user_id,
  Value<String?> planned_workout_id,
  Value<String?> workout_name,
  Value<DateTime> workout_date,
  Value<DateTime?> start_time,
  Value<DateTime?> end_time,
  Value<int?> total_duration,
  Value<String?> notes,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});
typedef $$CompletedWorkoutsTableUpdateCompanionBuilder
    = CompletedWorkoutsCompanion Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String> user_id,
  Value<String?> planned_workout_id,
  Value<String?> workout_name,
  Value<DateTime> workout_date,
  Value<DateTime?> start_time,
  Value<DateTime?> end_time,
  Value<int?> total_duration,
  Value<String?> notes,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});

final class $$CompletedWorkoutsTableReferences extends BaseReferences<
    _$AppDatabase, $CompletedWorkoutsTable, CompletedWorkout> {
  $$CompletedWorkoutsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlannedWorkoutsTable _planned_workout_idTable(_$AppDatabase db) =>
      db.plannedWorkouts.createAlias($_aliasNameGenerator(
          db.completedWorkouts.planned_workout_id, db.plannedWorkouts.id));

  $$PlannedWorkoutsTableProcessedTableManager? get planned_workout_id {
    if ($_item.planned_workout_id == null) return null;
    final manager =
        $$PlannedWorkoutsTableTableManager($_db, $_db.plannedWorkouts)
            .filter((f) => f.id($_item.planned_workout_id!));
    final item = $_typedResult.readTableOrNull(_planned_workout_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CompletedWorkoutExercisesTable,
      List<CompletedWorkoutExercise>> _completedWorkoutExercisesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.completedWorkoutExercises,
          aliasName: $_aliasNameGenerator(db.completedWorkouts.id,
              db.completedWorkoutExercises.workout_id));

  $$CompletedWorkoutExercisesTableProcessedTableManager
      get completedWorkoutExercisesRefs {
    final manager = $$CompletedWorkoutExercisesTableTableManager(
            $_db, $_db.completedWorkoutExercises)
        .filter((f) => f.workout_id.id($_item.id));

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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get workout_name => $composableBuilder(
      column: $table.workout_name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get workout_date => $composableBuilder(
      column: $table.workout_date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get start_time => $composableBuilder(
      column: $table.start_time, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get end_time => $composableBuilder(
      column: $table.end_time, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get total_duration => $composableBuilder(
      column: $table.total_duration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnFilters(column));

  $$PlannedWorkoutsTableFilterComposer get planned_workout_id {
    final $$PlannedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planned_workout_id,
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
            getReferencedColumn: (t) => t.workout_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get workout_name => $composableBuilder(
      column: $table.workout_name,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get workout_date => $composableBuilder(
      column: $table.workout_date,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get start_time => $composableBuilder(
      column: $table.start_time, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get end_time => $composableBuilder(
      column: $table.end_time, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get total_duration => $composableBuilder(
      column: $table.total_duration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnOrderings(column));

  $$PlannedWorkoutsTableOrderingComposer get planned_workout_id {
    final $$PlannedWorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planned_workout_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<String> get workout_name => $composableBuilder(
      column: $table.workout_name, builder: (column) => column);

  GeneratedColumn<DateTime> get workout_date => $composableBuilder(
      column: $table.workout_date, builder: (column) => column);

  GeneratedColumn<DateTime> get start_time => $composableBuilder(
      column: $table.start_time, builder: (column) => column);

  GeneratedColumn<DateTime> get end_time =>
      $composableBuilder(column: $table.end_time, builder: (column) => column);

  GeneratedColumn<int> get total_duration => $composableBuilder(
      column: $table.total_duration, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => column);

  GeneratedColumn<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => column);

  $$PlannedWorkoutsTableAnnotationComposer get planned_workout_id {
    final $$PlannedWorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planned_workout_id,
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
            getReferencedColumn: (t) => t.workout_id,
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
        {bool planned_workout_id, bool completedWorkoutExercisesRefs})> {
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String?> planned_workout_id = const Value.absent(),
            Value<String?> workout_name = const Value.absent(),
            Value<DateTime> workout_date = const Value.absent(),
            Value<DateTime?> start_time = const Value.absent(),
            Value<DateTime?> end_time = const Value.absent(),
            Value<int?> total_duration = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutsCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            planned_workout_id: planned_workout_id,
            workout_name: workout_name,
            workout_date: workout_date,
            start_time: start_time,
            end_time: end_time,
            total_duration: total_duration,
            notes: notes,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            required String user_id,
            Value<String?> planned_workout_id = const Value.absent(),
            Value<String?> workout_name = const Value.absent(),
            Value<DateTime> workout_date = const Value.absent(),
            Value<DateTime?> start_time = const Value.absent(),
            Value<DateTime?> end_time = const Value.absent(),
            Value<int?> total_duration = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutsCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            planned_workout_id: planned_workout_id,
            workout_name: workout_name,
            workout_date: workout_date,
            start_time: start_time,
            end_time: end_time,
            total_duration: total_duration,
            notes: notes,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CompletedWorkoutsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {planned_workout_id = false,
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
                if (planned_workout_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.planned_workout_id,
                    referencedTable: $$CompletedWorkoutsTableReferences
                        ._planned_workout_idTable(db),
                    referencedColumn: $$CompletedWorkoutsTableReferences
                        ._planned_workout_idTable(db)
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
                                .where((e) => e.workout_id == item.id),
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
        {bool planned_workout_id, bool completedWorkoutExercisesRefs})>;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  required bool dirty,
  Value<String> id,
  Value<String?> user_id,
  required String name,
  Value<String?> description,
  Value<String?> start_position_image_path,
  Value<String?> end_position_image_path,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String?> user_id,
  Value<String> name,
  Value<String?> description,
  Value<String?> start_position_image_path,
  Value<String?> end_position_image_path,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CompletedWorkoutExercisesTable,
      List<CompletedWorkoutExercise>> _completedWorkoutExercisesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.completedWorkoutExercises,
          aliasName: $_aliasNameGenerator(
              db.exercises.id, db.completedWorkoutExercises.exercise_id));

  $$CompletedWorkoutExercisesTableProcessedTableManager
      get completedWorkoutExercisesRefs {
    final manager = $$CompletedWorkoutExercisesTableTableManager(
            $_db, $_db.completedWorkoutExercises)
        .filter((f) => f.exercise_id.id($_item.id));

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
              db.exercises.id, db.plannedWorkoutExercises.exercise_id));

  $$PlannedWorkoutExercisesTableProcessedTableManager
      get plannedWorkoutExercisesRefs {
    final manager = $$PlannedWorkoutExercisesTableTableManager(
            $_db, $_db.plannedWorkoutExercises)
        .filter((f) => f.exercise_id.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_plannedWorkoutExercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExerciseMusclesTable, List<ExerciseMuscle>>
      _exerciseMusclesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.exerciseMuscles,
              aliasName: $_aliasNameGenerator(
                  db.exercises.id, db.exerciseMuscles.exercise_id));

  $$ExerciseMusclesTableProcessedTableManager get exerciseMusclesRefs {
    final manager =
        $$ExerciseMusclesTableTableManager($_db, $_db.exerciseMuscles)
            .filter((f) => f.exercise_id.id($_item.id));

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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get start_position_image_path => $composableBuilder(
      column: $table.start_position_image_path,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get end_position_image_path => $composableBuilder(
      column: $table.end_position_image_path,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnFilters(column));

  Expression<bool> completedWorkoutExercisesRefs(
      Expression<bool> Function(
              $$CompletedWorkoutExercisesTableFilterComposer f)
          f) {
    final $$CompletedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.exercise_id,
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
            getReferencedColumn: (t) => t.exercise_id,
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
        getReferencedColumn: (t) => t.exercise_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get start_position_image_path => $composableBuilder(
      column: $table.start_position_image_path,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get end_position_image_path => $composableBuilder(
      column: $table.end_position_image_path,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get start_position_image_path => $composableBuilder(
      column: $table.start_position_image_path, builder: (column) => column);

  GeneratedColumn<String> get end_position_image_path => $composableBuilder(
      column: $table.end_position_image_path, builder: (column) => column);

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => column);

  GeneratedColumn<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => column);

  Expression<T> completedWorkoutExercisesRefs<T extends Object>(
      Expression<T> Function(
              $$CompletedWorkoutExercisesTableAnnotationComposer a)
          f) {
    final $$CompletedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.completedWorkoutExercises,
            getReferencedColumn: (t) => t.exercise_id,
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
            getReferencedColumn: (t) => t.exercise_id,
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
        getReferencedColumn: (t) => t.exercise_id,
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String?> user_id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> start_position_image_path = const Value.absent(),
            Value<String?> end_position_image_path = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            name: name,
            description: description,
            start_position_image_path: start_position_image_path,
            end_position_image_path: end_position_image_path,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            Value<String?> user_id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> start_position_image_path = const Value.absent(),
            Value<String?> end_position_image_path = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            name: name,
            description: description,
            start_position_image_path: start_position_image_path,
            end_position_image_path: end_position_image_path,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
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
                                .where((e) => e.exercise_id == item.id),
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
                                .where((e) => e.exercise_id == item.id),
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
                                .where((e) => e.exercise_id == item.id),
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
  required bool dirty,
  Value<String> id,
  required String user_id,
  required String workout_id,
  required String exercise_id,
  required int exercise_order,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$CompletedWorkoutExercisesTableUpdateCompanionBuilder
    = CompletedWorkoutExercisesCompanion Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String> user_id,
  Value<String> workout_id,
  Value<String> exercise_id,
  Value<int> exercise_order,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$CompletedWorkoutExercisesTableReferences extends BaseReferences<
    _$AppDatabase, $CompletedWorkoutExercisesTable, CompletedWorkoutExercise> {
  $$CompletedWorkoutExercisesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CompletedWorkoutsTable _workout_idTable(_$AppDatabase db) =>
      db.completedWorkouts.createAlias($_aliasNameGenerator(
          db.completedWorkoutExercises.workout_id, db.completedWorkouts.id));

  $$CompletedWorkoutsTableProcessedTableManager get workout_id {
    final manager =
        $$CompletedWorkoutsTableTableManager($_db, $_db.completedWorkouts)
            .filter((f) => f.id($_item.workout_id!));
    final item = $_typedResult.readTableOrNull(_workout_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ExercisesTable _exercise_idTable(_$AppDatabase db) =>
      db.exercises.createAlias($_aliasNameGenerator(
          db.completedWorkoutExercises.exercise_id, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exercise_id {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exercise_id!));
    final item = $_typedResult.readTableOrNull(_exercise_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CompletedSetsTable, List<CompletedSet>>
      _completedSetsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.completedSets,
              aliasName: $_aliasNameGenerator(db.completedWorkoutExercises.id,
                  db.completedSets.workout_exercise_id));

  $$CompletedSetsTableProcessedTableManager get completedSetsRefs {
    final manager = $$CompletedSetsTableTableManager($_db, $_db.completedSets)
        .filter((f) => f.workout_exercise_id.id($_item.id));

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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exercise_order => $composableBuilder(
      column: $table.exercise_order,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$CompletedWorkoutsTableFilterComposer get workout_id {
    final $$CompletedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_id,
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

  $$ExercisesTableFilterComposer get exercise_id {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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
        getReferencedColumn: (t) => t.workout_exercise_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exercise_order => $composableBuilder(
      column: $table.exercise_order,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$CompletedWorkoutsTableOrderingComposer get workout_id {
    final $$CompletedWorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_id,
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

  $$ExercisesTableOrderingComposer get exercise_id {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<int> get exercise_order => $composableBuilder(
      column: $table.exercise_order, builder: (column) => column);

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => column);

  GeneratedColumn<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CompletedWorkoutsTableAnnotationComposer get workout_id {
    final $$CompletedWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workout_id,
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

  $$ExercisesTableAnnotationComposer get exercise_id {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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
        getReferencedColumn: (t) => t.workout_exercise_id,
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
        {bool workout_id, bool exercise_id, bool completedSetsRefs})> {
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String> workout_id = const Value.absent(),
            Value<String> exercise_id = const Value.absent(),
            Value<int> exercise_order = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutExercisesCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_id: workout_id,
            exercise_id: exercise_id,
            exercise_order: exercise_order,
            created_at: created_at,
            updated_at: updated_at,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            required String user_id,
            required String workout_id,
            required String exercise_id,
            required int exercise_order,
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedWorkoutExercisesCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_id: workout_id,
            exercise_id: exercise_id,
            exercise_order: exercise_order,
            created_at: created_at,
            updated_at: updated_at,
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
              {workout_id = false,
              exercise_id = false,
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
                if (workout_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workout_id,
                    referencedTable: $$CompletedWorkoutExercisesTableReferences
                        ._workout_idTable(db),
                    referencedColumn: $$CompletedWorkoutExercisesTableReferences
                        ._workout_idTable(db)
                        .id,
                  ) as T;
                }
                if (exercise_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exercise_id,
                    referencedTable: $$CompletedWorkoutExercisesTableReferences
                        ._exercise_idTable(db),
                    referencedColumn: $$CompletedWorkoutExercisesTableReferences
                        ._exercise_idTable(db)
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
                                .where((e) => e.workout_exercise_id == item.id),
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
            {bool workout_id, bool exercise_id, bool completedSetsRefs})>;
typedef $$CompletedSetsTableCreateCompanionBuilder = CompletedSetsCompanion
    Function({
  required bool dirty,
  Value<String> id,
  required String user_id,
  required String workout_exercise_id,
  required int set_number,
  required int repetitions,
  Value<int?> duration_seconds,
  Value<double?> weight,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});
typedef $$CompletedSetsTableUpdateCompanionBuilder = CompletedSetsCompanion
    Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String> user_id,
  Value<String> workout_exercise_id,
  Value<int> set_number,
  Value<int> repetitions,
  Value<int?> duration_seconds,
  Value<double?> weight,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});

final class $$CompletedSetsTableReferences
    extends BaseReferences<_$AppDatabase, $CompletedSetsTable, CompletedSet> {
  $$CompletedSetsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CompletedWorkoutExercisesTable _workout_exercise_idTable(
          _$AppDatabase db) =>
      db.completedWorkoutExercises.createAlias($_aliasNameGenerator(
          db.completedSets.workout_exercise_id,
          db.completedWorkoutExercises.id));

  $$CompletedWorkoutExercisesTableProcessedTableManager
      get workout_exercise_id {
    final manager = $$CompletedWorkoutExercisesTableTableManager(
            $_db, $_db.completedWorkoutExercises)
        .filter((f) => f.id($_item.workout_exercise_id!));
    final item = $_typedResult.readTableOrNull(_workout_exercise_idTable($_db));
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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get set_number => $composableBuilder(
      column: $table.set_number, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration_seconds => $composableBuilder(
      column: $table.duration_seconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnFilters(column));

  $$CompletedWorkoutExercisesTableFilterComposer get workout_exercise_id {
    final $$CompletedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workout_exercise_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get set_number => $composableBuilder(
      column: $table.set_number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration_seconds => $composableBuilder(
      column: $table.duration_seconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnOrderings(column));

  $$CompletedWorkoutExercisesTableOrderingComposer get workout_exercise_id {
    final $$CompletedWorkoutExercisesTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workout_exercise_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<int> get set_number => $composableBuilder(
      column: $table.set_number, builder: (column) => column);

  GeneratedColumn<int> get repetitions => $composableBuilder(
      column: $table.repetitions, builder: (column) => column);

  GeneratedColumn<int> get duration_seconds => $composableBuilder(
      column: $table.duration_seconds, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => column);

  GeneratedColumn<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => column);

  $$CompletedWorkoutExercisesTableAnnotationComposer get workout_exercise_id {
    final $$CompletedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workout_exercise_id,
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
    PrefetchHooks Function({bool workout_exercise_id})> {
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String> workout_exercise_id = const Value.absent(),
            Value<int> set_number = const Value.absent(),
            Value<int> repetitions = const Value.absent(),
            Value<int?> duration_seconds = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedSetsCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_exercise_id: workout_exercise_id,
            set_number: set_number,
            repetitions: repetitions,
            duration_seconds: duration_seconds,
            weight: weight,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            required String user_id,
            required String workout_exercise_id,
            required int set_number,
            required int repetitions,
            Value<int?> duration_seconds = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CompletedSetsCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_exercise_id: workout_exercise_id,
            set_number: set_number,
            repetitions: repetitions,
            duration_seconds: duration_seconds,
            weight: weight,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CompletedSetsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workout_exercise_id = false}) {
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
                if (workout_exercise_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workout_exercise_id,
                    referencedTable: $$CompletedSetsTableReferences
                        ._workout_exercise_idTable(db),
                    referencedColumn: $$CompletedSetsTableReferences
                        ._workout_exercise_idTable(db)
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
    PrefetchHooks Function({bool workout_exercise_id})>;
typedef $$PlannedWorkoutExercisesTableCreateCompanionBuilder
    = PlannedWorkoutExercisesCompanion Function({
  required bool dirty,
  Value<String> id,
  required String user_id,
  required String workout_id,
  required String exercise_id,
  required int exercise_order,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});
typedef $$PlannedWorkoutExercisesTableUpdateCompanionBuilder
    = PlannedWorkoutExercisesCompanion Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String> user_id,
  Value<String> workout_id,
  Value<String> exercise_id,
  Value<int> exercise_order,
  Value<DateTime> created_at,
  Value<DateTime?> updated_at,
  Value<int> rowid,
});

final class $$PlannedWorkoutExercisesTableReferences extends BaseReferences<
    _$AppDatabase, $PlannedWorkoutExercisesTable, PlannedWorkoutExercise> {
  $$PlannedWorkoutExercisesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlannedWorkoutsTable _workout_idTable(_$AppDatabase db) =>
      db.plannedWorkouts.createAlias($_aliasNameGenerator(
          db.plannedWorkoutExercises.workout_id, db.plannedWorkouts.id));

  $$PlannedWorkoutsTableProcessedTableManager get workout_id {
    final manager =
        $$PlannedWorkoutsTableTableManager($_db, $_db.plannedWorkouts)
            .filter((f) => f.id($_item.workout_id!));
    final item = $_typedResult.readTableOrNull(_workout_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ExercisesTable _exercise_idTable(_$AppDatabase db) =>
      db.exercises.createAlias($_aliasNameGenerator(
          db.plannedWorkoutExercises.exercise_id, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exercise_id {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exercise_id!));
    final item = $_typedResult.readTableOrNull(_exercise_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PlannedSetsTable, List<PlannedSet>>
      _plannedSetsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.plannedSets,
              aliasName: $_aliasNameGenerator(db.plannedWorkoutExercises.id,
                  db.plannedSets.workout_exercise_id));

  $$PlannedSetsTableProcessedTableManager get plannedSetsRefs {
    final manager = $$PlannedSetsTableTableManager($_db, $_db.plannedSets)
        .filter((f) => f.workout_exercise_id.id($_item.id));

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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exercise_order => $composableBuilder(
      column: $table.exercise_order,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnFilters(column));

  $$PlannedWorkoutsTableFilterComposer get workout_id {
    final $$PlannedWorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_id,
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

  $$ExercisesTableFilterComposer get exercise_id {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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
        getReferencedColumn: (t) => t.workout_exercise_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exercise_order => $composableBuilder(
      column: $table.exercise_order,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => ColumnOrderings(column));

  $$PlannedWorkoutsTableOrderingComposer get workout_id {
    final $$PlannedWorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_id,
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

  $$ExercisesTableOrderingComposer get exercise_id {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<int> get exercise_order => $composableBuilder(
      column: $table.exercise_order, builder: (column) => column);

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
      column: $table.created_at, builder: (column) => column);

  GeneratedColumn<DateTime> get updated_at => $composableBuilder(
      column: $table.updated_at, builder: (column) => column);

  $$PlannedWorkoutsTableAnnotationComposer get workout_id {
    final $$PlannedWorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_id,
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

  $$ExercisesTableAnnotationComposer get exercise_id {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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
        getReferencedColumn: (t) => t.workout_exercise_id,
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
        {bool workout_id, bool exercise_id, bool plannedSetsRefs})> {
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String> workout_id = const Value.absent(),
            Value<String> exercise_id = const Value.absent(),
            Value<int> exercise_order = const Value.absent(),
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutExercisesCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_id: workout_id,
            exercise_id: exercise_id,
            exercise_order: exercise_order,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            required String user_id,
            required String workout_id,
            required String exercise_id,
            required int exercise_order,
            Value<DateTime> created_at = const Value.absent(),
            Value<DateTime?> updated_at = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedWorkoutExercisesCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_id: workout_id,
            exercise_id: exercise_id,
            exercise_order: exercise_order,
            created_at: created_at,
            updated_at: updated_at,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlannedWorkoutExercisesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workout_id = false,
              exercise_id = false,
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
                if (workout_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workout_id,
                    referencedTable: $$PlannedWorkoutExercisesTableReferences
                        ._workout_idTable(db),
                    referencedColumn: $$PlannedWorkoutExercisesTableReferences
                        ._workout_idTable(db)
                        .id,
                  ) as T;
                }
                if (exercise_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exercise_id,
                    referencedTable: $$PlannedWorkoutExercisesTableReferences
                        ._exercise_idTable(db),
                    referencedColumn: $$PlannedWorkoutExercisesTableReferences
                        ._exercise_idTable(db)
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
                                .where((e) => e.workout_exercise_id == item.id),
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
            {bool workout_id, bool exercise_id, bool plannedSetsRefs})>;
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
                  db.muscleGroups.id, db.exerciseMuscles.muscle_group_id));

  $$ExerciseMusclesTableProcessedTableManager get exerciseMusclesRefs {
    final manager =
        $$ExerciseMusclesTableTableManager($_db, $_db.exerciseMuscles)
            .filter((f) => f.muscle_group_id.id($_item.id));

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
        getReferencedColumn: (t) => t.muscle_group_id,
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
        getReferencedColumn: (t) => t.muscle_group_id,
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
                                .where((e) => e.muscle_group_id == item.id),
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
  required bool dirty,
  required String exercise_id,
  required int muscle_group_id,
  Value<int> rowid,
});
typedef $$ExerciseMusclesTableUpdateCompanionBuilder = ExerciseMusclesCompanion
    Function({
  Value<bool> dirty,
  Value<String> exercise_id,
  Value<int> muscle_group_id,
  Value<int> rowid,
});

final class $$ExerciseMusclesTableReferences extends BaseReferences<
    _$AppDatabase, $ExerciseMusclesTable, ExerciseMuscle> {
  $$ExerciseMusclesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ExercisesTable _exercise_idTable(_$AppDatabase db) =>
      db.exercises.createAlias($_aliasNameGenerator(
          db.exerciseMuscles.exercise_id, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exercise_id {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id($_item.exercise_id!));
    final item = $_typedResult.readTableOrNull(_exercise_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MuscleGroupsTable _muscle_group_idTable(_$AppDatabase db) =>
      db.muscleGroups.createAlias($_aliasNameGenerator(
          db.exerciseMuscles.muscle_group_id, db.muscleGroups.id));

  $$MuscleGroupsTableProcessedTableManager get muscle_group_id {
    final manager = $$MuscleGroupsTableTableManager($_db, $_db.muscleGroups)
        .filter((f) => f.id($_item.muscle_group_id!));
    final item = $_typedResult.readTableOrNull(_muscle_group_idTable($_db));
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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  $$ExercisesTableFilterComposer get exercise_id {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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

  $$MuscleGroupsTableFilterComposer get muscle_group_id {
    final $$MuscleGroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscle_group_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  $$ExercisesTableOrderingComposer get exercise_id {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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

  $$MuscleGroupsTableOrderingComposer get muscle_group_id {
    final $$MuscleGroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscle_group_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  $$ExercisesTableAnnotationComposer get exercise_id {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exercise_id,
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

  $$MuscleGroupsTableAnnotationComposer get muscle_group_id {
    final $$MuscleGroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.muscle_group_id,
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
    PrefetchHooks Function({bool exercise_id, bool muscle_group_id})> {
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
            Value<bool> dirty = const Value.absent(),
            Value<String> exercise_id = const Value.absent(),
            Value<int> muscle_group_id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseMusclesCompanion(
            dirty: dirty,
            exercise_id: exercise_id,
            muscle_group_id: muscle_group_id,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            required String exercise_id,
            required int muscle_group_id,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseMusclesCompanion.insert(
            dirty: dirty,
            exercise_id: exercise_id,
            muscle_group_id: muscle_group_id,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExerciseMusclesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {exercise_id = false, muscle_group_id = false}) {
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
                if (exercise_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exercise_id,
                    referencedTable:
                        $$ExerciseMusclesTableReferences._exercise_idTable(db),
                    referencedColumn: $$ExerciseMusclesTableReferences
                        ._exercise_idTable(db)
                        .id,
                  ) as T;
                }
                if (muscle_group_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.muscle_group_id,
                    referencedTable: $$ExerciseMusclesTableReferences
                        ._muscle_group_idTable(db),
                    referencedColumn: $$ExerciseMusclesTableReferences
                        ._muscle_group_idTable(db)
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
    PrefetchHooks Function({bool exercise_id, bool muscle_group_id})>;
typedef $$PlannedSetsTableCreateCompanionBuilder = PlannedSetsCompanion
    Function({
  required bool dirty,
  Value<String> id,
  required String user_id,
  required String workout_exercise_id,
  required int set_number,
  required int min_repetitions,
  required int max_repetitions,
  required double rpe,
  Value<int> rowid,
});
typedef $$PlannedSetsTableUpdateCompanionBuilder = PlannedSetsCompanion
    Function({
  Value<bool> dirty,
  Value<String> id,
  Value<String> user_id,
  Value<String> workout_exercise_id,
  Value<int> set_number,
  Value<int> min_repetitions,
  Value<int> max_repetitions,
  Value<double> rpe,
  Value<int> rowid,
});

final class $$PlannedSetsTableReferences
    extends BaseReferences<_$AppDatabase, $PlannedSetsTable, PlannedSet> {
  $$PlannedSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlannedWorkoutExercisesTable _workout_exercise_idTable(
          _$AppDatabase db) =>
      db.plannedWorkoutExercises.createAlias($_aliasNameGenerator(
          db.plannedSets.workout_exercise_id, db.plannedWorkoutExercises.id));

  $$PlannedWorkoutExercisesTableProcessedTableManager get workout_exercise_id {
    final manager = $$PlannedWorkoutExercisesTableTableManager(
            $_db, $_db.plannedWorkoutExercises)
        .filter((f) => f.id($_item.workout_exercise_id!));
    final item = $_typedResult.readTableOrNull(_workout_exercise_idTable($_db));
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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get set_number => $composableBuilder(
      column: $table.set_number, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get min_repetitions => $composableBuilder(
      column: $table.min_repetitions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get max_repetitions => $composableBuilder(
      column: $table.max_repetitions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rpe => $composableBuilder(
      column: $table.rpe, builder: (column) => ColumnFilters(column));

  $$PlannedWorkoutExercisesTableFilterComposer get workout_exercise_id {
    final $$PlannedWorkoutExercisesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workout_exercise_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get set_number => $composableBuilder(
      column: $table.set_number, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get min_repetitions => $composableBuilder(
      column: $table.min_repetitions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get max_repetitions => $composableBuilder(
      column: $table.max_repetitions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rpe => $composableBuilder(
      column: $table.rpe, builder: (column) => ColumnOrderings(column));

  $$PlannedWorkoutExercisesTableOrderingComposer get workout_exercise_id {
    final $$PlannedWorkoutExercisesTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workout_exercise_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<int> get set_number => $composableBuilder(
      column: $table.set_number, builder: (column) => column);

  GeneratedColumn<int> get min_repetitions => $composableBuilder(
      column: $table.min_repetitions, builder: (column) => column);

  GeneratedColumn<int> get max_repetitions => $composableBuilder(
      column: $table.max_repetitions, builder: (column) => column);

  GeneratedColumn<double> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  $$PlannedWorkoutExercisesTableAnnotationComposer get workout_exercise_id {
    final $$PlannedWorkoutExercisesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.workout_exercise_id,
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
    PrefetchHooks Function({bool workout_exercise_id})> {
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
            Value<bool> dirty = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String> workout_exercise_id = const Value.absent(),
            Value<int> set_number = const Value.absent(),
            Value<int> min_repetitions = const Value.absent(),
            Value<int> max_repetitions = const Value.absent(),
            Value<double> rpe = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedSetsCompanion(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_exercise_id: workout_exercise_id,
            set_number: set_number,
            min_repetitions: min_repetitions,
            max_repetitions: max_repetitions,
            rpe: rpe,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            Value<String> id = const Value.absent(),
            required String user_id,
            required String workout_exercise_id,
            required int set_number,
            required int min_repetitions,
            required int max_repetitions,
            required double rpe,
            Value<int> rowid = const Value.absent(),
          }) =>
              PlannedSetsCompanion.insert(
            dirty: dirty,
            id: id,
            user_id: user_id,
            workout_exercise_id: workout_exercise_id,
            set_number: set_number,
            min_repetitions: min_repetitions,
            max_repetitions: max_repetitions,
            rpe: rpe,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlannedSetsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workout_exercise_id = false}) {
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
                if (workout_exercise_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workout_exercise_id,
                    referencedTable: $$PlannedSetsTableReferences
                        ._workout_exercise_idTable(db),
                    referencedColumn: $$PlannedSetsTableReferences
                        ._workout_exercise_idTable(db)
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
    PrefetchHooks Function({bool workout_exercise_id})>;
typedef $$UserPreferencesTableTableCreateCompanionBuilder
    = UserPreferencesTableCompanion Function({
  required bool dirty,
  required String user_id,
  required bool is_dark_mode,
  required bool is_metric,
  Value<int> rowid,
});
typedef $$UserPreferencesTableTableUpdateCompanionBuilder
    = UserPreferencesTableCompanion Function({
  Value<bool> dirty,
  Value<String> user_id,
  Value<bool> is_dark_mode,
  Value<bool> is_metric,
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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get is_dark_mode => $composableBuilder(
      column: $table.is_dark_mode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get is_metric => $composableBuilder(
      column: $table.is_metric, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get is_dark_mode => $composableBuilder(
      column: $table.is_dark_mode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get is_metric => $composableBuilder(
      column: $table.is_metric, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<bool> get is_dark_mode => $composableBuilder(
      column: $table.is_dark_mode, builder: (column) => column);

  GeneratedColumn<bool> get is_metric =>
      $composableBuilder(column: $table.is_metric, builder: (column) => column);
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
            Value<bool> dirty = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<bool> is_dark_mode = const Value.absent(),
            Value<bool> is_metric = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserPreferencesTableCompanion(
            dirty: dirty,
            user_id: user_id,
            is_dark_mode: is_dark_mode,
            is_metric: is_metric,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            required String user_id,
            required bool is_dark_mode,
            required bool is_metric,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserPreferencesTableCompanion.insert(
            dirty: dirty,
            user_id: user_id,
            is_dark_mode: is_dark_mode,
            is_metric: is_metric,
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
  required bool dirty,
  required String user_id,
  required String workout_plan_id,
  Value<int> current_week,
  Value<int> current_day,
  Value<int> rowid,
});
typedef $$UserWorkoutPlansTableTableUpdateCompanionBuilder
    = UserWorkoutPlansTableCompanion Function({
  Value<bool> dirty,
  Value<String> user_id,
  Value<String> workout_plan_id,
  Value<int> current_week,
  Value<int> current_day,
  Value<int> rowid,
});

final class $$UserWorkoutPlansTableTableReferences extends BaseReferences<
    _$AppDatabase, $UserWorkoutPlansTableTable, UserWorkoutPlans> {
  $$UserWorkoutPlansTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutPlansTable _workout_plan_idTable(_$AppDatabase db) =>
      db.workoutPlans.createAlias($_aliasNameGenerator(
          db.userWorkoutPlansTable.workout_plan_id, db.workoutPlans.id));

  $$WorkoutPlansTableProcessedTableManager get workout_plan_id {
    final manager = $$WorkoutPlansTableTableManager($_db, $_db.workoutPlans)
        .filter((f) => f.id($_item.workout_plan_id!));
    final item = $_typedResult.readTableOrNull(_workout_plan_idTable($_db));
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
  ColumnFilters<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get current_week => $composableBuilder(
      column: $table.current_week, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get current_day => $composableBuilder(
      column: $table.current_day, builder: (column) => ColumnFilters(column));

  $$WorkoutPlansTableFilterComposer get workout_plan_id {
    final $$WorkoutPlansTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_plan_id,
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
  ColumnOrderings<bool> get dirty => $composableBuilder(
      column: $table.dirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get user_id => $composableBuilder(
      column: $table.user_id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get current_week => $composableBuilder(
      column: $table.current_week,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get current_day => $composableBuilder(
      column: $table.current_day, builder: (column) => ColumnOrderings(column));

  $$WorkoutPlansTableOrderingComposer get workout_plan_id {
    final $$WorkoutPlansTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_plan_id,
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
  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<String> get user_id =>
      $composableBuilder(column: $table.user_id, builder: (column) => column);

  GeneratedColumn<int> get current_week => $composableBuilder(
      column: $table.current_week, builder: (column) => column);

  GeneratedColumn<int> get current_day => $composableBuilder(
      column: $table.current_day, builder: (column) => column);

  $$WorkoutPlansTableAnnotationComposer get workout_plan_id {
    final $$WorkoutPlansTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workout_plan_id,
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
    UserWorkoutPlans,
    $$UserWorkoutPlansTableTableFilterComposer,
    $$UserWorkoutPlansTableTableOrderingComposer,
    $$UserWorkoutPlansTableTableAnnotationComposer,
    $$UserWorkoutPlansTableTableCreateCompanionBuilder,
    $$UserWorkoutPlansTableTableUpdateCompanionBuilder,
    (UserWorkoutPlans, $$UserWorkoutPlansTableTableReferences),
    UserWorkoutPlans,
    PrefetchHooks Function({bool workout_plan_id})> {
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
            Value<bool> dirty = const Value.absent(),
            Value<String> user_id = const Value.absent(),
            Value<String> workout_plan_id = const Value.absent(),
            Value<int> current_week = const Value.absent(),
            Value<int> current_day = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWorkoutPlansTableCompanion(
            dirty: dirty,
            user_id: user_id,
            workout_plan_id: workout_plan_id,
            current_week: current_week,
            current_day: current_day,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required bool dirty,
            required String user_id,
            required String workout_plan_id,
            Value<int> current_week = const Value.absent(),
            Value<int> current_day = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWorkoutPlansTableCompanion.insert(
            dirty: dirty,
            user_id: user_id,
            workout_plan_id: workout_plan_id,
            current_week: current_week,
            current_day: current_day,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserWorkoutPlansTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workout_plan_id = false}) {
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
                if (workout_plan_id) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workout_plan_id,
                    referencedTable: $$UserWorkoutPlansTableTableReferences
                        ._workout_plan_idTable(db),
                    referencedColumn: $$UserWorkoutPlansTableTableReferences
                        ._workout_plan_idTable(db)
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
        UserWorkoutPlans,
        $$UserWorkoutPlansTableTableFilterComposer,
        $$UserWorkoutPlansTableTableOrderingComposer,
        $$UserWorkoutPlansTableTableAnnotationComposer,
        $$UserWorkoutPlansTableTableCreateCompanionBuilder,
        $$UserWorkoutPlansTableTableUpdateCompanionBuilder,
        (UserWorkoutPlans, $$UserWorkoutPlansTableTableReferences),
        UserWorkoutPlans,
        PrefetchHooks Function({bool workout_plan_id})>;
typedef $$OfflineUserDataTableTableCreateCompanionBuilder
    = OfflineUserDataTableCompanion Function({
  required String userId,
  required String email,
  Value<int> rowid,
});
typedef $$OfflineUserDataTableTableUpdateCompanionBuilder
    = OfflineUserDataTableCompanion Function({
  Value<String> userId,
  Value<String> email,
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

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);
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
            Value<String> email = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineUserDataTableCompanion(
            userId: userId,
            email: email,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String email,
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineUserDataTableCompanion.insert(
            userId: userId,
            email: email,
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
