// ignore_for_file: avoid_print

import 'package:artifact_library/artifacts.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:artifact_library/artifact_library.dart';

void main() {
  test('calculate artifact', () {
    Artifact result = Artifact(
      Artifacts.Crimson_Witch_of_Flames.info.Circlet_of_Logos ?? '',
      ArtifactType.Sands_of_Eon,
      StatusDependent.DMG,
      MainOptions.ATK_percentage,
      [
        SubOptionInfo(SubOptions.HP, 26.9),
        SubOptionInfo(SubOptions.ATK, 29),
        SubOptionInfo(SubOptions.CRIT_Rate, 10.1),
        SubOptionInfo(SubOptions.CRIT_DMG, 14.8),
      ],
    );
    print(result.artifact_name);
    print(result.calculate());
  });
}
