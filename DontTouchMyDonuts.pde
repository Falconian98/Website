/* removed the class block and any import statements */

Donut[] donuts = new Donut[15];
float gravity = 0.1;
int cnt = 0;
int score = 0;
boolean stop = true;
boolean start = false;
boolean textBig = false;
boolean textBig2 = false;

PShape Donut;

void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  
// Variable Initialization   
Donut = loadShape("http://raw.githubusercontent.com/Falconian98/Website/gh-pages/Donut.svg");  // Donut equals loadShape("Donut.svg")

  // Initialize Donut index 0
  donuts[0] = new Donut(50,0,16);
  donuts[1] = new Donut(100,30,16);
  donuts[2] = new Donut(150,15,16);
  donuts[3] = new Donut(200,5,16);
  donuts[4] = new Donut(130,15,16);
  donuts[5] = new Donut(180,30,16);
  donuts[6] = new Donut(220,15,16);
  donuts[7] = new Donut(290,5,16);
  donuts[8] = new Donut(300,15,16);
  donuts[9] = new Donut(350,30,16);
  donuts[10] = new Donut(75,15,16);
  donuts[11] = new Donut(250,5,16);
  donuts[12] = new Donut(325,15,16);
  donuts[13] = new Donut(375,30,16);
  donuts[14] = new Donut(240,15,16);
}

boolean overCircle(int x, int y, int diameter, int z, int w) {
  float disX = x - z;
  float disY = y - w;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ){
    return true;
  } else {
    return false;
  }}

boolean MouseOver(int x, int y, int z, int w)
{
  float disX = x - z;
  float disY = y - w;
  if (sqrt(sq(disX) + sq(disY)) < 5 ){
    return true;
  } else {
    return false;}
}

boolean check() {
 for(int x = 100; x<300; x++){
   for(int y = 250; y<350; y++){
     if(MouseOver(x,y,mouseX,mouseY))  return true;
   }
 }
 return false;
}

boolean check2(){
for(int x = 100; x<300; x++){
   for(int y = 200; y<300; y++){
     if(MouseOver(x,y,mouseX,mouseY))  return true;
   }
 }
 return false;
}


void draw() {
background(100);
// Update and display all donuts
if(!(start)){
  if(check()){
  PFont f = createFont("Vani", 100);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("START", 200, 250);
   f = createFont("Vani", 50);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("Don't Touch My", 200, 100);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("Donuts!", 200, 150);}
  else{
  PFont f = createFont("Vani", 60);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("START", 200, 250);
    f = createFont("Vani", 50);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("Don't Touch My", 200, 100);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("Donuts!", 200, 150);}}
else{
if(stop){
for (int i = 0; i < donuts.length; i ++ ) {
  donuts[i].gravity();
  donuts[i].move();
  donuts[i].display();
  score++;
}}
else{
  if(!(check2())){
   PFont f = createFont("Vani", 30);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 200, 100);
   f = createFont("Vani", 20);
  textFont(f);
  text("Score :: " + (int)(score/240) + " seconds", 200, 175);
  textFont(f);
  text("Try Again?", 200, 250);}
  else{ PFont f = createFont("Vani", 30);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 200, 100);
   f = createFont("Vani", 20);
  textFont(f);
  text("Score :: " + (int)(score/240) + " seconds", 200, 175);
  f = createFont("Vani", 60);
  textFont(f);
  text("Try Again?", 200, 250);}
}
}
  
}
void mousePressed() {
  for(int x = 100; x<300;x++){
    for(int y = 250; y<300; y++){
    if(MouseOver(x,y,mouseX,mouseY)) start = true;}}
    
    for(int z = 50; z<300; z++){
   for(int w = 200; w<300; w++){
     if(MouseOver(z,w,mouseX,mouseY)) {stop = true;score = 0;
donuts[0] = new Donut((int)random(400),0,16);
donuts[1] = new Donut((int)random(400),60,16);
donuts[2] = new Donut((int)random(400),30,16);
donuts[3] = new Donut((int)random(400),10,16);
donuts[4] = new Donut((int)random(400),30,16);
donuts[5] = new Donut((int)random(400),60,16);
donuts[6] = new Donut((int)random(400),30,16);
donuts[7] = new Donut((int)random(400),10,16);
donuts[8] = new Donut((int)random(400),30,16);
donuts[9] = new Donut((int)random(400),60,16);
donuts[10] = new Donut((int)random(400),30,16);
donuts[11] = new Donut((int)random(400),10,16);
donuts[12] = new Donut((int)random(400),30,16);
donuts[13] = new Donut((int)random(400),60,16);
donuts[14] = new Donut((int)random(400),30,16);
}
   }
    
}}
class Donut {
float x;
float y;
float speed;
float w;

Donut(float tempX, float tempY, float tempW) {
x = tempX;
y = tempY;
w = tempW;
speed = 0;
}
void check(){
for (int i = 0; i < donuts.length; i ++ ) {
  if(overCircle(donuts[i].giveX(),donuts[i].giveY(),16,mouseX,mouseY)) {stop = false;}
}
}
int giveX(){
  return (int)(x);
}
int giveY(){
  return (int)(y);
}
void gravity() {
// Add gravity to speed
float gravity = (float)(random(1));
speed += gravity;
}
void move() {
  cnt++;
// Add speed to y location
y = y + speed;
// If square reaches the bottom
// Reverse speed
for(int x = 0; x < donuts.length; x++)
{int j = int(random(400));
if (donuts[x].y > height) {
 donuts[x] = new Donut(j,0,20); cnt++;
}
for(int y = 0; y < donuts.length; y++) donuts[y].check();

}}
void display() {
// Display the Donut
fill(255);
noStroke();
shape(Donut,x,y,50,50);
fill(255);
  PFont f = createFont("Vani", 50);
  textFont(f);
  text((int)(score/240),30,30);
}

}
