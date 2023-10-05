
DateTime? loginClickTime;

//check multiClick
bool checkMultipleClick(DateTime currentTime) {
  if (loginClickTime == null) {
    loginClickTime = currentTime;
    return false;
  }
  if (currentTime.difference(loginClickTime!).inMilliseconds < 200) {
    //set this difference time in seconds
    return true;
  }

  loginClickTime = currentTime;
  return false;
}