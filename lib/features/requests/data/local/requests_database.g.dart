// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_database.dart';

// ignore_for_file: type=lint
class $RequestTypesCacheTable extends RequestTypesCache
    with TableInfo<$RequestTypesCacheTable, RequestTypesCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RequestTypesCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameViMeta = const VerificationMeta('nameVi');
  @override
  late final GeneratedColumn<String> nameVi = GeneratedColumn<String>(
    'name_vi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIdxMeta = const VerificationMeta(
    'orderIdx',
  );
  @override
  late final GeneratedColumn<int> orderIdx = GeneratedColumn<int>(
    'order_idx',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    code,
    nameVi,
    nameEn,
    icon,
    color,
    orderIdx,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'request_types_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<RequestTypesCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name_vi')) {
      context.handle(
        _nameViMeta,
        nameVi.isAcceptableOrUnknown(data['name_vi']!, _nameViMeta),
      );
    } else if (isInserting) {
      context.missing(_nameViMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('order_idx')) {
      context.handle(
        _orderIdxMeta,
        orderIdx.isAcceptableOrUnknown(data['order_idx']!, _orderIdxMeta),
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
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  RequestTypesCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RequestTypesCacheData(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      nameVi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_vi'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      )!,
      orderIdx: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_idx'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $RequestTypesCacheTable createAlias(String alias) {
    return $RequestTypesCacheTable(attachedDatabase, alias);
  }
}

class RequestTypesCacheData extends DataClass
    implements Insertable<RequestTypesCacheData> {
  final String code;
  final String nameVi;
  final String nameEn;
  final String icon;
  final String color;
  final int orderIdx;
  final DateTime cachedAt;
  const RequestTypesCacheData({
    required this.code,
    required this.nameVi,
    required this.nameEn,
    required this.icon,
    required this.color,
    required this.orderIdx,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name_vi'] = Variable<String>(nameVi);
    map['name_en'] = Variable<String>(nameEn);
    map['icon'] = Variable<String>(icon);
    map['color'] = Variable<String>(color);
    map['order_idx'] = Variable<int>(orderIdx);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  RequestTypesCacheCompanion toCompanion(bool nullToAbsent) {
    return RequestTypesCacheCompanion(
      code: Value(code),
      nameVi: Value(nameVi),
      nameEn: Value(nameEn),
      icon: Value(icon),
      color: Value(color),
      orderIdx: Value(orderIdx),
      cachedAt: Value(cachedAt),
    );
  }

  factory RequestTypesCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RequestTypesCacheData(
      code: serializer.fromJson<String>(json['code']),
      nameVi: serializer.fromJson<String>(json['nameVi']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      icon: serializer.fromJson<String>(json['icon']),
      color: serializer.fromJson<String>(json['color']),
      orderIdx: serializer.fromJson<int>(json['orderIdx']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'nameVi': serializer.toJson<String>(nameVi),
      'nameEn': serializer.toJson<String>(nameEn),
      'icon': serializer.toJson<String>(icon),
      'color': serializer.toJson<String>(color),
      'orderIdx': serializer.toJson<int>(orderIdx),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  RequestTypesCacheData copyWith({
    String? code,
    String? nameVi,
    String? nameEn,
    String? icon,
    String? color,
    int? orderIdx,
    DateTime? cachedAt,
  }) => RequestTypesCacheData(
    code: code ?? this.code,
    nameVi: nameVi ?? this.nameVi,
    nameEn: nameEn ?? this.nameEn,
    icon: icon ?? this.icon,
    color: color ?? this.color,
    orderIdx: orderIdx ?? this.orderIdx,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  RequestTypesCacheData copyWithCompanion(RequestTypesCacheCompanion data) {
    return RequestTypesCacheData(
      code: data.code.present ? data.code.value : this.code,
      nameVi: data.nameVi.present ? data.nameVi.value : this.nameVi,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      icon: data.icon.present ? data.icon.value : this.icon,
      color: data.color.present ? data.color.value : this.color,
      orderIdx: data.orderIdx.present ? data.orderIdx.value : this.orderIdx,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RequestTypesCacheData(')
          ..write('code: $code, ')
          ..write('nameVi: $nameVi, ')
          ..write('nameEn: $nameEn, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('orderIdx: $orderIdx, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, nameVi, nameEn, icon, color, orderIdx, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RequestTypesCacheData &&
          other.code == this.code &&
          other.nameVi == this.nameVi &&
          other.nameEn == this.nameEn &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.orderIdx == this.orderIdx &&
          other.cachedAt == this.cachedAt);
}

class RequestTypesCacheCompanion
    extends UpdateCompanion<RequestTypesCacheData> {
  final Value<String> code;
  final Value<String> nameVi;
  final Value<String> nameEn;
  final Value<String> icon;
  final Value<String> color;
  final Value<int> orderIdx;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const RequestTypesCacheCompanion({
    this.code = const Value.absent(),
    this.nameVi = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.orderIdx = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RequestTypesCacheCompanion.insert({
    required String code,
    required String nameVi,
    required String nameEn,
    required String icon,
    required String color,
    this.orderIdx = const Value.absent(),
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       nameVi = Value(nameVi),
       nameEn = Value(nameEn),
       icon = Value(icon),
       color = Value(color),
       cachedAt = Value(cachedAt);
  static Insertable<RequestTypesCacheData> custom({
    Expression<String>? code,
    Expression<String>? nameVi,
    Expression<String>? nameEn,
    Expression<String>? icon,
    Expression<String>? color,
    Expression<int>? orderIdx,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (nameVi != null) 'name_vi': nameVi,
      if (nameEn != null) 'name_en': nameEn,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (orderIdx != null) 'order_idx': orderIdx,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RequestTypesCacheCompanion copyWith({
    Value<String>? code,
    Value<String>? nameVi,
    Value<String>? nameEn,
    Value<String>? icon,
    Value<String>? color,
    Value<int>? orderIdx,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return RequestTypesCacheCompanion(
      code: code ?? this.code,
      nameVi: nameVi ?? this.nameVi,
      nameEn: nameEn ?? this.nameEn,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      orderIdx: orderIdx ?? this.orderIdx,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (nameVi.present) {
      map['name_vi'] = Variable<String>(nameVi.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (orderIdx.present) {
      map['order_idx'] = Variable<int>(orderIdx.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RequestTypesCacheCompanion(')
          ..write('code: $code, ')
          ..write('nameVi: $nameVi, ')
          ..write('nameEn: $nameEn, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('orderIdx: $orderIdx, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$RequestsDatabase extends GeneratedDatabase {
  _$RequestsDatabase(QueryExecutor e) : super(e);
  $RequestsDatabaseManager get managers => $RequestsDatabaseManager(this);
  late final $RequestTypesCacheTable requestTypesCache =
      $RequestTypesCacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [requestTypesCache];
}

typedef $$RequestTypesCacheTableCreateCompanionBuilder =
    RequestTypesCacheCompanion Function({
      required String code,
      required String nameVi,
      required String nameEn,
      required String icon,
      required String color,
      Value<int> orderIdx,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$RequestTypesCacheTableUpdateCompanionBuilder =
    RequestTypesCacheCompanion Function({
      Value<String> code,
      Value<String> nameVi,
      Value<String> nameEn,
      Value<String> icon,
      Value<String> color,
      Value<int> orderIdx,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$RequestTypesCacheTableFilterComposer
    extends Composer<_$RequestsDatabase, $RequestTypesCacheTable> {
  $$RequestTypesCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameVi => $composableBuilder(
    column: $table.nameVi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIdx => $composableBuilder(
    column: $table.orderIdx,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RequestTypesCacheTableOrderingComposer
    extends Composer<_$RequestsDatabase, $RequestTypesCacheTable> {
  $$RequestTypesCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameVi => $composableBuilder(
    column: $table.nameVi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIdx => $composableBuilder(
    column: $table.orderIdx,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RequestTypesCacheTableAnnotationComposer
    extends Composer<_$RequestsDatabase, $RequestTypesCacheTable> {
  $$RequestTypesCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get nameVi =>
      $composableBuilder(column: $table.nameVi, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<int> get orderIdx =>
      $composableBuilder(column: $table.orderIdx, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$RequestTypesCacheTableTableManager
    extends
        RootTableManager<
          _$RequestsDatabase,
          $RequestTypesCacheTable,
          RequestTypesCacheData,
          $$RequestTypesCacheTableFilterComposer,
          $$RequestTypesCacheTableOrderingComposer,
          $$RequestTypesCacheTableAnnotationComposer,
          $$RequestTypesCacheTableCreateCompanionBuilder,
          $$RequestTypesCacheTableUpdateCompanionBuilder,
          (
            RequestTypesCacheData,
            BaseReferences<
              _$RequestsDatabase,
              $RequestTypesCacheTable,
              RequestTypesCacheData
            >,
          ),
          RequestTypesCacheData,
          PrefetchHooks Function()
        > {
  $$RequestTypesCacheTableTableManager(
    _$RequestsDatabase db,
    $RequestTypesCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RequestTypesCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RequestTypesCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RequestTypesCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> nameVi = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<int> orderIdx = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RequestTypesCacheCompanion(
                code: code,
                nameVi: nameVi,
                nameEn: nameEn,
                icon: icon,
                color: color,
                orderIdx: orderIdx,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String nameVi,
                required String nameEn,
                required String icon,
                required String color,
                Value<int> orderIdx = const Value.absent(),
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => RequestTypesCacheCompanion.insert(
                code: code,
                nameVi: nameVi,
                nameEn: nameEn,
                icon: icon,
                color: color,
                orderIdx: orderIdx,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RequestTypesCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$RequestsDatabase,
      $RequestTypesCacheTable,
      RequestTypesCacheData,
      $$RequestTypesCacheTableFilterComposer,
      $$RequestTypesCacheTableOrderingComposer,
      $$RequestTypesCacheTableAnnotationComposer,
      $$RequestTypesCacheTableCreateCompanionBuilder,
      $$RequestTypesCacheTableUpdateCompanionBuilder,
      (
        RequestTypesCacheData,
        BaseReferences<
          _$RequestsDatabase,
          $RequestTypesCacheTable,
          RequestTypesCacheData
        >,
      ),
      RequestTypesCacheData,
      PrefetchHooks Function()
    >;

class $RequestsDatabaseManager {
  final _$RequestsDatabase _db;
  $RequestsDatabaseManager(this._db);
  $$RequestTypesCacheTableTableManager get requestTypesCache =>
      $$RequestTypesCacheTableTableManager(_db, _db.requestTypesCache);
}
