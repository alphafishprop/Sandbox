import java.util.ArrayList;


int mouseX1, mouseY1;

ArrayList<ArrayList<Integer>> mousePos;

void setup() {
  size(1200, 800);
  background(255);
  mouseX1=-1;
  mouseY1=-1;
  mousePos=new ArrayList();
}

void draw() {
  for (ArrayList<Integer> coors : mousePos) {
    int x1=coors.get(0);
    int y1=coors.get(1);
    int x2=coors.get(2);
    int y2=coors.get(3);
    line(x1, y1, x2, y2);
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
  if (mouseX1!=-1) {
    line(mouseX1,mouseY1,mouseX,mouseY);
  }
}

void keyPressed(){
  if(key=='c'&&mousePos.size()>0){
    mousePos.remove(mousePos.size()-1);
  }
  else if(key=='p'){
    for(ArrayList<Integer> coors:mousePos){
      println("new int[]{"+coors.get(0)+","+coors.get(1)+","+coors.get(2)+","+coors.get(3)+"};");
    }
  }
}