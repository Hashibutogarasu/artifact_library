# Artifact Library

Genshin Impact artifact score calculator

Example
```dart
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
```

output
```
魔女の破滅の時
35.0
```
