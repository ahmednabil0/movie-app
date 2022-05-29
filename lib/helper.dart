String cuttext(String string) {
  if (string.length > 25) {
    return string.replaceRange(25, string.length, '...');
  } else {
    return string;
  }
}
