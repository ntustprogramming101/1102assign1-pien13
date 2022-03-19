PImage bg, soil, life, groundhog, soldier, robot;
int soldierX, soldierY; //士兵
int robotX, robotY; //機器人
int laserX, laserOffset; //雷射光、雷射光偏移量

void setup() {
  
  size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundhog = loadImage("img/groundhog.png");
  soldier = loadImage("img/soldier.png");
  robot = loadImage("img/robot.png");
  
  soldierY = floor(random(2, 6)); //士兵隨機出現在第2/3/4/5列(土地部分，一列80pix）
  
  robotX = floor(random(160, 560)); //機器人隨機出現在x軸，但起始點在x=160以後
  robotY = floor(random(2, 6)); //2,3,4,5
  
  laserX = robotX; //雷射光和機器人出現於同個點
  
  noStroke();
}

void draw() {
  
  image(bg, 0,0); //bg
  fill(124, 204, 25); //草
  rect(0,145,640,15);
  image(soil,0,160); //soil
  image(life,10,10); //life1
  image(life,80 ,10); //life2
  image(life,150,10); //life3
	
  pushMatrix();
  translate(590,50);
  
  //outer sun
  fill(255, 255, 0);
  ellipse(width-50, 50, 130, 130);  
  //inner sun
  fill(253, 184, 19);
  ellipse(width-50, 50, 120, 120);
  
  popMatrix();
  
  image(groundhog, 280,80); //groundhog
  
  //soldier
  soldierX = soldierX+1; //士兵前進
  if (soldierX>640){
  soldierX = -80;}  //在畫布內重複行走
  image(soldier, soldierX++, soldierY*80); //soldierY(列數) * 80pix = Y座標
  
  //robot
  image(robot, robotX, robotY*80); //robotY(列數) * 80pix = Y座標
  
  laserOffset += 2; //雷射光偏移量速度2pix
  laserOffset %= 185; //雷射光在格子80*2+25的範圍內重複
  laserX = robotX - laserOffset; //雷射光遠離robotX的距離隨著雷射光偏移量推進
  
  fill(255, 0, 0); //雷射光
  arc(laserX, robotY*80+37, 10, 10, radians(90), radians(270), OPEN);
  rect(laserX, robotY*80+37-5,30,10);
  arc(laserX+30, robotY*80+37, 10, 10, PI+HALF_PI, TWO_PI+HALF_PI, OPEN);
  
}
