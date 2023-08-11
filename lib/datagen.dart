// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:http/http.dart' as http;

class DataGen {
  Future<void> generate() async {}

  Future<http.Response> postRequest(
      String url, String body, String cookie) async {
    return http.post(
      Uri.parse(url),
      headers: {
        'POST': '/hoyowiki/genshin/wapi/get_entry_page_list HTTP/2',
        'Host': 'sg-wiki-api.hoyolab.com',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'ja,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br',
        'Content-Type': 'vapplication/json;charset=utf-8',
        'x-rpc-language': 'ja-jp',
        'x-rpc-wiki_app': 'genshin',
        'Content-Length': body.length.toString(),
        'Origin': 'https://wiki.hoyolab.com',
        'Connection': 'keep-alive',
        'Referer': 'https://wiki.hoyolab.com/',
        'Cookie': cookie,
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-site',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache',
        'TE': 'trailers',
      },
      body: body,
    );
  }

  Future<http.Response> getcharacter(String entry_page_id) {
    return http.get(
        Uri.parse(
          'https://sg-wiki-api-static.hoyolab.com/hoyowiki/genshin/wapi/entry_page?entry_page_id=$entry_page_id',
        ),
        headers: {
          'GET':
              '/hoyowiki/genshin/wapi/entry_page?entry_page_id=$entry_page_id HTTP/2',
          'Host': 'sg-wiki-api-static.hoyolab.com',
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0',
          'Accept': 'application/json, text/plain, */*',
          'Accept-Language': 'ja,en-US;q=0.7,en;q=0.3',
          'Accept-Encoding': 'gzip, deflate, br',
          'x-rpc-language': 'ja-jp',
          'x-rpc-wiki_app': 'genshin',
          'Origin': 'https://wiki.hoyolab.com',
          'Connection': 'keep-alive',
          'Referer': 'https://wiki.hoyolab.com/',
          'Sec-Fetch-Dest': 'empty',
          'Sec-Fetch-Mode': 'cors',
          'Sec-Fetch-Site': 'same-site',
        });
  }
}
