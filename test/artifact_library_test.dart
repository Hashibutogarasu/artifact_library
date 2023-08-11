// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:artifact_library/artifacts.dart';
import 'package:artifact_library/character/character.dart';
import 'package:artifact_library/datagen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:artifact_library/artifact_library.dart';
import 'package:html/parser.dart';

String removetag(String htmlString) {
  final document = parse(htmlString);
  final String parsedString =
      parse(document.body?.text).documentElement?.text ?? '';

  return parsedString;
}

void main() {
  group('artifact test', () {
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

      Artifact artifact = Artifact.getInstance().fromMap(result.toMap()) ??
          Artifact.getInstance();
      print(artifact.calculate());
    });

    test('generate', () async {
      print('generating...');

      await dotenv.load(fileName: '.env');

      String enums = '';
      var url =
          'https://sg-wiki-api.hoyolab.com/hoyowiki/genshin/wapi/get_entry_page_list';
      var body = jsonEncode({
        "filters": [],
        "menu_id": "2",
        "page_num": 2,
        "page_size": 50,
        "use_es": true,
      });
      var cookie = dotenv.get('COOKIE');
      var result = await DataGen().postRequest(url, body, cookie);
      var characters = (((json.decode(utf8.decode(result.body.codeUnits))
          as Map)['data']) as Map)['list'] as List<dynamic>;

      for (int i = 0; i < characters.length; i++) {
        var info = await DataGen().getcharacter(characters[i]['entry_page_id']);
        var character = json.decode(utf8.decode(info.body.codeUnits));

        var name = removetag(json.decode(character['data']['page']['modules'][0]
                ['components'][0]['data'])['list'][0]['value'][0])
            .trim()
            .split('/')[1]
            .trim();
        var display_name = character['data']['page']['name'];

        var header_img_url = character['data']['page']['header_img_url'];
        var icon_url = character['data']['page']['icon_url'];
        var rare = (character['data']['page']['filter_values']
                ['character_rarity']['values'][0])
            .toString()
            .replaceAll('★', '');
        var desc = removetag(character['data']['page']['desc']);
        var element_name = (!(character['data']['page']['filter_values'] as Map)
                .keys
                .contains('character_vision'))
            ? character['data']['page']['filter_values']['character_vision']
                ['value_types'][0]['value']
            : 'None';
        var element = Elements.fromname(element_name);

        var data =
            '$name(\n\tCharacter(\n\t\t\'$display_name\',\n\t\t\'$header_img_url\',\n\t\t\'$icon_url\',\n\t\t$rare,\n\t\t\'$desc\',\n\t\t$element,\n\t),\n)';
        enums += '$data,\n';
        sleep(const Duration(seconds: 1));
      }

      print(enums);
    });
  });
}
