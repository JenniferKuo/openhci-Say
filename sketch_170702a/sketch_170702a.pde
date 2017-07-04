import processing.serial.*;

  
import processing.sound.*;
SoundFile file;

Serial serial; 

int cmMsec;

import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer groove;
int num = 1;

void setup() {
     

  // 設定畫布大小為 305 x 200

  size(1, 1);

   
  minim = new Minim(this);

  // 開啟 Serial port，通訊速率為 9600 bps 

  // 注意! 如果你 Arduino 不是接在 COM4，請做適當調整
  
  String portName = Serial.list()[4];
  print(portName);
  serial = new Serial(this, portName, 9600);
  groove = minim.loadFile(num +".mp3", 2048);

}

 

void draw() {
 
  if ( serial.available() > 0) {

    // 讀取從 Serial Port 傳進來的 Sensor 讀值

    cmMsec = serial.read();

    //println(cmMsec);


    println(num);


    // 在 (x, y) 座標為 (sensorValue, 80) 的位置畫一個 50x50 的矩形

    //background(255); // 白色背景

    //fill(255,0,0);   // 填滿顏色為紅色

    //rect(cmMsec, 80, 50, 50);
    delay(100);
    
    if(cmMsec<50){
    groove.play();
    }
    else{
    groove.pause();
    }
  } 

}
void keyPressed()
{
  if ( key == 'c' ){ 
  num++;
  groove = minim.loadFile(num +".mp3", 2048);
      groove.pause();
 if(num==6){
  num = 1 ;
 }
  }

}