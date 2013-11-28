import controlP5.*;
import processing.serial.*;

int KNOBS     = 6;
int BUTLOW    = color(255,0,0);
int BUTHI     = color(0,255,0);
int LF        = 10;   

ControlP5  cp5;
Serial     mySerial; 
Knob myKnob[]=new Knob[KNOBS];
int        values[];      


void setup() {
  size(700,150);
  cp5 = new ControlP5(this);
  
  for (int i=0; i<KNOBS; i++) {
    myKnob[i]=cp5.addKnob("knob"+i) .setRange(0,1023) .setValue(512) .setPosition(30+i*110,30) .setRadius(50) ;
  }

  String portName = Serial.list()[0];
  println("Serial port name is "+portName);
  mySerial = new Serial(this, portName, 9600);
  mySerial.bufferUntil(LF);
 }


void draw() {
}

 
void serialEvent(Serial myPort) {
   String myString = mySerial.readString();
   print(myString);
  if (myString != null) {
    values = int(split(trim(myString), ','));
    if (values.length==12) {
      for (int i=0; i<KNOBS; i++) {
        myKnob[i].setValue(values[i]);
        if (values[KNOBS+i]==0) myKnob[i].setColorForeground(BUTLOW); else myKnob[i].setColorForeground(BUTHI);
      }
    }
  }
}



  




