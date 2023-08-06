// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unrelated_type_equality_checks

library artifact_library;

import 'package:artifact_library/artifacts.dart';

class Artifact {
  final String artifact_name;
  final ArtifactType type;
  final StatusDependent statusDependent;
  final MainOptions main_option;
  final List<SubOptionInfo> sub_option;

  Artifact(
    this.artifact_name,
    this.type,
    this.statusDependent,
    this.main_option,
    this.sub_option,
  );

  double calculate() {
    if (sub_option.length > 4) {
      throw Exception('The number of suboptions must be no more than 4');
    }

    double? atk_percentage;
    double? elementalMastery;
    double? def_percentage;
    double? hp_percentage;
    double? energy_Recharge;
    double? crit_rate;
    double? crit_dmg;
    double result = 0;

    for (SubOptionInfo option in sub_option) {
      if (option.subOptionType == SubOptions.ATK_percentage) {
        atk_percentage = option.value;
      }
      if (option.subOptionType == SubOptions.ElementalMastery) {
        elementalMastery = option.value;
      }
      if (option.subOptionType == SubOptions.DEF_percentage) {
        def_percentage = option.value;
      }
      if (option.subOptionType == SubOptions.HP_percentage) {
        hp_percentage = option.value;
      }
      if (option.subOptionType == SubOptions.Energy_Recharge) {
        energy_Recharge = option.value;
      }
      if (option.subOptionType == SubOptions.CRIT_Rate) {
        crit_rate = option.value;
      }
      if (option.subOptionType == SubOptions.CRIT_DMG) {
        crit_dmg = option.value;
      }
    }

    result = ((crit_rate ?? 0) * 2) + (crit_dmg ?? 0);

    if (crit_rate != null || crit_dmg != null) {
      if (statusDependent == StatusDependent.DMG) {
        if (atk_percentage != null) {
          result += (atk_percentage);
        }
      } else if (statusDependent == StatusDependent.ElementalMastery) {
        if (elementalMastery != null) {
          result += (elementalMastery * 0.4);
        }
      } else if (statusDependent == StatusDependent.DEF) {
        if (def_percentage != null) {
          result += (def_percentage);
        }
      } else if (statusDependent == StatusDependent.Energy_Recharge) {
        if (energy_Recharge != null) {
          result += (energy_Recharge);
        }
      } else if (statusDependent == StatusDependent.HP) {
        if (hp_percentage != null) {
          result += (hp_percentage);
        }
      }
    }

    return result;
  }
}

class OptionInfo {
  final String display_name;
  final double? main_value_percentage;
  final int? main_value;
  final double? value_percentage;
  final int? value;
  final bool is_percentage;

  OptionInfo(
    this.display_name,
    this.main_value_percentage,
    this.main_value,
    this.value_percentage,
    this.value,
    this.is_percentage,
  );
}

enum MainOptions {
  CRIT_Rate('会心率', 31.1, null, true),
  CRIT_DMG('会心ダメージ', 62.2, null, true),
  HP_percentage('HP(%)', 46.6, null, true),
  HP('HP', null, 4780, false),
  Energy_Recharge('元素チャージ効率', 51.8, null, true),
  DEF_percentage('防御力(%)', 58.3, null, true),
  ATK_percentage('攻撃力(%)', 46.6, null, true),
  ATK('攻撃力', null, 311, false),
  ElementalMastery('元素熟知', null, 187, false);

  final String display_name;
  final double? main_value_percentage;
  final int? main_value;
  final bool is_percentage;

  const MainOptions(
    this.display_name,
    this.main_value_percentage,
    this.main_value,
    this.is_percentage,
  );
}

enum StatusDependent {
  /// ダメージ依存キャラ
  DMG,

  /// 元素熟知依存キャラ
  ElementalMastery,

  ///防御依存キャラ
  DEF,

  /// 元素チャージ効率依存キャラ
  Energy_Recharge,

  /// HP依存キャラ
  HP;
}

enum SubOptions {
  CRIT_Rate('会心率', null, null),
  CRIT_DMG('会心ダメージ', null, null),
  HP_percentage('HP(%)', null, null),
  HP('HP', null, null),
  Energy_Recharge('元素チャージ効率', null, null),
  DEF_percentage('防御力(%)', null, null),
  DEF('防御力', null, null),
  ATK_percentage('攻撃力(%)', null, null),
  ATK('攻撃力', null, null),
  ElementalMastery('元素熟知', null, null),
  None(null,null,null);

  final String? display_name;
  final double? value_percentage;
  final int? value;

  const SubOptions(
    this.display_name,
    this.value_percentage,
    this.value,
  );
}

class SubOptionInfo {
  final SubOptions subOptionType;
  final double? value;

  SubOptionInfo(this.subOptionType, this.value);
}
