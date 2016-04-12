public void setup() {
  size(1200, 800);
}

private double growProb=1;
private double angleMod=60;
private int counter=0;

public void draw() {
  background(255);
  angleMod+=10;
  println(angleMod);
  //angleMod+=Math.random()*4;
  drawTree(600, 400, 0, 150);
  drawTree(600, 400, 90, 150);
  drawTree(600, 400, 180, 150);
  drawTree(600, 400, 270, 150);
  delay(500);
  counter++;
  if (counter%1==0) {
    //growProb-=.001;
  }
}

private void drawTree(double startX, double startY, double angle, double length) {
  if (length<.5) {
    return;
  } else {
    //double angleMod=30;
    double lengthMod=1.5;//...1.5 works but 3/2 doesn't?
    //double growProb=.95;

    double angle1=angle+angleMod;
    double angle2=angle-angleMod;
    double angle1Rad=Math.toRadians(angle1);
    double angle2Rad=Math.toRadians(angle2);
    double dX1=length*Math.cos(angle1Rad);
    double dY1=length*Math.sin(angle1Rad);
    double dX2=length*Math.cos(angle2Rad);
    double dY2=length*Math.sin(angle2Rad);

    //prdoubleln(angle1Rad+","+angle2Rad);
    //prdoubleln(length*Math.sin(angle2Rad)+","+length*Math.sin(angle2Rad));

    double endX1=startX+(double)dX1;
    double endY1=startY+(double)dY1;
    double endX2=startX+(double)dX2;
    double endY2=startY+(double)dY2;
    line((float)startX, (float)startY, (float)endX1, (float)endY1);
    line((float)startX, (float)startY, (float)endX2, (float)endY2);

    if (Math.random()<growProb) {
      drawTree(endX1, endY1, angle1, length/lengthMod);
    }
    if (Math.random()<growProb) {
      drawTree(endX2, endY2, angle2, length/lengthMod);
    }
  }
}