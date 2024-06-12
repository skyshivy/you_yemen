//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:you_yemen/files/utility/constants.dart';

String settingUrl = '${baseUrl}settings';
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

String buyToneUrl = "${selfcareBaseUrl}selfcare/subscriber-management/buy-tone";

String suspendUrl = "${selfcareBaseUrl}selfcare/subscription/suspend";

String resumeUrl = "${selfcareBaseUrl}selfcare/subscription/suspend";

String deleteToneUrl =
    "${selfcareBaseUrl}selfcare/subscriber-management/delete-tone";

String deletePackUrl =
    "${selfcareBaseUrl}selfcare/subscriber-management/delete-pack";


