// Emma Delucchi

import org.gicentre.geomap.*;
 
GeoMap geoMap;                // Declare the geoMap object.
PFont theFont;

Table table;
int[] hdiRank;
String[] countryNames;
float[] values1995;
float[] values2000;
float[] values2005;
float[] values2010;
float[] values2015;

int[] xPos;
int[] yPos;

float overallMinM;
float overallMaxM;
float overallMinF;
float overallMaxF;
float overallMax;
float overallMin;

int rows = 11;
int bar = -1;
int textX = 647;
int textY = 95;

boolean[] pressedCountry;
boolean pressedBack;

void settings(){
  size(1400, 700);
}
 
void setup()
{
  geoMap = new GeoMap(this);  // Create the geoMap object.
  geoMap.readFile("world");   // Reads shapefile.
  
  //Init all the arrays
  pressedCountry = new boolean[rows];
  hdiRank = new int[rows];
  countryNames = new String[rows];
  values1995 = new float[rows];
  values2000 = new float[rows];
  values2005 = new float[rows];
  values2010 = new float[rows];
  values2015 = new float[rows];
  xPos = new int[rows];
  yPos = new int[rows];
  
  // The font "andalemo.ttf" must be located in the 
  // current sketch's "data" directory to load successfully
  theFont = createFont("Rubik-Regular.ttf", 18);
  textFont(theFont);
    
  pressedBack = false;
  
  
  //Init the table
  table = loadTable("gender_inequality_index.csv");
  rows = table.getRowCount();
  
  print(rows);
  for(int i=0; i<rows; i++){
    //Get data for each country
    pressedCountry[i] = false;
    TableRow row = table.getRow(i);
    hdiRank[i] = row.getInt(0);
    countryNames[i] = row.getString(1);
    values1995[i] = row.getFloat(2);
    values2000[i] = row.getFloat(3);
    values2005[i] = row.getFloat(4);
    values2010[i] = row.getFloat(5);
    values2015[i] = row.getFloat(6);
  }
  
  //Set positions for each dot
  xPos[0] = 1210;
  yPos[0] = 447;
  xPos[1] = 1092;
  yPos[1] = 204;
  xPos[2] = 1244;
  yPos[2] = 200;
  xPos[3] = 1096;
  yPos[3] = 331;
  xPos[4] = 753;
  yPos[4] = 92;
  xPos[5] = 731;
  yPos[5] = 152;
  xPos[6] = 831;
  yPos[6] = 339;
  xPos[7] = 807;
  yPos[7] = 123;
  xPos[8] = 694;
  yPos[8] = 123;
  xPos[9] = 303;
  yPos[9] = 183;
  xPos[10] = 877;
  yPos[10] = 278;
}
 
void draw()
{ 
  if (pressedCountry[0] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(0);
    }
  }
  else if (pressedCountry[1] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(1);
    }
  }
  else if (pressedCountry[2] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(2);
    }
  }
  else if (pressedCountry[3] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(3);
    }
  }
  else if (pressedCountry[4] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(4);
    }
  }
  else if (pressedCountry[5] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(5);
    }
  }
  else if (pressedCountry[6] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(6);
    }
  }
  else if (pressedCountry[7] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(7);
    }
  }
  else if (pressedCountry[8] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(8);
    }
  }
  else if (pressedCountry[9] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(9);
    }
  }
  else if (pressedCountry[10] == true){
    if (pressedBack == true){
      pressedBack = false;
      drawMap();
    }
    else{
      drawGraph(10);
    }
  }
  else{
    drawMap();
  }
  
  //I think this is resetting everything
  if (pressedBack == true){
    for(int i = 0; i<rows; i++){
      pressedCountry[i] = false;
    }  
  }
  
}

void drawMap(){
  background(100, 149, 237);
  geoMap.draw();              // Draw the entire map.
  stroke(255, 0, 0); //Turn to red to draw dots
  fill(255,0,0);
  
  //Now you can draw the dots
  for(int i = 0; i < rows; i++){
    ellipse(xPos[i], yPos[i], 20, 20);
  }
  
  fill(255,255,255); //Makes center of countries white again

  //text(mouseX + ", " + mouseY, mouseX, mouseY);
    fill(0);
  stroke(0);// Turns text to black to 
}

void drawGraph(int country){
  background(255,222,173);
  // Make title 
  text(countryNames[country], textX, textY);
  
  //Make lines and axis labels
  stroke(0);
  line(200, 100, 200, 600);
  line(200, 600, 1250, 600);
  text("0.0", 170, 600);
  text("1.0", 170, 100);
  text("1995", 385, 625);
  text("2000", 585, 625);
  text("2005", 785, 625);
  text("2010", 985, 625);
  text("2015", 1185, 625);
  line(400, 590, 400, 610);
  line(600, 590, 600, 610);
  line(800, 590, 800, 610);
  line(1000, 590, 1000, 610);
  line(1200, 590, 1200, 610);
  
  //Draw whatever points correspond to each country, along with text
  int mapY1995 = int(map(values1995[country], 0.0, 1.0, 600.0, 100.0));
  ellipse(400, mapY1995, 10,10);
  text(values1995[country], 410, mapY1995);
  int mapY2000 = int(map(values2000[country], 0.0, 1.0, 600.0, 100.0));
  ellipse(600, mapY2000, 10,10);
  text(values2000[country], 610, mapY2000);
  int mapY2005 = int(map(values2005[country], 0.0, 1.0, 600.0, 100.0));
  ellipse(800, mapY2005, 10,10);
  text(values2005[country], 810, mapY2005);
  int mapY2010 = int(map(values2010[country], 0.0, 1.0, 600.0, 100.0));
  ellipse(1000, mapY2010, 10,10);
  text(values2010[country], 1010, mapY2010);
  int mapY2015 = int(map(values2015[country], 0.0, 1.0, 600.0, 100.0));
  ellipse(1200, mapY2015, 10,10);
  text(values2015[country], 1210, mapY2015);
  
  //Perhaps make lines 
  line(400, mapY1995, 600, mapY2000);
  line(600, mapY2000, 800, mapY2005);
  line(800, mapY2005, 1000, mapY2010);
  line(1000, mapY2010, 1200, mapY2015);
  
  //make button
  stroke(0);
  fill(255);
  rect(30, 540, 90, 40, 7);
  fill(0);
  
  text("BACK", 50, 565);
  
}

void mouseClicked(){
  //if clicked within Australia
  if (mouseX <= (xPos[0]+30) && mouseX >= (xPos[0]-30) && mouseY >= (yPos[0]-30) && mouseY <= (xPos[0]+30)){
    pressedCountry[0] = true;
    bar = 0;
  }
    //if clicked within China
  else if (mouseX <= (xPos[1]+30) && mouseX >= (xPos[1]-30) && mouseY >= (yPos[1]-30) && mouseY <= (xPos[1]+30)){
    println("China Clicked");
    pressedCountry[1] = true;
    bar = 1;
  }
      //if clicked within Japan
  else if (mouseX <= (xPos[2]+30) && mouseX >= (xPos[2]-30) && mouseY >= (yPos[2]-30) && mouseY <= (xPos[2]+30)){
    pressedCountry[2] = true;
    bar = 2;
  }
   //if clicked within Malaysia
  else if (mouseX <= (xPos[3]+30) && mouseX >= (xPos[3]-30) && mouseY >= (yPos[3]-30) && mouseY <= (xPos[3]+30)){
    pressedCountry[3] = true;
    bar = 3;
  }
        //if clicked within Sweden
  else if (mouseX <= (xPos[4]+30) && mouseX >= (xPos[4]-30) && mouseY >= (yPos[4]-30) && mouseY <= (xPos[4]+30)){
    pressedCountry[4] = true;
    bar = 4;
  }
        //if clicked within Switzerland
  else if (mouseX <= (xPos[5]+30) && mouseX >= (xPos[5]-30) && mouseY >= (yPos[5]-30) && mouseY <= (xPos[5]+30)){
    pressedCountry[5] = true;
    bar = 5;
  }
        //if clicked within JTanzania
  else if (mouseX <= (xPos[6]+30) && mouseX >= (xPos[6]-30) && mouseY >= (yPos[6]-30) && mouseY <= (xPos[6]+30)){
    pressedCountry[6] = true;
    bar = 6;
  }
        //if clicked within Ukraine
  else if (mouseX <= (xPos[7]+30) && mouseX >= (xPos[7]-30) && mouseY >= (yPos[7]-30) && mouseY <= (xPos[7]+30)){
    pressedCountry[7] = true;
    bar = 7;
  }
        //if clicked within UK
  else if (mouseX <= (xPos[8]+30) && mouseX >= (xPos[8]-30) && mouseY >= (yPos[8]-30) && mouseY <= (xPos[8]+30)){
    pressedCountry[8] = true;
    bar = 8;
  }
        //if clicked within US
  else if (mouseX <= (xPos[9]+30) && mouseX >= (xPos[9]-30) && mouseY >= (yPos[9]-30) && mouseY <= (xPos[9]+30)){
    pressedCountry[9] = true;
    bar = 9;
  }
        //if clicked within Yemen
  else if (mouseX <= (xPos[10]+30) && mouseX >= (xPos[10]-30) && mouseY >= (yPos[10]-30) && mouseY <= (xPos[10]+30)){
    pressedCountry[10] = true;
    bar = 10;
  }
  
  else if (mouseX <= 30 && mouseX >= (0) && mouseY >= (0) && mouseY <= (30)){
    pressedCountry[10] = true;
    bar = 10;
  }
  
  //if clicked back button
  else if(mouseX >=30 && mouseX<= 120 && mouseY >= 540 && mouseY <= 580){
    println("back button clicked");
    pressedBack = true;
    for(int i = 0; i<rows; i++){
      pressedCountry[i] = false;
    }
  }
}
