// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationList _$ApplicationListFromJson(Map json) => $checkedCreate(
      'ApplicationList',
      json,
      ($checkedConvert) {
        final val = ApplicationList(
          $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => Application.fromJson(e as Map))
                  .toList()),
        );
        return val;
      },
    );

Application _$ApplicationFromJson(Map json) => $checkedCreate(
      'Application',
      json,
      ($checkedConvert) {
        final val = Application(
          metadata:
              $checkedConvert('metadata', (v) => MetaData.fromJson(v as Map)),
          spec: $checkedConvert(
              'spec', (v) => ApplicationSpec.fromJson(v as Map)),
        );
        return val;
      },
    );

MetaData _$MetaDataFromJson(Map json) => $checkedCreate(
      'MetaData',
      json,
      ($checkedConvert) {
        final val = MetaData(
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

ApplicationSpec _$ApplicationSpecFromJson(Map json) => $checkedCreate(
      'ApplicationSpec',
      json,
      ($checkedConvert) {
        final val = ApplicationSpec(
          $checkedConvert(
              'source', (v) => ApplicationSource.fromJson(v as Map)),
        );
        return val;
      },
    );

ApplicationSource _$ApplicationSourceFromJson(Map json) => $checkedCreate(
      'ApplicationSource',
      json,
      ($checkedConvert) {
        final val = ApplicationSource(
          repoURL: $checkedConvert('repoURL', (v) => v as String),
          chart: $checkedConvert('chart', (v) => v as String?),
          targetRevision:
              $checkedConvert('targetRevision', (v) => v as String?),
        );
        return val;
      },
    );
