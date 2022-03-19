PImage bg, soil, life, groundhog, soldier, robot;
int soldierX, soldierY;
int robotX, robotY;
int laserXStart, laserMove, laserXEnd;

void setup() {
  
  size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundhog = loadImage("img/groundhog.png");
  soldier = loadImage("img/soldier.png");
  robot = loadImage("img/robot.png");
  
  soldierY = floor(random(2,6));  
  robotX = floor(random(160, 560));  
  robotY = floor(random(2,6));  

}

void draw(){
  
  noStroke();
  
  //bg
  image(bg, 0,0);
  //grass
  fill(124, 204, 25);
  rect(0, 145, 640, 15);
  //soil
  image(soil, 0, 160);
  //life1,2,3
  image(life, 10, 10);
  image(life, 80, 10);
  image(life, 150, 10);  
  //outer sun
  fill(255, 255, 0);
  ellipse(width-50, 50, 130, 130);  
  //inner sun
  fill(253, 184, 19);
  ellipse(width-50, 50, 120, 120);
  //groundhog
  image(groundhog, 280, 80);
  
  //soldier
  soldierX = soldierX+1;
  if (soldierX > 640){
    soldierX = -80;
  }
  image(soldier, soldierX++, soldierY*80);
  
  //robot
  image(robot, robotX, robotY*80);
  
  //laser
  laserXStart = robotX + 25;
  laserMove += -2;
  laserMove %= 185;
  laserXStart += laserMove;
  
  laserXEnd = laserXStart + 40;
  if (laserXEnd + laserMove > laserXStart){
    laserXEnd = robotX + 25;
  }
  
  strokeWeight(10);
  stroke(255, 0, 0);
  line(laserXStart, robotY*80+37,laserXEnd, robotY*80+37);

}
