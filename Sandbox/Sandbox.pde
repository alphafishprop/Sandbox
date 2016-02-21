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
 new int[]{730,355,825,355},
 new int[]{825,355,775,390},
 new int[]{730,355,775,390},
};

int[][][] room_lines=new int[][][]{roomEdges, chair, face_smile};

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
  drawLines();
  drawCircles();
  for (ArrayList<Integer> coors : mousePos) {
    int x1=coors.get(0);
    int y1=coors.get(1);
    int x2=coors.get(2);
    int y2=coors.get(3);
    line(x1, y1, x2, y2);
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

void drawCircles(){
  for(int[][] object_circles:room_circles){
    if(object_circles[0][0]==1){
      for(int i=1;i<object_circles.length;i++){
        int[] circle=object_circles[i];
        int x1=circle[0];
        int y1=circle[1];
        int x2=circle[2];
        int y2=circle[3];
        
        int dX=x2-x1;
        int dY=y2-y1;
        int diameter=(int)Math.sqrt(Math.pow(dX,2)+Math.pow(dY,2));
        
        ellipse(x1,y1,diameter,diameter);
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

void mouseMoved() {
  background(255);
  draw();
  if (mouseX1!=-1) {
    line(mouseX1, mouseY1, mouseX, mouseY);
  }
}

void keyPressed() {
  if (key=='c'&&mousePos.size()>0) {
    mousePos.remove(mousePos.size()-1);
  } else if (key=='p') {
    printObjects();
  }
}

void printObjects() {
  for (ArrayList<Integer> coors : mousePos) {
    println("new int[]{"+coors.get(0)+","+coors.get(1)+","+coors.get(2)+","+coors.get(3)+"},");
  }
}