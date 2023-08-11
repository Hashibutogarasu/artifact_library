// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:artifact_library/artifactbaseclass.dart';

class Character implements ArtifactBaseClass<Character> {
  final String charactername;
  final String avaterURL;
  final String iconURL;
  final int rare;
  final String characterdescription;
  final Elements element;

  const Character(
    this.charactername,
    this.avaterURL,
    this.iconURL,
    this.rare,
    this.characterdescription,
    this.element,
  );

  @override
  Character? fromMap(Map map) {
    return Character(
      map['charactername'],
      map['avaterURL'],
      map['iconURL'],
      map['rare'],
      map['characterdescription'],
      map['element'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'charactername': charactername,
      'avaterURL': avaterURL,
      'iconURL': iconURL,
      'rare': rare,
      'characterdescription': characterdescription,
      'element': element.display_name_jp,
    };
  }
}

enum Elements {
  Anemo('風元素'),
  Pyro('炎元素'),
  Electro('雷元素'),
  Cryo('氷元素'),
  Dendro('草元素'),
  Hydro('水元素'),
  Geo('岩元素'),
  None('');

  final String display_name_jp;

  const Elements(this.display_name_jp);

  static Elements fromname(String name) {
    for (var element in Elements.values) {
      if (name == element.display_name_jp) {
        return element;
      }
    }

    return Elements.None;
  }
}
