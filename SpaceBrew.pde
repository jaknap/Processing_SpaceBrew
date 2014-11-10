import spacebrew.*;

Spacebrew spacebrewConnection;
String server="sandbox.spacebrew.cc"; //connect to sandbox (playground)
String name="Space / Processing / Fuzzy Test 2";
String description ="Web To Processing";
int redVal = 0;
int greenVal = 0;
int blueVal = 0;
void setup() {
  
  size(640,480);
  
  //CREATE SPACEBREW
  spacebrewConnection = new Spacebrew( this );
  
  //ADD PUBLISH/SUBSCRIBE
  spacebrewConnection.addSubscribe( "slider1", "range");
  spacebrewConnection.addSubscribe( "slider2", "range");
  spacebrewConnection.addSubscribe( "slider3", "range");
  //CONNECT SPACEBREW
  spacebrewConnection.connect("ws://"+server+":9000", name, description );
  
}


void draw() {
  background(redVal,greenVal,blueVal);
  textSize(42);
  fill(0,255,0);
  text("Test",100,100);
}


void onRangeMessage( String name, int value ){
  println("got int message " + name + " : " + value);
  if (name.equals("slider1") == true) {
    if (value >= 0 && value <= 255) {
      redVal = value;
    }
  }
  
  if (name.equals("slider2") == true) {
    if (value >= 0 && value <= 255) {
      greenVal = value;
    }
  }
  
  if (name.equals("slider3") == true) {
    if (value >= 0 && value <= 255) {
      blueVal = value;
    }
  }
  }
 
