import java.util.ArrayList;


int mouseX1, mouseY1;

ArrayList<ArrayList<Integer>> mousePos;

int[][] roomEdges=new int[][]{
  new int[]{1}, 
  new int[]{2, 798, 232, 498}, 
  new int[]{232, 498, 232, 498}, 
  new int[]{233, 498, 902, 500}, 
  new int[]{902, 500, 1199, 796}, 
  new int[]{903, 500, 908, 175}, 
  new int[]{232, 499, 232, 187}, 
  new int[]{232, 187, 907, 180}, 
  new int[]{907, 180, 1199, 0}, 
  new int[]{233, 188, 6, 2}, 
};

int[][] chair=new int[][]{
  new int[]{1}, 
  new int[]{251, 528, 252, 448}, 
  new int[]{252, 448, 310, 448}, 
  new int[]{311, 448, 310, 525}, 
  new int[]{267, 499, 267, 425}, 
  new int[]{329, 498, 330, 426}, 
  new int[]{253, 448, 267, 426}, 
  new int[]{311, 448, 330, 427}, 
  new int[]{330, 427, 267, 426}, 
  new int[]{267, 426, 267, 354}, 
  new int[]{266, 354, 331, 354}, 
  new int[]{331, 354, 329, 426}, 
};

int[][] face_smile=new int[][]{
  new int[]{1}, 
  new int[]{730, 355, 825, 355}, 
  new int[]{825, 355, 775, 390}, 
  new int[]{730, 355, 775, 390}, 
};

static int[][] table=new int[][]{
    new int[]{1}, 
    new int[]{496, 516, 470, 615}, 
    new int[]{470, 615, 547, 615}, 
    new int[]{547, 615, 567, 516}, 
    new int[]{497, 515, 566, 517}, 
    new int[]{471, 615, 471, 702}, 
    new int[]{546, 614, 545, 699}, 
    new int[]{566, 516, 564, 599}, 
  };

  static int[][] powder=new int[][]{
    new int[]{1}, 
    new int[]{504, 523, 504, 523}, 
    new int[]{519, 526, 519, 526}, 
    new int[]{519, 521, 519, 521}, 
    new int[]{519, 521, 517, 525}, 
    new int[]{517, 525, 513, 521}, 
    new int[]{513, 521, 512, 527}, 
    new int[]{512, 527, 512, 527}, 
    new int[]{509, 530, 509, 530}, 
    new int[]{516, 530, 516, 530}, 
    new int[]{507, 526, 507, 526}, 
    new int[]{508, 517, 508, 517}, 
    new int[]{521, 526, 521, 526}, 
    new int[]{510, 532, 510, 532}, 
    new int[]{515, 519, 515, 519}, 
    new int[]{510, 525, 509, 522}, 
    new int[]{509, 522, 507, 525}, 
    new int[]{512, 528, 516, 528}, 
    new int[]{514, 534, 514, 534}, 
    new int[]{506, 530, 506, 530}, 
    new int[]{511, 535, 511, 534}, 
    new int[]{511, 534, 510, 537}, 
    new int[]{507, 533, 507, 533}, 
    new int[]{516, 532, 519, 530}, 
    new int[]{520, 532, 519, 533}, 
    new int[]{508, 529, 511, 524}, 
    new int[]{514, 530, 509, 532}, 
  };
  
   static int[][] rug=new int[][]{
    new int[]{1}, 
    new int[]{51, 799, 218, 564}, 
    new int[]{218, 564, 421, 564}, 
    new int[]{421, 564, 295, 799}, 
    //right frills
    new int[]{422, 565, 439, 565}, //x increments -7, y increments 13
    new int[]{415, 578, 432, 578}, 

    //top frills
    new int[]{218, 563, 228, 551}, 
    new int[]{230, 563, 240, 551}, 
    new int[]{242, 563, 252, 551}, 
    new int[]{254, 563, 264, 551}, 
    new int[]{266, 563, 276, 551}, 
    new int[]{278, 563, 288, 551}, 
    new int[]{290, 563, 300, 551}, 
    new int[]{302, 563, 312, 551}, 
    new int[]{314, 563, 324, 551}, 
    new int[]{326, 563, 336, 551}, 
    new int[]{340, 563, 350, 551}, 
    new int[]{352, 563, 362, 551}, 
    new int[]{364, 563, 374, 551}, 
    new int[]{376, 563, 386, 551}, 
    new int[]{388, 563, 398, 551}, 
    new int[]{400, 563, 410, 551}, 
    new int[]{412, 563, 422, 551}, 
    new int[]{422, 563, 432, 551}, 
    new int[]{218, 563, 228, 551}, //x increments 12
    new int[]{230, 563, 240, 551}, 
    new int[]{242, 563, 252, 551}, 
    new int[]{254, 563, 264, 551}, 
    new int[]{266, 563, 276, 551}, 
    new int[]{278, 563, 288, 551}, 
    new int[]{290, 563, 300, 551}, 
    new int[]{302, 563, 312, 551}, 
    new int[]{314, 563, 324, 551}, 
    new int[]{326, 563, 336, 551}, 
    new int[]{340, 563, 350, 551}, 
    new int[]{352, 563, 362, 551}, 
    new int[]{364, 563, 374, 551}, 
    new int[]{376, 563, 386, 551}, 
    new int[]{388, 563, 398, 551}, 
    new int[]{400, 563, 410, 551}, 
    new int[]{412, 563, 422, 551}, 
    new int[]{422, 563, 432, 551}, 
    //left frills
    new int[]{218, 564, 203, 564}, 
    new int[]{211, 572, 196, 572}, 
  };

int[][][] room_lines=new int[][][]{roomEdges, chair, face_smile, table, powder,rug};

int[][] face_circles=new int[][]{
  new int[]{1}, 
  new int[]{775, 333, 900, 332}, 
  new int[]{800, 310, 832, 310}, 
  new int[]{750, 310, 782, 310}, 
};

int[][][] room_circles=new int[][][]{face_circles};

void setup() {
  size(1200, 800);
  background(255);
  mouseX1=-1;
  mouseY1=-1;
  mousePos=new ArrayList();
  noFill();
}

void draw() {
  background(255);
  drawLines();
  drawCircles();
  for (ArrayList<Integer> coors : mousePos) {
    int x1=coors.get(0);
    int y1=coors.get(1);
    int x2=coors.get(2);
    int y2=coors.get(3);
    line(x1, y1, x2, y2);
  }
  if (mouseX1!=-1) {
    line(mouseX1, mouseY1, mouseX, mouseY);
  }
}

void drawLines() {
  for (int[][] object_lines : room_lines) {
    if (object_lines[0][0]==1) {
      for (int i=1; i<object_lines.length; i++) {
        int[] coors=object_lines[i];
        int x1=coors[0];
        int y1=coors[1];
        int x2=coors[2];
        int y2=coors[3];
        //println("x1,y1: "+x1+","+y1+"x2,y2: "+x2+","+y2);
        line(x1, y1, x2, y2);
      }
    }
  }
}

void drawCircles() {
  for (int[][] object_circles : room_circles) {
    if (object_circles[0][0]==1) {
      for (int i=1; i<object_circles.length; i++) {
        int[] circle=object_circles[i];
        int x1=circle[0];
        int y1=circle[1];
        int x2=circle[2];
        int y2=circle[3];

        int dX=x2-x1;
        int dY=y2-y1;
        int diameter=(int)Math.sqrt(Math.pow(dX, 2)+Math.pow(dY, 2));

        ellipse(x1, y1, diameter, diameter);
      }
    }
  }
}

void mouseClicked() {
  if (mouseX1!=-1) {
    ArrayList<Integer> coors=new ArrayList();
    coors.add(mouseX1);
    coors.add(mouseY1);
    coors.add(mouseX);
    coors.add(mouseY);
    mousePos.add(coors);
    mouseX1=-1;
    mouseY1=-1;
  } else {
    mouseX1=mouseX;
    mouseY1=mouseY;
  }
}

void keyPressed() {
  if (key=='c'&&mousePos.size()>0) {
    mousePos.remove(mousePos.size()-1);
  } else if (key=='p') {
    printObjects();
  } else if(key==CODED){
    if(keyCode==LEFT){
      moveHoriz(face_circles,-1);
      moveHoriz(face_smile,-1);
    } else if(keyCode==RIGHT){
      moveHoriz(face_circles,1);
      moveHoriz(face_smile,1);
    } else if(keyCode==UP){
      moveVert(face_circles,-1);
      moveVert(face_smile,-1);
    } else if(keyCode==DOWN){
      moveVert(face_circles,1);
      moveVert(face_smile,1);
    }
  }
}

void printObjects() {
  for (ArrayList<Integer> coors : mousePos) {
    println("new int[]{"+coors.get(0)+","+coors.get(1)+","+coors.get(2)+","+coors.get(3)+"},");
  }
}

void moveHoriz(int[][] object, int moveAmount){
  for(int j=1;j<object.length;j++){
    int[] part=object[j];
    for(int i=0;i<part.length;i+=2){
      part[i]+=moveAmount;
    }
  }
}

void moveVert(int[][] object, int moveAmount){
  for(int j=1;j<object.length;j++){
    int[] part=object[j];
    for(int i=1;i<part.length;i+=2){
      part[i]+=moveAmount;
    }
  }
}

void rotate(int[][] object,double angle){
  for(int i=1;i<object.length;i++){
    int[] part=object[i];
    
  }
}