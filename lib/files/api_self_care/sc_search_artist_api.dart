import 'dart:convert';

import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<SearchModel> scSearchArtistApi(List<String> keys,
    {int pageNo = 0}) async {
  Map<String, dynamic> jsonData = {
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Artist",
    "filterPref": "begin",
    "locale": "${StoreManager().languageSort}",
    "searchKey": keys
  };
  Map<String, dynamic> jsonResp = {};
  jsonResp = await NetworkManager()
      .post(atristNameSearchUrl, null, jsonData: jsonData);
  //jsonResp = json.decode(_json);
  print("=========== $jsonResp");
  SearchModel model = SearchModel.fromJson(jsonResp);
  return model;
}

String _json = """{
    "responseMap": {
        "artistList": [
            {
                "val": "katy perry",
                "count": 55
            },
            {
                "val": "katy perry and snoop dogg",
                "count": 2
            },
            {
                "val": "3oh3 and katy perry",
                "count": 1
            },
            {
                "val": "calvin harrispharrell williamskaty perrybig sean",
                "count": 1
            },
            {
                "val": "katy perry ft migos",
                "count": 1
            }
        ],
        "toneList": [
            {
                "toneId": "104880",
                "toneName": "SHIN KWEL V2",
                "artistName": "KAUNG KAUNG",
                "albumName": "SHIN KWEL",
                "price": 50,
                "categoryId": 228,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=4r019X0km6o=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=4r019X0km6o="
            },
            {
                "toneId": "104879",
                "toneName": "SHIN KWEL V1",
                "artistName": "KAUNG KAUNG",
                "albumName": "SHIN KWEL",
                "price": 50,
                "categoryId": 228,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=IMJedTyrHe0=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=IMJedTyrHe0="
            },
            {
                "toneId": "104878",
                "toneName": "SHIN KWEL CHO",
                "artistName": "KAUNG KAUNG",
                "albumName": "SHIN KWEL",
                "price": 50,
                "categoryId": 228,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=23xyIiruFl8=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=23xyIiruFl8="
            },
            {
                "toneId": "104894",
                "toneName": "SHWE NGWAY MA LO THU PAR VER1",
                "artistName": "MAY SWEET",
                "albumName": "YAY MHWAYE",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=Evm3pn4lGWo=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=Evm3pn4lGWo="
            },
            {
                "toneId": "104893",
                "toneName": "SHWE NGWAY MA LO THU PAR CHO",
                "artistName": "MAY SWEET",
                "albumName": "YAY MHWAYE",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=eyUYM2S52jU=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=eyUYM2S52jU="
            },
            {
                "toneId": "104892",
                "toneName": "SATE NYIT VER1",
                "artistName": "MAY SWEET",
                "albumName": "YAY MHWAYE",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=PbHmm7Q7dXA=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=PbHmm7Q7dXA="
            },
            {
                "toneId": "104891",
                "toneName": "SATE NYIT CHO",
                "artistName": "MAY SWEET",
                "albumName": "YAY MHWAYE",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=yowtnoDgKT0=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=yowtnoDgKT0="
            },
            {
                "toneId": "104787",
                "toneName": "SAKAR PYAW THAW HMIN V2",
                "artistName": "SAR CHOUK YOPE (SCY),JITT",
                "albumName": "SAKAR PYAW THAW HMIN",
                "price": 300,
                "categoryId": 134,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=svobd6Q4iDo=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=svobd6Q4iDo="
            },
            {
                "toneId": "104786",
                "toneName": "SAKAR PYAW THAW HMIN V1",
                "artistName": "SAR CHOUK YOPE (SCY),JITT",
                "albumName": "SAKAR PYAW THAW HMIN",
                "price": 300,
                "categoryId": 134,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=c0HyRK8szHE=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=c0HyRK8szHE="
            },
            {
                "toneId": "104785",
                "toneName": "SAKAR PYAW THAW HMIN CHO",
                "artistName": "SAR CHOUK YOPE (SCY),JITT",
                "albumName": "SAKAR PYAW THAW HMIN",
                "price": 300,
                "categoryId": 134,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=hBsNNba42d8=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=hBsNNba42d8="
            },
            {
                "toneId": "104753",
                "toneName": "SHWE LATE PYAR LAY KHOUT TONT LUU LAR VER1",
                "artistName": "SOE SANDAR HTUN",
                "albumName": "THAR CHO NHINT BONE KA HTAIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=qNVLKxo4tYQ=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=qNVLKxo4tYQ="
            },
            {
                "toneId": "104752",
                "toneName": "SHWE LATE PYAR LAY KHOUT TONT LUU LAR CHO",
                "artistName": "SOE SANDAR HTUN",
                "albumName": "THAR CHO NHINT BONE KA HTAIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=evdkTQn9Ov4=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=evdkTQn9Ov4="
            },
            {
                "toneId": "104751",
                "toneName": "SHWE KYAUNG PYAW VER1",
                "artistName": "SOE SANDAR HTUN",
                "albumName": "THAR CHO NHINT BONE KA HTAIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=p+4KdLh1rJo=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=p+4KdLh1rJo="
            },
            {
                "toneId": "104750",
                "toneName": "SHWE KYAUNG PYAW CHO",
                "artistName": "SOE SANDAR HTUN",
                "albumName": "THAR CHO NHINT BONE KA HTAIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=4QydERshXoE=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=4QydERshXoE="
            },
            {
                "toneId": "104749",
                "toneName": "SHIN LAIN PYAN NAR PAN PHOH VER1",
                "artistName": "SOE SANDAR HTUN",
                "albumName": "THAR CHO NHINT BONE KA HTAIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=oxE6gLUzDoY=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=oxE6gLUzDoY="
            },
            {
                "toneId": "104748",
                "toneName": "SHIN LAIN PYAN NAR PAN PHOH CHO",
                "artistName": "SOE SANDAR HTUN",
                "albumName": "THAR CHO NHINT BONE KA HTAIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=7oQSUgeXVdc=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=7oQSUgeXVdc="
            },
            {
                "toneId": "104733",
                "toneName": "SHWE LAL TINE VER1",
                "artistName": "MAY SWEET",
                "albumName": "SHWE LAL TINE",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=NWIVwSO0LO4=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=NWIVwSO0LO4="
            },
            {
                "toneId": "104732",
                "toneName": "SHWE LAL TINE CHO",
                "artistName": "MAY SWEET",
                "albumName": "SHWE LAL TINE",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=yZp3/eXrbBo=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=yZp3/eXrbBo="
            },
            {
                "toneId": "104711",
                "toneName": "SHWE EAIN NAN VER1",
                "artistName": "MAY SWEET",
                "albumName": "MYAT LONE SEIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=6WsvoOpah2s=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=6WsvoOpah2s="
            },
            {
                "toneId": "104710",
                "toneName": "SHWE EAIN NAN CHO",
                "artistName": "MAY SWEET",
                "albumName": "MYAT LONE SEIN",
                "price": 315,
                "categoryId": 138,
                "expiryDate": "Mon Dec 31 00:00:00 UTC 2035",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=P/Xf1ZwSta0=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=P/Xf1ZwSta0="
            }
        ]
    },
    "message": "Success",
    "respTime": "Response Time",
    "statusCode": "SC0000"
}""";
