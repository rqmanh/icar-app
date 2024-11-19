// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class ApiConstants {
  // static const String baseUrl = "http://localhost:3000/public/index.php/";
  // static const String baseUrl = 'http://localhost:8000/api/v1';
  // static const String baseUrl = 'http://192.168.1.123:8000/api/v1';
  // static const String baseUrl = 'http://127.0.0.1:8000/api/v1';
  // static const String baseUrl = 'http://192.168.1.105:8000/api/v1';
  // static const String baseUrl = 'http://192.168.1.105:8000/api/v1';
  static const String baseUrl = 'https://api.getbzz.com/api/v1';
  // static const String baseUrl = 'http://10.0.2.2:8000/api/v1';
  // static const String baseUrl = 'https://control.tinderfood.com';
  static const Map<String, String> headers = {
    'Accept': 'application/json',
  };

  static const String sendOtp = '/auth/send-otp';

  static const String verifyOtp = '/auth/verify-otp';
  static const String signUp = '/auth/complete-register';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';

//=======================================
  static const String events = '/events';
  //============================================================================
  static const String activities = '/activities';
  static const String taggedActivities = '/activity-tags';
  static const String activityComments = '/activity-comments';
  static const String requestToJoin = '$activities/request-to-join';
  static const String acceptRequest = '$activities/approval-request-to-join';
  static const String cancelRequest = '$activities/cancel-request-to-join';
  static const String removeOrLeave = '$activities/remove-or-leave-member/';
  static const String allActivities = '/all-activities';
  static const String previousActivities = '/previous-activities';
  static const String foryouActivities = '/foryou-activities';

  //===================================
  static const String getProfile = '/get-profile';
  static const String getFollowers = '/get-followers';
  static const String getFollowing = '/get-followings';
  static const String followUser = '/follow';
  static const String updateProfile = '/update-profile?_method=PUT';

//============================================================================
  static const String reels = '/reels';
  static const String reelComments = '/reel-comments';
  //===================================
  static const String stories = '/stories';
  // static const String getStoriesByUser = '/story/get-stories-by-user';
  static const String deleteStory = '/stories';
  static const String viewStory = '/stories';
  static const String getStories = '/stories';

  ///===================================
  static const String notifications = '/notifications';

  ///================================
  static const String users = '/users';
}
