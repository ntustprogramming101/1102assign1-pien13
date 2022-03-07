PImage bg, soil, life, groundhog, soldier, robot;
int soldierX, soldierY, robotX, robotY, laserX, d;


void setup() {
  
	size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundhog = loadImage("img/groundhog.png");
  soldier = loadImage("img/soldier.png");
  robot = loadImage("img/robot.png");
  
  soldierY = floor(random(2, 6)); //2,3,4,5
  
  robotX = floor(random(160, 560));
  robotY = floor(random(2, 6)); //2,3,4,5
  
  laserX = robotX - 40;
}

void draw() {
  
 //images bg,grass,soil,life
image(bg, 0,0);
  fill(124, 204, 25);
  rect(0,145,640,15);
image(soil,0,160);
image(life,10,10);
image(life,80 ,10);
image(life,150,10);
	
  pushMatrix();
  translate(590,50);
  
  //inner sun
  noStroke();
  fill(255, 255, 0);
  ellipse(0,0,120,120);
  
  //outer sun
  fill(253, 184, 19);
  ellipse(0,0,115,115);
  
  popMatrix();
  
  //image hog
  image(groundhog, 280,80);
  
  //image soldier
  soldierX = soldierX+1; 
  soldierX %= 640;
  image(soldier, soldierX++, soldierY*80);
  
  //image robot
  image(robot, robotX, robotY*80);
  
  d += 2;
  d %= 185;
  laserX = robotX - d;
  
  
  arc(laserX, robotY*80+37, 10, 10, radians(90), radians(270), OPEN);
  rect(laserX, robotY*80+37-5,30,10);
  arc(laserX+30, robotY*80+37, 10, 10, PI+HALF_PI, TWO_PI+HALF_PI, OPEN);
  
}
