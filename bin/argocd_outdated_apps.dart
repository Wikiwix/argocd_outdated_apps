import 'dart:convert';
import 'dart:io';
import 'package:argocd_outdated_apps/types.dart';
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

Future<void> main(List<String> arguments) async {
  final inputString = systemEncoding.decodeStream(stdin);
  final applicationList = ApplicationList.fromJson(
    loadYaml(await inputString),
  );
  final helmApps =
      applicationList.items.where((app) => app.spec.source.chart != null);
  final helmRepos =
      helmApps.map((helmApp) => helmApp.spec.source.repoURL).toSet();
  final helmRepoData = {
    for (final helmRepo in helmRepos)
      helmRepo: Future(
        () async {
          final yamlUri = Uri.parse(
              '${helmRepo.endsWith('/') ? helmRepo : '$helmRepo/'}index.yaml');
          return loadYaml((await http.get(yamlUri)).body);
        },
      )
  };
  final asyncResult = [
    for (final helmApp in helmApps)
      () async {
        final sourceData = helmApp.spec.source;
        late final String latestVersion;
        try {
          latestVersion = (await (helmRepoData[sourceData.repoURL]))['entries']
              [sourceData.chart][0]['version'];
        } on Exception catch (e) {
          latestVersion = e.toString();
        }
        return {
          'appName': helmApp.metadata.name,
          'repoURL': sourceData.repoURL,
          'chart': sourceData.chart,
          'currentVersion': sourceData.targetRevision,
          'latestVersion': latestVersion,
        };
      }()
  ];
  final result = await Future.wait(asyncResult);
  final outdated =
      result.where((app) => app['currentVersion'] != app['latestVersion']);
  stdout.writeln(
      JsonEncoder.withIndent('  ').convert(outdated.toList(growable: false)));
  await stdout.flush();
}
