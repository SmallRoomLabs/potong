void setup() {
  for (int i=2; i<8; i++) pinMode(i, INPUT);
  Serial.begin(9600);
  while (!Serial);
}

void loop() {
  char tmps[100];
  sprintf(tmps,
      "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d",
      analogRead(0),analogRead(1),analogRead(2),analogRead(3),analogRead(4),analogRead(5),
      digitalRead(2),digitalRead(3),digitalRead(4),digitalRead(5),digitalRead(6),digitalRead(7));
  Serial.println(tmps);
  delay(200);
}


