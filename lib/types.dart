import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

typedef JsonMap<T> = Map<String, T>;

@JsonSerializable(
  anyMap: true,
  checked: true,
  explicitToJson: true,
  includeIfNull: true,
  createToJson: false,
)
class ApplicationList {
  final List<Application> items;

  ApplicationList(this.items);
  factory ApplicationList.fromJson(Map json) => _$ApplicationListFromJson(json);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  explicitToJson: true,
  includeIfNull: true,
  createToJson: false,
)
class Application {
  Application({
    required this.metadata,
    required this.spec,
  });
  final MetaData metadata;
  final ApplicationSpec spec;
  factory Application.fromJson(Map json) => _$ApplicationFromJson(json);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  explicitToJson: true,
  includeIfNull: true,
  createToJson: false,
)
class MetaData {
  final String name;

  MetaData({required this.name});
  factory MetaData.fromJson(Map json) => _$MetaDataFromJson(json);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  explicitToJson: true,
  includeIfNull: true,
  createToJson: false,
)
class ApplicationSpec {
  final ApplicationSource source;

  ApplicationSpec(this.source);

  factory ApplicationSpec.fromJson(Map json) => _$ApplicationSpecFromJson(json);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  explicitToJson: true,
  includeIfNull: true,
  createToJson: false,
)
class ApplicationSource {
  final String repoURL;
  final String? chart;
  final String? targetRevision;

  ApplicationSource({
    required this.repoURL,
    this.chart,
    this.targetRevision,
  });

  factory ApplicationSource.fromJson(Map json) =>
      _$ApplicationSourceFromJson(json);
}
