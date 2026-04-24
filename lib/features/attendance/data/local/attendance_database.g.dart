// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_database.dart';

// ignore_for_file: type=lint
class $PendingCheckinsTable extends PendingCheckins
    with TableInfo<$PendingCheckinsTable, PendingCheckin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingCheckinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gpsLatMeta = const VerificationMeta('gpsLat');
  @override
  late final GeneratedColumn<double> gpsLat = GeneratedColumn<double>(
    'gps_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsLngMeta = const VerificationMeta('gpsLng');
  @override
  late final GeneratedColumn<double> gpsLng = GeneratedColumn<double>(
    'gps_lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationCodeMeta = const VerificationMeta(
    'locationCode',
  );
  @override
  late final GeneratedColumn<String> locationCode = GeneratedColumn<String>(
    'location_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextRetryAtMeta = const VerificationMeta(
    'nextRetryAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextRetryAt = GeneratedColumn<DateTime>(
    'next_retry_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    gpsLat,
    gpsLng,
    locationCode,
    photoPath,
    note,
    occurredAt,
    retryCount,
    lastError,
    nextRetryAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_checkins';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingCheckin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('gps_lat')) {
      context.handle(
        _gpsLatMeta,
        gpsLat.isAcceptableOrUnknown(data['gps_lat']!, _gpsLatMeta),
      );
    }
    if (data.containsKey('gps_lng')) {
      context.handle(
        _gpsLngMeta,
        gpsLng.isAcceptableOrUnknown(data['gps_lng']!, _gpsLngMeta),
      );
    }
    if (data.containsKey('location_code')) {
      context.handle(
        _locationCodeMeta,
        locationCode.isAcceptableOrUnknown(
          data['location_code']!,
          _locationCodeMeta,
        ),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('next_retry_at')) {
      context.handle(
        _nextRetryAtMeta,
        nextRetryAt.isAcceptableOrUnknown(
          data['next_retry_at']!,
          _nextRetryAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingCheckin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingCheckin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      gpsLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_lat'],
      ),
      gpsLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_lng'],
      ),
      locationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_code'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      nextRetryAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_retry_at'],
      ),
    );
  }

  @override
  $PendingCheckinsTable createAlias(String alias) {
    return $PendingCheckinsTable(attachedDatabase, alias);
  }
}

class PendingCheckin extends DataClass implements Insertable<PendingCheckin> {
  /// Client-generated UUID — used as idempotency key.
  final String id;

  /// 'checkin' | 'checkout' | 'wfh_checkin' | 'wfh_checkout'
  final String type;
  final double? gpsLat;
  final double? gpsLng;
  final String? locationCode;

  /// Absolute path to compressed JPEG in temp dir.
  final String? photoPath;
  final String? note;

  /// When the user triggered check-in (local clock — server timestamps on receive).
  final DateTime occurredAt;
  final int retryCount;

  /// Last error message (no stack traces — security).
  final String? lastError;

  /// Null = retry immediately on next connectivity event.
  final DateTime? nextRetryAt;
  const PendingCheckin({
    required this.id,
    required this.type,
    this.gpsLat,
    this.gpsLng,
    this.locationCode,
    this.photoPath,
    this.note,
    required this.occurredAt,
    required this.retryCount,
    this.lastError,
    this.nextRetryAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || gpsLat != null) {
      map['gps_lat'] = Variable<double>(gpsLat);
    }
    if (!nullToAbsent || gpsLng != null) {
      map['gps_lng'] = Variable<double>(gpsLng);
    }
    if (!nullToAbsent || locationCode != null) {
      map['location_code'] = Variable<String>(locationCode);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    if (!nullToAbsent || nextRetryAt != null) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt);
    }
    return map;
  }

  PendingCheckinsCompanion toCompanion(bool nullToAbsent) {
    return PendingCheckinsCompanion(
      id: Value(id),
      type: Value(type),
      gpsLat: gpsLat == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsLat),
      gpsLng: gpsLng == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsLng),
      locationCode: locationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(locationCode),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      occurredAt: Value(occurredAt),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      nextRetryAt: nextRetryAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRetryAt),
    );
  }

  factory PendingCheckin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingCheckin(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      gpsLat: serializer.fromJson<double?>(json['gpsLat']),
      gpsLng: serializer.fromJson<double?>(json['gpsLng']),
      locationCode: serializer.fromJson<String?>(json['locationCode']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      note: serializer.fromJson<String?>(json['note']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      nextRetryAt: serializer.fromJson<DateTime?>(json['nextRetryAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'gpsLat': serializer.toJson<double?>(gpsLat),
      'gpsLng': serializer.toJson<double?>(gpsLng),
      'locationCode': serializer.toJson<String?>(locationCode),
      'photoPath': serializer.toJson<String?>(photoPath),
      'note': serializer.toJson<String?>(note),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
      'nextRetryAt': serializer.toJson<DateTime?>(nextRetryAt),
    };
  }

  PendingCheckin copyWith({
    String? id,
    String? type,
    Value<double?> gpsLat = const Value.absent(),
    Value<double?> gpsLng = const Value.absent(),
    Value<String?> locationCode = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? occurredAt,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
    Value<DateTime?> nextRetryAt = const Value.absent(),
  }) => PendingCheckin(
    id: id ?? this.id,
    type: type ?? this.type,
    gpsLat: gpsLat.present ? gpsLat.value : this.gpsLat,
    gpsLng: gpsLng.present ? gpsLng.value : this.gpsLng,
    locationCode: locationCode.present ? locationCode.value : this.locationCode,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    note: note.present ? note.value : this.note,
    occurredAt: occurredAt ?? this.occurredAt,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    nextRetryAt: nextRetryAt.present ? nextRetryAt.value : this.nextRetryAt,
  );
  PendingCheckin copyWithCompanion(PendingCheckinsCompanion data) {
    return PendingCheckin(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      gpsLat: data.gpsLat.present ? data.gpsLat.value : this.gpsLat,
      gpsLng: data.gpsLng.present ? data.gpsLng.value : this.gpsLng,
      locationCode: data.locationCode.present
          ? data.locationCode.value
          : this.locationCode,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      note: data.note.present ? data.note.value : this.note,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      nextRetryAt: data.nextRetryAt.present
          ? data.nextRetryAt.value
          : this.nextRetryAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingCheckin(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('gpsLat: $gpsLat, ')
          ..write('gpsLng: $gpsLng, ')
          ..write('locationCode: $locationCode, ')
          ..write('photoPath: $photoPath, ')
          ..write('note: $note, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('nextRetryAt: $nextRetryAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    gpsLat,
    gpsLng,
    locationCode,
    photoPath,
    note,
    occurredAt,
    retryCount,
    lastError,
    nextRetryAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingCheckin &&
          other.id == this.id &&
          other.type == this.type &&
          other.gpsLat == this.gpsLat &&
          other.gpsLng == this.gpsLng &&
          other.locationCode == this.locationCode &&
          other.photoPath == this.photoPath &&
          other.note == this.note &&
          other.occurredAt == this.occurredAt &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError &&
          other.nextRetryAt == this.nextRetryAt);
}

class PendingCheckinsCompanion extends UpdateCompanion<PendingCheckin> {
  final Value<String> id;
  final Value<String> type;
  final Value<double?> gpsLat;
  final Value<double?> gpsLng;
  final Value<String?> locationCode;
  final Value<String?> photoPath;
  final Value<String?> note;
  final Value<DateTime> occurredAt;
  final Value<int> retryCount;
  final Value<String?> lastError;
  final Value<DateTime?> nextRetryAt;
  final Value<int> rowid;
  const PendingCheckinsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.gpsLat = const Value.absent(),
    this.gpsLng = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.note = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingCheckinsCompanion.insert({
    required String id,
    required String type,
    this.gpsLat = const Value.absent(),
    this.gpsLng = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime occurredAt,
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       occurredAt = Value(occurredAt);
  static Insertable<PendingCheckin> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<double>? gpsLat,
    Expression<double>? gpsLng,
    Expression<String>? locationCode,
    Expression<String>? photoPath,
    Expression<String>? note,
    Expression<DateTime>? occurredAt,
    Expression<int>? retryCount,
    Expression<String>? lastError,
    Expression<DateTime>? nextRetryAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (gpsLat != null) 'gps_lat': gpsLat,
      if (gpsLng != null) 'gps_lng': gpsLng,
      if (locationCode != null) 'location_code': locationCode,
      if (photoPath != null) 'photo_path': photoPath,
      if (note != null) 'note': note,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
      if (nextRetryAt != null) 'next_retry_at': nextRetryAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingCheckinsCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<double?>? gpsLat,
    Value<double?>? gpsLng,
    Value<String?>? locationCode,
    Value<String?>? photoPath,
    Value<String?>? note,
    Value<DateTime>? occurredAt,
    Value<int>? retryCount,
    Value<String?>? lastError,
    Value<DateTime?>? nextRetryAt,
    Value<int>? rowid,
  }) {
    return PendingCheckinsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      gpsLat: gpsLat ?? this.gpsLat,
      gpsLng: gpsLng ?? this.gpsLng,
      locationCode: locationCode ?? this.locationCode,
      photoPath: photoPath ?? this.photoPath,
      note: note ?? this.note,
      occurredAt: occurredAt ?? this.occurredAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (gpsLat.present) {
      map['gps_lat'] = Variable<double>(gpsLat.value);
    }
    if (gpsLng.present) {
      map['gps_lng'] = Variable<double>(gpsLng.value);
    }
    if (locationCode.present) {
      map['location_code'] = Variable<String>(locationCode.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (nextRetryAt.present) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingCheckinsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('gpsLat: $gpsLat, ')
          ..write('gpsLng: $gpsLng, ')
          ..write('locationCode: $locationCode, ')
          ..write('photoPath: $photoPath, ')
          ..write('note: $note, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('nextRetryAt: $nextRetryAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocationsCacheTable extends LocationsCache
    with TableInfo<$LocationsCacheTable, LocationsCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gpsLatMeta = const VerificationMeta('gpsLat');
  @override
  late final GeneratedColumn<double> gpsLat = GeneratedColumn<double>(
    'gps_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsLngMeta = const VerificationMeta('gpsLng');
  @override
  late final GeneratedColumn<double> gpsLng = GeneratedColumn<double>(
    'gps_lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsRadiusMMeta = const VerificationMeta(
    'gpsRadiusM',
  );
  @override
  late final GeneratedColumn<int> gpsRadiusM = GeneratedColumn<int>(
    'gps_radius_m',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(500),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    gpsLat,
    gpsLng,
    gpsRadiusM,
    isActive,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationsCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('gps_lat')) {
      context.handle(
        _gpsLatMeta,
        gpsLat.isAcceptableOrUnknown(data['gps_lat']!, _gpsLatMeta),
      );
    }
    if (data.containsKey('gps_lng')) {
      context.handle(
        _gpsLngMeta,
        gpsLng.isAcceptableOrUnknown(data['gps_lng']!, _gpsLngMeta),
      );
    }
    if (data.containsKey('gps_radius_m')) {
      context.handle(
        _gpsRadiusMMeta,
        gpsRadiusM.isAcceptableOrUnknown(
          data['gps_radius_m']!,
          _gpsRadiusMMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationsCacheData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      gpsLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_lat'],
      ),
      gpsLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_lng'],
      ),
      gpsRadiusM: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gps_radius_m'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $LocationsCacheTable createAlias(String alias) {
    return $LocationsCacheTable(attachedDatabase, alias);
  }
}

class LocationsCacheData extends DataClass
    implements Insertable<LocationsCacheData> {
  final int id;
  final String code;
  final String name;
  final double? gpsLat;
  final double? gpsLng;
  final int gpsRadiusM;
  final bool isActive;
  final DateTime cachedAt;
  const LocationsCacheData({
    required this.id,
    required this.code,
    required this.name,
    this.gpsLat,
    this.gpsLng,
    required this.gpsRadiusM,
    required this.isActive,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || gpsLat != null) {
      map['gps_lat'] = Variable<double>(gpsLat);
    }
    if (!nullToAbsent || gpsLng != null) {
      map['gps_lng'] = Variable<double>(gpsLng);
    }
    map['gps_radius_m'] = Variable<int>(gpsRadiusM);
    map['is_active'] = Variable<bool>(isActive);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  LocationsCacheCompanion toCompanion(bool nullToAbsent) {
    return LocationsCacheCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      gpsLat: gpsLat == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsLat),
      gpsLng: gpsLng == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsLng),
      gpsRadiusM: Value(gpsRadiusM),
      isActive: Value(isActive),
      cachedAt: Value(cachedAt),
    );
  }

  factory LocationsCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationsCacheData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      gpsLat: serializer.fromJson<double?>(json['gpsLat']),
      gpsLng: serializer.fromJson<double?>(json['gpsLng']),
      gpsRadiusM: serializer.fromJson<int>(json['gpsRadiusM']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'gpsLat': serializer.toJson<double?>(gpsLat),
      'gpsLng': serializer.toJson<double?>(gpsLng),
      'gpsRadiusM': serializer.toJson<int>(gpsRadiusM),
      'isActive': serializer.toJson<bool>(isActive),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  LocationsCacheData copyWith({
    int? id,
    String? code,
    String? name,
    Value<double?> gpsLat = const Value.absent(),
    Value<double?> gpsLng = const Value.absent(),
    int? gpsRadiusM,
    bool? isActive,
    DateTime? cachedAt,
  }) => LocationsCacheData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    gpsLat: gpsLat.present ? gpsLat.value : this.gpsLat,
    gpsLng: gpsLng.present ? gpsLng.value : this.gpsLng,
    gpsRadiusM: gpsRadiusM ?? this.gpsRadiusM,
    isActive: isActive ?? this.isActive,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  LocationsCacheData copyWithCompanion(LocationsCacheCompanion data) {
    return LocationsCacheData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      gpsLat: data.gpsLat.present ? data.gpsLat.value : this.gpsLat,
      gpsLng: data.gpsLng.present ? data.gpsLng.value : this.gpsLng,
      gpsRadiusM: data.gpsRadiusM.present
          ? data.gpsRadiusM.value
          : this.gpsRadiusM,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCacheData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('gpsLat: $gpsLat, ')
          ..write('gpsLng: $gpsLng, ')
          ..write('gpsRadiusM: $gpsRadiusM, ')
          ..write('isActive: $isActive, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    gpsLat,
    gpsLng,
    gpsRadiusM,
    isActive,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationsCacheData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.gpsLat == this.gpsLat &&
          other.gpsLng == this.gpsLng &&
          other.gpsRadiusM == this.gpsRadiusM &&
          other.isActive == this.isActive &&
          other.cachedAt == this.cachedAt);
}

class LocationsCacheCompanion extends UpdateCompanion<LocationsCacheData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<double?> gpsLat;
  final Value<double?> gpsLng;
  final Value<int> gpsRadiusM;
  final Value<bool> isActive;
  final Value<DateTime> cachedAt;
  const LocationsCacheCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.gpsLat = const Value.absent(),
    this.gpsLng = const Value.absent(),
    this.gpsRadiusM = const Value.absent(),
    this.isActive = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  LocationsCacheCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    this.gpsLat = const Value.absent(),
    this.gpsLng = const Value.absent(),
    this.gpsRadiusM = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime cachedAt,
  }) : code = Value(code),
       name = Value(name),
       cachedAt = Value(cachedAt);
  static Insertable<LocationsCacheData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<double>? gpsLat,
    Expression<double>? gpsLng,
    Expression<int>? gpsRadiusM,
    Expression<bool>? isActive,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (gpsLat != null) 'gps_lat': gpsLat,
      if (gpsLng != null) 'gps_lng': gpsLng,
      if (gpsRadiusM != null) 'gps_radius_m': gpsRadiusM,
      if (isActive != null) 'is_active': isActive,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  LocationsCacheCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<double?>? gpsLat,
    Value<double?>? gpsLng,
    Value<int>? gpsRadiusM,
    Value<bool>? isActive,
    Value<DateTime>? cachedAt,
  }) {
    return LocationsCacheCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      gpsLat: gpsLat ?? this.gpsLat,
      gpsLng: gpsLng ?? this.gpsLng,
      gpsRadiusM: gpsRadiusM ?? this.gpsRadiusM,
      isActive: isActive ?? this.isActive,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gpsLat.present) {
      map['gps_lat'] = Variable<double>(gpsLat.value);
    }
    if (gpsLng.present) {
      map['gps_lng'] = Variable<double>(gpsLng.value);
    }
    if (gpsRadiusM.present) {
      map['gps_radius_m'] = Variable<int>(gpsRadiusM.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCacheCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('gpsLat: $gpsLat, ')
          ..write('gpsLng: $gpsLng, ')
          ..write('gpsRadiusM: $gpsRadiusM, ')
          ..write('isActive: $isActive, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AttendanceDatabase extends GeneratedDatabase {
  _$AttendanceDatabase(QueryExecutor e) : super(e);
  $AttendanceDatabaseManager get managers => $AttendanceDatabaseManager(this);
  late final $PendingCheckinsTable pendingCheckins = $PendingCheckinsTable(
    this,
  );
  late final $LocationsCacheTable locationsCache = $LocationsCacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pendingCheckins,
    locationsCache,
  ];
}

typedef $$PendingCheckinsTableCreateCompanionBuilder =
    PendingCheckinsCompanion Function({
      required String id,
      required String type,
      Value<double?> gpsLat,
      Value<double?> gpsLng,
      Value<String?> locationCode,
      Value<String?> photoPath,
      Value<String?> note,
      required DateTime occurredAt,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime?> nextRetryAt,
      Value<int> rowid,
    });
typedef $$PendingCheckinsTableUpdateCompanionBuilder =
    PendingCheckinsCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<double?> gpsLat,
      Value<double?> gpsLng,
      Value<String?> locationCode,
      Value<String?> photoPath,
      Value<String?> note,
      Value<DateTime> occurredAt,
      Value<int> retryCount,
      Value<String?> lastError,
      Value<DateTime?> nextRetryAt,
      Value<int> rowid,
    });

class $$PendingCheckinsTableFilterComposer
    extends Composer<_$AttendanceDatabase, $PendingCheckinsTable> {
  $$PendingCheckinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsLat => $composableBuilder(
    column: $table.gpsLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsLng => $composableBuilder(
    column: $table.gpsLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationCode => $composableBuilder(
    column: $table.locationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingCheckinsTableOrderingComposer
    extends Composer<_$AttendanceDatabase, $PendingCheckinsTable> {
  $$PendingCheckinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsLat => $composableBuilder(
    column: $table.gpsLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsLng => $composableBuilder(
    column: $table.gpsLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationCode => $composableBuilder(
    column: $table.locationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingCheckinsTableAnnotationComposer
    extends Composer<_$AttendanceDatabase, $PendingCheckinsTable> {
  $$PendingCheckinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get gpsLat =>
      $composableBuilder(column: $table.gpsLat, builder: (column) => column);

  GeneratedColumn<double> get gpsLng =>
      $composableBuilder(column: $table.gpsLng, builder: (column) => column);

  GeneratedColumn<String> get locationCode => $composableBuilder(
    column: $table.locationCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => column,
  );
}

class $$PendingCheckinsTableTableManager
    extends
        RootTableManager<
          _$AttendanceDatabase,
          $PendingCheckinsTable,
          PendingCheckin,
          $$PendingCheckinsTableFilterComposer,
          $$PendingCheckinsTableOrderingComposer,
          $$PendingCheckinsTableAnnotationComposer,
          $$PendingCheckinsTableCreateCompanionBuilder,
          $$PendingCheckinsTableUpdateCompanionBuilder,
          (
            PendingCheckin,
            BaseReferences<
              _$AttendanceDatabase,
              $PendingCheckinsTable,
              PendingCheckin
            >,
          ),
          PendingCheckin,
          PrefetchHooks Function()
        > {
  $$PendingCheckinsTableTableManager(
    _$AttendanceDatabase db,
    $PendingCheckinsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingCheckinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingCheckinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingCheckinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double?> gpsLat = const Value.absent(),
                Value<double?> gpsLng = const Value.absent(),
                Value<String?> locationCode = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> nextRetryAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingCheckinsCompanion(
                id: id,
                type: type,
                gpsLat: gpsLat,
                gpsLng: gpsLng,
                locationCode: locationCode,
                photoPath: photoPath,
                note: note,
                occurredAt: occurredAt,
                retryCount: retryCount,
                lastError: lastError,
                nextRetryAt: nextRetryAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                Value<double?> gpsLat = const Value.absent(),
                Value<double?> gpsLng = const Value.absent(),
                Value<String?> locationCode = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime occurredAt,
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime?> nextRetryAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingCheckinsCompanion.insert(
                id: id,
                type: type,
                gpsLat: gpsLat,
                gpsLng: gpsLng,
                locationCode: locationCode,
                photoPath: photoPath,
                note: note,
                occurredAt: occurredAt,
                retryCount: retryCount,
                lastError: lastError,
                nextRetryAt: nextRetryAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingCheckinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AttendanceDatabase,
      $PendingCheckinsTable,
      PendingCheckin,
      $$PendingCheckinsTableFilterComposer,
      $$PendingCheckinsTableOrderingComposer,
      $$PendingCheckinsTableAnnotationComposer,
      $$PendingCheckinsTableCreateCompanionBuilder,
      $$PendingCheckinsTableUpdateCompanionBuilder,
      (
        PendingCheckin,
        BaseReferences<
          _$AttendanceDatabase,
          $PendingCheckinsTable,
          PendingCheckin
        >,
      ),
      PendingCheckin,
      PrefetchHooks Function()
    >;
typedef $$LocationsCacheTableCreateCompanionBuilder =
    LocationsCacheCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      Value<double?> gpsLat,
      Value<double?> gpsLng,
      Value<int> gpsRadiusM,
      Value<bool> isActive,
      required DateTime cachedAt,
    });
typedef $$LocationsCacheTableUpdateCompanionBuilder =
    LocationsCacheCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<double?> gpsLat,
      Value<double?> gpsLng,
      Value<int> gpsRadiusM,
      Value<bool> isActive,
      Value<DateTime> cachedAt,
    });

class $$LocationsCacheTableFilterComposer
    extends Composer<_$AttendanceDatabase, $LocationsCacheTable> {
  $$LocationsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsLat => $composableBuilder(
    column: $table.gpsLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsLng => $composableBuilder(
    column: $table.gpsLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gpsRadiusM => $composableBuilder(
    column: $table.gpsRadiusM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationsCacheTableOrderingComposer
    extends Composer<_$AttendanceDatabase, $LocationsCacheTable> {
  $$LocationsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsLat => $composableBuilder(
    column: $table.gpsLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsLng => $composableBuilder(
    column: $table.gpsLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gpsRadiusM => $composableBuilder(
    column: $table.gpsRadiusM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationsCacheTableAnnotationComposer
    extends Composer<_$AttendanceDatabase, $LocationsCacheTable> {
  $$LocationsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get gpsLat =>
      $composableBuilder(column: $table.gpsLat, builder: (column) => column);

  GeneratedColumn<double> get gpsLng =>
      $composableBuilder(column: $table.gpsLng, builder: (column) => column);

  GeneratedColumn<int> get gpsRadiusM => $composableBuilder(
    column: $table.gpsRadiusM,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$LocationsCacheTableTableManager
    extends
        RootTableManager<
          _$AttendanceDatabase,
          $LocationsCacheTable,
          LocationsCacheData,
          $$LocationsCacheTableFilterComposer,
          $$LocationsCacheTableOrderingComposer,
          $$LocationsCacheTableAnnotationComposer,
          $$LocationsCacheTableCreateCompanionBuilder,
          $$LocationsCacheTableUpdateCompanionBuilder,
          (
            LocationsCacheData,
            BaseReferences<
              _$AttendanceDatabase,
              $LocationsCacheTable,
              LocationsCacheData
            >,
          ),
          LocationsCacheData,
          PrefetchHooks Function()
        > {
  $$LocationsCacheTableTableManager(
    _$AttendanceDatabase db,
    $LocationsCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationsCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> gpsLat = const Value.absent(),
                Value<double?> gpsLng = const Value.absent(),
                Value<int> gpsRadiusM = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => LocationsCacheCompanion(
                id: id,
                code: code,
                name: name,
                gpsLat: gpsLat,
                gpsLng: gpsLng,
                gpsRadiusM: gpsRadiusM,
                isActive: isActive,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                Value<double?> gpsLat = const Value.absent(),
                Value<double?> gpsLng = const Value.absent(),
                Value<int> gpsRadiusM = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime cachedAt,
              }) => LocationsCacheCompanion.insert(
                id: id,
                code: code,
                name: name,
                gpsLat: gpsLat,
                gpsLng: gpsLng,
                gpsRadiusM: gpsRadiusM,
                isActive: isActive,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocationsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AttendanceDatabase,
      $LocationsCacheTable,
      LocationsCacheData,
      $$LocationsCacheTableFilterComposer,
      $$LocationsCacheTableOrderingComposer,
      $$LocationsCacheTableAnnotationComposer,
      $$LocationsCacheTableCreateCompanionBuilder,
      $$LocationsCacheTableUpdateCompanionBuilder,
      (
        LocationsCacheData,
        BaseReferences<
          _$AttendanceDatabase,
          $LocationsCacheTable,
          LocationsCacheData
        >,
      ),
      LocationsCacheData,
      PrefetchHooks Function()
    >;

class $AttendanceDatabaseManager {
  final _$AttendanceDatabase _db;
  $AttendanceDatabaseManager(this._db);
  $$PendingCheckinsTableTableManager get pendingCheckins =>
      $$PendingCheckinsTableTableManager(_db, _db.pendingCheckins);
  $$LocationsCacheTableTableManager get locationsCache =>
      $$LocationsCacheTableTableManager(_db, _db.locationsCache);
}
