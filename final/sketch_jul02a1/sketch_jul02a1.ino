#include <Ultrasonic.h>

#define TRIGGER_PIN  12
#define ECHO_PIN     13

Ultrasonic ultrasonic(TRIGGER_PIN, ECHO_PIN);

void setup() {
  Serial.begin(9600);
}
void loop() {

  int cmMsec ;
  int inMsec;
  long microsec = ultrasonic.timing();

  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
  inMsec = ultrasonic.convert(microsec, Ultrasonic::IN);
   //Serial.write(cmMsec);
//  inMsec = 10;
   Serial.write(inMsec);
//   Serial.write("breakpoint");

//  Serial.print("MS: ");
//  Serial.print(microsec);
  //Serial.println("CM: ");
  //Serial.println(cmMsec);
  delay(100);
//  Serial.print("IN: ");
//  Serial.println(inMsec);
 

}



