// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class Character {
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
  
  static Elements fromname(String name){
    for(var element in Elements.values){
      if(name == element.display_name_jp){
        return element;
      }
    }

    return Elements.None;
  }
}
