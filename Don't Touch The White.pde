Ball[] balls = new Ball[10];
float gravity = 0.1;
int cnt = 0;
int score = 0;
boolean stop = true;
boolean start = false;
boolean textBig = false;
boolean textBig2 = false;
void setup() {
size(200,200);
smooth();
frameRate(30);
// Initialize ball index 0
balls[0] = new Ball(50,0,16);
balls[1] = new Ball(100,30,16);
balls[2] = new Ball(150,15,16);
balls[3] = new Ball(170,5,16);
balls[4] = new Ball(30,15,16);
balls[5] = new Ball(80,30,16);
balls[6] = new Ball(120,15,16);
balls[7] = new Ball(190,5,16);
balls[8] = new Ball(200,5,16);
balls[9] = new Ball(0,5,16);
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
 for(int x = 50; x<150; x++){
   for(int y = 90; y<115; y++){
     if(MouseOver(x,y,mouseX,mouseY))  return true;
   }
 }
 return false;
}

boolean check2(){
for(int x = 40; x<150; x++){
   for(int y = 150; y<160; y++){
     if(MouseOver(x,y,mouseX,mouseY))  return true;
   }
 }
 return false;
}


void draw() {
background(100);
// Update anddisplay all balls
if(!(start)){
  if(check()){
  PFont f = createFont("Vani", 50);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("START", 100, 100);}
  else{
  PFont f = createFont("Vani", 30);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("START", 100, 100);}}
else{
if(stop){
for (int i = 0; i < balls.length; i ++ ) {
  balls[i].gravity();
balls[i].move();
balls[i].display();
score++;
}}
else{
  if(!(check2())){
   PFont f = createFont("Vani", 30);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 100, 50);
   f = createFont("Vani", 20);
  textFont(f);
  text("Score :: " + (int)(score/240) + " seconds", 100, 100);
  textFont(f);
  text("Try Again?", 100, 150);}
  else{ PFont f = createFont("Vani", 30);
  textFont(f);
  textAlign(CENTER, CENTER);
  text("GAME OVER", 100, 50);
   f = createFont("Vani", 20);
  textFont(f);
  text("Score :: " + (int)(score/240) + " seconds", 100, 100);
  f = createFont("Vani",30);
  textFont(f);
  text("Try Again?", 100, 150);}
}
}
  
}
void mousePressed() {
  for(int x = 50; x<150;x++){
    for(int y = 90; y<115; y++){
    if(MouseOver(x,y,mouseX,mouseY)) start = true;}}
    
    for(int z = 40; z<150; z++){
   for(int w = 150; w<160; w++){
     if(MouseOver(z,w,mouseX,mouseY)) {stop = true;score = 0;
   balls[0] = new Ball((int)random(200),0,16);
balls[1] = new Ball((int)random(200),30,16);
balls[2] = new Ball((int)random(200),15,16);
balls[3] = new Ball((int)random(200),5,16);
balls[4] = new Ball((int)random(200),15,16);
balls[5] = new Ball((int)random(200),30,16);
balls[6] = new Ball((int)random(200),15,16);
balls[7] = new Ball((int)random(200),5,16);
balls[8] = new Ball((int)random(200),5,16);
balls[9] = new Ball((int)random(200),5,16);}
   }
    
}}
class Ball {
float x;
float y;
float speed;
float w;

Ball(float tempX, float tempY, float tempW) {
x = tempX;
y = tempY;
w = tempW;
speed = 0;
}
void check(){
for (int i = 0; i < balls.length; i ++ ) {
  if(overCircle(balls[i].giveX(),balls[i].giveY(),16,mouseX,mouseY)) {stop = false;}
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
for(int x = 0; x < balls.length; x++)
{int j = int(random(200));
if (balls[x].y > height) {
 balls[x] = new Ball(j,0,20); cnt++;
}
for(int y = 0; y < balls.length; y++) balls[y].check();

}}
void display() {
// Display the circle
fill(255);
noStroke();
ellipse(x,y,w,w);
fill(255);
  f = createFont("Vani", 30);
  textFont(f);
  text((int)(score/240),20,20);
}

}
