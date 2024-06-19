//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:you_yemen/files/utility/constants.dart';

String homeBannerUrl =
    "https://mytune.atom.com.mm/apigw/Middleware/api/adapter/v1/crbt/banner?language=";
String searchToneIdUrl = "${baseUrl}search-tone";
String regenTokenUrl = "${baseUrlSecurity}regen-token";
String recomurl = "${baseUrl}get-recommendation-songs?";
String subscriberValidationUrl = "${baseUrl}subscriber-validation";
String generateOtpUrl = "${baseUrl}generate-otp";
String confirmOtpExistingUrl = "${baseUrl}confirm-otp";
String getSecurityTokenUrl = "${baseUrl}security-token";
String passwordValidationUrl = "${baseUrl}password-validation";
String getTonePriceUrl = "${baseUrlSecurity}get-tone-price";
String buyTuneUrl = "${baseUrlSecurity}set-tone";
String getCategoryUrl = '${baseUrl}categories?';
String getCategoryDetailUrl = "${baseUrl}search-tone?";
String searchToneUrl = "${baseUrl}specific-search-tones?";
String editProfileUrl = '${baseUrlSecurity}edit-profile';
String tellFriendUrl = "${baseUrlSecurity}referral";
String transactionUrl = "${baseUrlSecurity}view-transactions-scm";
String mytunesUrl = "${baseUrlSecurity}list-tones";
String myTuneListUrl = '${baseUrl}list-tones?rbtMode=400';
String addToShuffleUrl = "${baseUrlSecurity}add-tone-to-shuffle";
String playingTuneListUrl = '${baseUrl}list-tones?rbtMode=0';
String getPackStatusUrl = '${baseUrl}pack-status?';
String setDefaultToneUrl = '${baseUrlSecurity}set-default-tone';
String tuneSuffleUrl = '${baseUrlSecurity}shuffle-activation-deactivation';
String tuneSettingDedicatedUrl =
    '${baseUrlSecurity}dedicated-user-tone-addition-with-time-setting';
String tuneSettingFulldayUrl =
    '${baseUrlSecurity}time-based-setting-for-already-activated';

// ========== selfcare api================

String getSubscriptionUrl =
    '${selfcareBaseUrl}selfcare/subscription-service/get-subscription';

String advanceTuneSearchUrl = '${selfcareBaseUrl}selfcare/advanced-search';

String addToWishlistUrl =
    "${selfcareBaseUrl}selfcare/wishlist-service/get-wishlist";

String listSettingsUrl =
    "${selfcareBaseUrl}selfcare/subscriber-management/list-settings";

String suspendUrl = "${selfcareBaseUrl}selfcare/subscription/suspend";

String resumeUrl = "${selfcareBaseUrl}selfcare/subscription/suspend";

String deleteToneUrl =
    "${selfcareBaseUrl}selfcare/subscriber-management/delete-tone";

String deletePackUrl =
    "${selfcareBaseUrl}selfcare/subscriber-management/delete-pack";
String scGetBannerList = "http://10.0.14.4:5892/selfcare/get-banner-list?";
String scGetCategoryListUrl =
    "http://10.0.14.4:5892/selfcare/get-category-list?";

String scGetCategoryList = "http://10.0.14.4:5892/selfcare/get-category-list?";
String scBuyToneUrl =
    "http://10.0.10.33:5679/selfcare/subscriber-management/buy-tone";
String scGenerateOtpUrl =
    "http://10.0.13.19:9092/auth-service/selfcare/auth/otp";
String scConfirmOtpUrl =
    "http://10.0.13.19:9092/auth-service/selfcare/auth/token";

String scGetContentPriceUrl =
    "http://10.0.14.4:8082/selfcare/subscriber-management/get-content-price"; // get-content-price
String scSettingUrl = 'http://10.0.13.19:9093/setting-service/settings';

String scaddUrl =
    "http://10.0.10.33:9089/selfcare/setting-service/add-tone-to-shufflelist";

String scdeleteTonefromShuffleListUrl =
    "http://10.0.10.33:9089/selfcare/setting-service/delete-tone-from-shufflelist";
String scdeactivatetoneUrl =
    "http://10.0.10.33:5679/selfcare/subscriber-management/delete-tone";
String scdeletePackUrl =
    "http://10.0.10.33:9089/selfcare/setting-service/add-tone-to-shufflelist";
String sclistSettingsUrl =
    "http://10.0.14.4:8082/selfcare/subscriber-management/list-settings";
String scpackDetailsUrl =
    "http://10.0.10.33:9089/selfcare/setting-servic/get-subscription";
String scresumeUrl = "http://10.0.10.33:9089/selfcare/subscription/suspend";
String sclistTonesUrl =
    "http://10.0.14.4:8082/selfcare/subscriber-management/list-tones";

String searchNameToneUrl = "${baseUrl}specific-search-tones?";

String artistSearchUrl = "${baseUrl}specific-search-tones?";
String bannerDetailUrl = "${baseUrl}banner-search?";
String artistTunesUrl = "${baseUrl}search-tone?";
String deleteTonefromShuffleUrl =
    "${selfcareBaseUrl}selfcareselfcare/setting-service/delete-tone-from-shufflelist";

String shuffleUrl =
    "http://10.0.10.33:9089/selfcare/setting-service/add-tone-to-shufflelist";
// "http://10.0.10.33:8088/selfcare/setting-service/shuffle";
// "http://10.0.10.33:8088/selfcare/wishlist-service/get-wishlist"